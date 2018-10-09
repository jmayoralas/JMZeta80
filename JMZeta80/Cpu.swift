//
//  Cpu.swift
//  JMZeta80
//
//  Created by Jose Luis Fernandez-Mayoralas on 2/10/18.
//  Copyright © 2018 Jose Luis Fernandez-Mayoralas. All rights reserved.
//

import Foundation

// defines Z80 register structure
struct CpuRegs {
    var main = RegisterBank()
    var alternate = RegisterBank()
    
    var ix: UInt16 = 0
    var iy: UInt16 = 0
    var pc: UInt16 = 0
    var sp: UInt16 = 0
    var ir: UInt8 = 0
}

// main cpu class
public class Cpu {
    typealias OpcodeTable = [() -> Void]
    
    let bus: DataBus
    let clock: SystemClock
    
    var regs = CpuRegs()
    var opcodes = OpcodeTable(repeating: {}, count: 0x100)
    
    public init(bus: AccessibleBus, clock: SystemClock) {
        self.bus = DataBus(bus: bus, clock: clock)
        self.clock = clock
        
        initOpcodeTable()
        reset()
    }
    
    public func reset() {
        regs.pc = 0
        regs.sp = 0xFFFF
        regs.ix = 0xFFFF
        regs.iy = 0xFFFF
        
        regs.main = RegisterBank()
        regs.alternate = RegisterBank()
        
        clock.reset()
    }
    
    // fetch and execute opcode at PC
    public func executeNextOpcode() {
        regs.ir = _fetchOpcode()
        opcodes[Int(regs.ir)]()
    }
    
    private func _fetchOpcode() -> UInt8 {
        let opcode = bus.read(regs.pc)
        regs.pc = regs.pc &+ 1
        clock.add(cycles: 1)
        return opcode
    }
    
    func buildAddress(_ h: UInt8, _ l: UInt8) -> UInt16 {
        return (UInt16(h) << 8) + UInt16(l)
    }
    
    func addRelative(displacement: UInt8, toAddress address: UInt16) -> UInt16 {
        let abs_displ = displacement.comp2
        return abs_displ < 0 ? address &- UInt16(-abs_displ) : address &+ UInt16(abs_displ)
    }
}
