//
//  OpcodeTable.swift
//  JMZeta80
//
//  Created by Jose Luis Fernandez-Mayoralas on 4/10/18.
//  Copyright © 2018 Jose Luis Fernandez-Mayoralas. All rights reserved.
//

import Foundation

extension Cpu {
    func initOpcodeTable() {
        // nop
        opcodes[0x00] = {}
        // LD BC,&0000
        opcodes[0x01] = {
            self.regs.main.c = self.bus.read(self.regs.pc)
            self.regs.pc = self.regs.pc &+ 1
            self.regs.main.b = self.bus.read(self.regs.pc)
            self.regs.pc = self.regs.pc &+ 1
        }
        // IN A,(&00)
        opcodes[0xDB] = {
            self.regs.main.a = self.bus.ioRead(self.buildAddress(self.regs.main.a, self.bus.read(self.regs.pc)))
            self.regs.pc = self.regs.pc &+ 1
        }
    }
}
