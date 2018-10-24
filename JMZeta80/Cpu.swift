//
//  Cpu.swift
//  JMZeta80
//
//  Created by Jose Luis Fernandez-Mayoralas on 2/10/18.
//  Copyright © 2018 Jose Luis Fernandez-Mayoralas. All rights reserved.
//

import Foundation

// id opcode table
let table_NONE = 0
let table_XX = 1
let table_CB = 2
let table_XXCB = 3
let table_ED = 4

// defines Z80 register structure
struct CpuRegs {
    var main = RegisterBank()
    var alternate = RegisterBank()
    
    var xx: UInt16 = 0
    var ix: UInt16 = 0
    var iy: UInt16 = 0
    var pc: UInt16 = 0
    var sp: UInt16 = 0
    var ir: UInt8 = 0
    
    // Interrupt Vector
    var i: UInt8 = 0xFF
    
    // undocumented register for flag affection of scf/ccf opcodes
    var q : UInt8 = 0
}

struct InterruptStatus {
    var IFF1: Bool = false
    var IFF2: Bool = false
    var pending_execution: Bool = false
    var int_mode: Int = 0
}

// main cpu class
public class Cpu {
    typealias OpcodeTable = [() -> Void]
    
    let bus: DataBus
    let clock: SystemClock
    
    var regs = CpuRegs()
    var opcodes: [OpcodeTable]!
    
    var halted = false
    
    var interrupt_status = InterruptStatus()
    var int_req = false
    var nmi_req = false
    
    var id_opcode_table = table_NONE
    
    public init(bus: AccessibleBus, clock: SystemClock) {
        self.bus = DataBus(bus: bus, clock: clock)
        self.clock = clock
        
        opcodes = [OpcodeTable](repeating: OpcodeTable(repeating: {
            // by default, every undocumented and unimplemented opcode prefixed by DD or FD, will execute his equivalent in the un-prefixed opcode table
            // and NOP in the rest of cases
            if self.id_opcode_table == table_XX {
                self.opcodes[table_NONE][Int(self.regs.ir)]()
            }
        }, count: 0x100), count: 5)
        
        initOpcodeTable(&opcodes[table_NONE])
        initOpcodeTableCB(&opcodes[table_CB])
        initOpcodeTableED(&opcodes[table_ED])
        
        reset()
    }
    
    public func reset() {
        regs.pc = 0
        regs.sp = 0xFFFF
        regs.ix = 0xFFFF
        regs.iy = 0xFFFF
        
        regs.main = RegisterBank()
        regs.alternate = RegisterBank()
        
        halted = false
        
        interrupt_status.IFF1 = false
        interrupt_status.IFF2 = false
        interrupt_status.pending_execution = false
        interrupt_status.int_mode = 0
        int_req = false
        nmi_req = false
        
        clock.reset()
    }
    
    // fetch and execute opcode at PC
    public func executeNextOpcode() {
        // check for non maskable interrupt
        guard !ackNmi() else {
            return
        }
        
        // save flags register before execute the opcode
        let fBackup = self.regs.main.f
        
        if !ackInt() {
            interrupt_status.pending_execution = false
            
            repeat {
                fetchAndExec()
            } while id_opcode_table != table_NONE
        }
        
        // test for flags changes and update q register acordingly
        if id_opcode_table != table_NONE || (id_opcode_table == table_NONE && self.regs.ir != 0x37 && self.regs.ir != 0x3F) {
            self.regs.q = fBackup != self.regs.main.f ? 1 : 0
        }
    }
    
    func fetchAndExec() {
        regs.ir = _fetchOpcode()
        opcodes[id_opcode_table][Int(regs.ir)]()
    }
    
    private func _fetchOpcode() -> UInt8 {
        var opcode = bus.read(regs.pc)
        
        if halted {
            opcode = 0x00
        } else {
            regs.pc = regs.pc &+ 1
        }
        
        clock.add(cycles: 1)
        
        return opcode
    }
    
    func call(_ address: UInt16) {
        clock.add(cycles: 1)
        var sp = regs.sp &- 1
        bus.write(sp, value: regs.pc.high)
        sp = regs.sp &- 2
        bus.write(sp, value: regs.pc.low)
        regs.sp = regs.sp &- 2
        regs.pc = address
    }
    
    func ackNmi() -> Bool {
        guard nmi_req else {
            return false
        }
        
        // Acknowledge an interrupt
        if self.halted {
            self.regs.pc = self.regs.pc &+ 1
            self.halted = false
        }
        
        clock.add(cycles: 4)
        
        self.call(0x0066)
        
        self.interrupt_status.IFF2 = self.interrupt_status.IFF1
        self.interrupt_status.IFF1 = false
        
        self.nmi_req = false
        
        return true
    }
    
    func ackInt() -> Bool {
        guard int_req && interrupt_status.IFF1 && !interrupt_status.pending_execution else {
            return false
        }
        
        // Acknowledge an interrupt
        if halted {
            self.regs.pc = self.regs.pc &+ 1
            self.halted = false
        }
        
        clock.add(cycles: 6)
        
        switch interrupt_status.int_mode {
        case 0:
            // TODO: read next instruction from dataBus
            opcodes[id_opcode_table][Int(bus.getLastData())]()
        case 1:
            // do a RST 38
            opcodes[id_opcode_table][0xFF]()
        case 2:
            let vector_address = buildAddress(regs.i, bus.getLastData() & 0xFE) // reset bit 0 of the byte in dataBus to make sure we get an even address
            let routine_address = buildAddress(bus.read(vector_address + 1), bus.read(vector_address))
            
            self.call(routine_address)
        default:
            break
        }
        
        interrupt_status.IFF1 = false
        interrupt_status.IFF2 = false
        
        return true
    }
    
    func buildAddress(_ h: UInt8, _ l: UInt8) -> UInt16 {
        return (UInt16(h) << 8) + UInt16(l)
    }
    
    func addRelative(displacement: UInt8, toAddress address: UInt16) -> UInt16 {
        let abs_displ = displacement.comp2
        return abs_displ < 0 ? address &- UInt16(-abs_displ) : address &+ UInt16(abs_displ)
    }
}
