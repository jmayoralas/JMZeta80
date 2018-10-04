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
    let bus: DataBus
    let clock: SystemClock
    
    var regs = CpuRegs()
    var current_opcode = Opcode()
    
    public init(bus: AccessibleBus, clock: SystemClock) {
        self.bus = DataBus(bus: bus, clock: clock)
        self.clock = clock
        
        reset()
    }
    
    public func reset() {
        regs.pc = 0
        regs.sp = 0xFFFF
        clock.reset()
    }
}
