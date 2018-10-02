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
    var pc: UInt16 = 0
    var sp: UInt16 = 0
}

// main cpu class
public class Cpu {
    let bus: Bus
    let clock: SystemClock
    
    var regs = CpuRegs()
    
    public init(bus: Bus) {
        self.bus = bus
        self.clock = bus.getClock()
        
        reset()
    }
    
    public func reset() {
        regs.pc = 0
        regs.sp = 0xFFFF
        clock.reset()
    }
}
