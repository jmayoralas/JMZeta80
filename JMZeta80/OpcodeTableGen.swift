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
		opcodes[0x00] = {
			// nop
		}
		opcodes[0x01] = {
			// ld main.bc,&0000
			self.regs.main.bc = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			self.regs.pc &+= 2
		}
		opcodes[0x02] = {
		}
		opcodes[0x03] = {
		}
		opcodes[0x04] = {
		}
		opcodes[0x05] = {
		}
		opcodes[0x06] = {
		}
		opcodes[0x07] = {
		}
		opcodes[0x08] = {
			// ex af,af'
			let af_ = self.regs.alternate.af
			self.regs.alternate.af = self.regs.main.af
			self.regs.main.af = af_
		}
		opcodes[0x09] = {
			// add hl,main.bc
			self.clock.add(cycles: 7)
			let added_value = self.regs.main.bc
			let h_low = self.regs.main.h & 0x0F
			self.regs.main.hl &+= added_value
			self.regs.main.f.reset(bit: FLAG_N)
			if self.regs.main.hl < added_value {
				self.regs.main.f.set(bit: FLAG_C)
			} else {
				self.regs.main.f.reset(bit: FLAG_C)
			}
			if self.regs.main.h & 0x0F < h_low {
				self.regs.main.f.set(bit: FLAG_H)
			} else {
				self.regs.main.f.reset(bit: FLAG_H)
			}
		}
		opcodes[0x0A] = {
		}
		opcodes[0x0B] = {
		}
		opcodes[0x0C] = {
		}
		opcodes[0x0D] = {
		}
		opcodes[0x0E] = {
		}
		opcodes[0x0F] = {
		}
		opcodes[0x10] = {
			// djnz n
			self.clock.add(cycles: 1)
			let displ = self.bus.read(self.regs.pc)
			self.regs.pc &+= 1
			self.regs.main.b &-= 1
			if self.regs.main.b != 0 {
				self.clock.add(cycles: 5)
				self.regs.pc = self.addRelative(displacement: displ, toAddress: self.regs.pc)
			}
		}
		opcodes[0x11] = {
			// ld main.de,&0000
			self.regs.main.de = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			self.regs.pc &+= 2
		}
		opcodes[0x12] = {
		}
		opcodes[0x13] = {
		}
		opcodes[0x14] = {
		}
		opcodes[0x15] = {
		}
		opcodes[0x16] = {
		}
		opcodes[0x17] = {
		}
		opcodes[0x18] = {
			// jr &00
			let displ = self.bus.read(self.regs.pc)
			self.regs.pc &+= 1
			self.regs.pc = self.addRelative(displacement: displ, toAddress: self.regs.pc)
			self.clock.add(cycles: 5)
		}
		opcodes[0x19] = {
			// add hl,main.de
			self.clock.add(cycles: 7)
			let added_value = self.regs.main.de
			let h_low = self.regs.main.h & 0x0F
			self.regs.main.hl &+= added_value
			self.regs.main.f.reset(bit: FLAG_N)
			if self.regs.main.hl < added_value {
				self.regs.main.f.set(bit: FLAG_C)
			} else {
				self.regs.main.f.reset(bit: FLAG_C)
			}
			if self.regs.main.h & 0x0F < h_low {
				self.regs.main.f.set(bit: FLAG_H)
			} else {
				self.regs.main.f.reset(bit: FLAG_H)
			}
		}
		opcodes[0x1A] = {
		}
		opcodes[0x1B] = {
		}
		opcodes[0x1C] = {
		}
		opcodes[0x1D] = {
		}
		opcodes[0x1E] = {
		}
		opcodes[0x1F] = {
		}
		opcodes[0x20] = {
			// jr FLAG_Z == 0 &00
			let displ = self.bus.read(self.regs.pc)
			self.regs.pc &+= 1
			if self.regs.main.f & FLAG_Z == 0 {
				self.clock.add(cycles: 5)
				self.regs.pc = self.addRelative(displacement: displ, toAddress: self.regs.pc)
			}
		}
		opcodes[0x21] = {
			// ld main.hl,&0000
			self.regs.main.hl = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			self.regs.pc &+= 2
		}
		opcodes[0x22] = {
		}
		opcodes[0x23] = {
		}
		opcodes[0x24] = {
		}
		opcodes[0x25] = {
		}
		opcodes[0x26] = {
		}
		opcodes[0x27] = {
		}
		opcodes[0x28] = {
			// jr FLAG_Z != 0 &00
			let displ = self.bus.read(self.regs.pc)
			self.regs.pc &+= 1
			if self.regs.main.f & FLAG_Z != 0 {
				self.clock.add(cycles: 5)
				self.regs.pc = self.addRelative(displacement: displ, toAddress: self.regs.pc)
			}
		}
		opcodes[0x29] = {
			// add hl,main.hl
			self.clock.add(cycles: 7)
			let added_value = self.regs.main.hl
			let h_low = self.regs.main.h & 0x0F
			self.regs.main.hl &+= added_value
			self.regs.main.f.reset(bit: FLAG_N)
			if self.regs.main.hl < added_value {
				self.regs.main.f.set(bit: FLAG_C)
			} else {
				self.regs.main.f.reset(bit: FLAG_C)
			}
			if self.regs.main.h & 0x0F < h_low {
				self.regs.main.f.set(bit: FLAG_H)
			} else {
				self.regs.main.f.reset(bit: FLAG_H)
			}
		}
		opcodes[0x2A] = {
		}
		opcodes[0x2B] = {
		}
		opcodes[0x2C] = {
		}
		opcodes[0x2D] = {
		}
		opcodes[0x2E] = {
		}
		opcodes[0x2F] = {
		}
		opcodes[0x30] = {
			// jr FLAG_C == 0 &00
			let displ = self.bus.read(self.regs.pc)
			self.regs.pc &+= 1
			if self.regs.main.f & FLAG_C == 0 {
				self.clock.add(cycles: 5)
				self.regs.pc = self.addRelative(displacement: displ, toAddress: self.regs.pc)
			}
		}
		opcodes[0x31] = {
			// ld sp,&0000
			self.regs.sp = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			self.regs.pc &+= 2
		}
		opcodes[0x32] = {
		}
		opcodes[0x33] = {
		}
		opcodes[0x34] = {
		}
		opcodes[0x35] = {
		}
		opcodes[0x36] = {
		}
		opcodes[0x37] = {
		}
		opcodes[0x38] = {
			// jr FLAG_C != 0 &00
			let displ = self.bus.read(self.regs.pc)
			self.regs.pc &+= 1
			if self.regs.main.f & FLAG_C != 0 {
				self.clock.add(cycles: 5)
				self.regs.pc = self.addRelative(displacement: displ, toAddress: self.regs.pc)
			}
		}
		opcodes[0x39] = {
			// add hl,sp
			self.clock.add(cycles: 7)
			let added_value = self.regs.sp
			let h_low = self.regs.main.h & 0x0F
			self.regs.main.hl &+= added_value
			self.regs.main.f.reset(bit: FLAG_N)
			if self.regs.main.hl < added_value {
				self.regs.main.f.set(bit: FLAG_C)
			} else {
				self.regs.main.f.reset(bit: FLAG_C)
			}
			if self.regs.main.h & 0x0F < h_low {
				self.regs.main.f.set(bit: FLAG_H)
			} else {
				self.regs.main.f.reset(bit: FLAG_H)
			}
		}
		opcodes[0x3A] = {
		}
		opcodes[0x3B] = {
		}
		opcodes[0x3C] = {
		}
		opcodes[0x3D] = {
		}
		opcodes[0x3E] = {
		}
		opcodes[0x3F] = {
		}
		opcodes[0x40] = {
		// X1
		}
		opcodes[0x41] = {
		// X1
		}
		opcodes[0x42] = {
		// X1
		}
		opcodes[0x43] = {
		// X1
		}
		opcodes[0x44] = {
		// X1
		}
		opcodes[0x45] = {
		// X1
		}
		opcodes[0x46] = {
		// X1
		}
		opcodes[0x47] = {
		// X1
		}
		opcodes[0x48] = {
		// X1
		}
		opcodes[0x49] = {
		// X1
		}
		opcodes[0x4A] = {
		// X1
		}
		opcodes[0x4B] = {
		// X1
		}
		opcodes[0x4C] = {
		// X1
		}
		opcodes[0x4D] = {
		// X1
		}
		opcodes[0x4E] = {
		// X1
		}
		opcodes[0x4F] = {
		// X1
		}
		opcodes[0x50] = {
		// X1
		}
		opcodes[0x51] = {
		// X1
		}
		opcodes[0x52] = {
		// X1
		}
		opcodes[0x53] = {
		// X1
		}
		opcodes[0x54] = {
		// X1
		}
		opcodes[0x55] = {
		// X1
		}
		opcodes[0x56] = {
		// X1
		}
		opcodes[0x57] = {
		// X1
		}
		opcodes[0x58] = {
		// X1
		}
		opcodes[0x59] = {
		// X1
		}
		opcodes[0x5A] = {
		// X1
		}
		opcodes[0x5B] = {
		// X1
		}
		opcodes[0x5C] = {
		// X1
		}
		opcodes[0x5D] = {
		// X1
		}
		opcodes[0x5E] = {
		// X1
		}
		opcodes[0x5F] = {
		// X1
		}
		opcodes[0x60] = {
		// X1
		}
		opcodes[0x61] = {
		// X1
		}
		opcodes[0x62] = {
		// X1
		}
		opcodes[0x63] = {
		// X1
		}
		opcodes[0x64] = {
		// X1
		}
		opcodes[0x65] = {
		// X1
		}
		opcodes[0x66] = {
		// X1
		}
		opcodes[0x67] = {
		// X1
		}
		opcodes[0x68] = {
		// X1
		}
		opcodes[0x69] = {
		// X1
		}
		opcodes[0x6A] = {
		// X1
		}
		opcodes[0x6B] = {
		// X1
		}
		opcodes[0x6C] = {
		// X1
		}
		opcodes[0x6D] = {
		// X1
		}
		opcodes[0x6E] = {
		// X1
		}
		opcodes[0x6F] = {
		// X1
		}
		opcodes[0x70] = {
		// X1
		}
		opcodes[0x71] = {
		// X1
		}
		opcodes[0x72] = {
		// X1
		}
		opcodes[0x73] = {
		// X1
		}
		opcodes[0x74] = {
		// X1
		}
		opcodes[0x75] = {
		// X1
		}
		opcodes[0x76] = {
		// X1
		}
		opcodes[0x77] = {
		// X1
		}
		opcodes[0x78] = {
		// X1
		}
		opcodes[0x79] = {
		// X1
		}
		opcodes[0x7A] = {
		// X1
		}
		opcodes[0x7B] = {
		// X1
		}
		opcodes[0x7C] = {
		// X1
		}
		opcodes[0x7D] = {
		// X1
		}
		opcodes[0x7E] = {
		// X1
		}
		opcodes[0x7F] = {
		// X1
		}
		opcodes[0x80] = {
		// X2
		}
		opcodes[0x81] = {
		// X2
		}
		opcodes[0x82] = {
		// X2
		}
		opcodes[0x83] = {
		// X2
		}
		opcodes[0x84] = {
		// X2
		}
		opcodes[0x85] = {
		// X2
		}
		opcodes[0x86] = {
		// X2
		}
		opcodes[0x87] = {
		// X2
		}
		opcodes[0x88] = {
		// X2
		}
		opcodes[0x89] = {
		// X2
		}
		opcodes[0x8A] = {
		// X2
		}
		opcodes[0x8B] = {
		// X2
		}
		opcodes[0x8C] = {
		// X2
		}
		opcodes[0x8D] = {
		// X2
		}
		opcodes[0x8E] = {
		// X2
		}
		opcodes[0x8F] = {
		// X2
		}
		opcodes[0x90] = {
		// X2
		}
		opcodes[0x91] = {
		// X2
		}
		opcodes[0x92] = {
		// X2
		}
		opcodes[0x93] = {
		// X2
		}
		opcodes[0x94] = {
		// X2
		}
		opcodes[0x95] = {
		// X2
		}
		opcodes[0x96] = {
		// X2
		}
		opcodes[0x97] = {
		// X2
		}
		opcodes[0x98] = {
		// X2
		}
		opcodes[0x99] = {
		// X2
		}
		opcodes[0x9A] = {
		// X2
		}
		opcodes[0x9B] = {
		// X2
		}
		opcodes[0x9C] = {
		// X2
		}
		opcodes[0x9D] = {
		// X2
		}
		opcodes[0x9E] = {
		// X2
		}
		opcodes[0x9F] = {
		// X2
		}
		opcodes[0xA0] = {
		// X2
		}
		opcodes[0xA1] = {
		// X2
		}
		opcodes[0xA2] = {
		// X2
		}
		opcodes[0xA3] = {
		// X2
		}
		opcodes[0xA4] = {
		// X2
		}
		opcodes[0xA5] = {
		// X2
		}
		opcodes[0xA6] = {
		// X2
		}
		opcodes[0xA7] = {
		// X2
		}
		opcodes[0xA8] = {
		// X2
		}
		opcodes[0xA9] = {
		// X2
		}
		opcodes[0xAA] = {
		// X2
		}
		opcodes[0xAB] = {
		// X2
		}
		opcodes[0xAC] = {
		// X2
		}
		opcodes[0xAD] = {
		// X2
		}
		opcodes[0xAE] = {
		// X2
		}
		opcodes[0xAF] = {
		// X2
		}
		opcodes[0xB0] = {
		// X2
		}
		opcodes[0xB1] = {
		// X2
		}
		opcodes[0xB2] = {
		// X2
		}
		opcodes[0xB3] = {
		// X2
		}
		opcodes[0xB4] = {
		// X2
		}
		opcodes[0xB5] = {
		// X2
		}
		opcodes[0xB6] = {
		// X2
		}
		opcodes[0xB7] = {
		// X2
		}
		opcodes[0xB8] = {
		// X2
		}
		opcodes[0xB9] = {
		// X2
		}
		opcodes[0xBA] = {
		// X2
		}
		opcodes[0xBB] = {
		// X2
		}
		opcodes[0xBC] = {
		// X2
		}
		opcodes[0xBD] = {
		// X2
		}
		opcodes[0xBE] = {
		// X2
		}
		opcodes[0xBF] = {
		// X2
		}
		opcodes[0xC0] = {
		// X3
		}
		opcodes[0xC1] = {
		// X3
		}
		opcodes[0xC2] = {
		// X3
		}
		opcodes[0xC3] = {
		// X3
		}
		opcodes[0xC4] = {
		// X3
		}
		opcodes[0xC5] = {
		// X3
		}
		opcodes[0xC6] = {
		// X3
		}
		opcodes[0xC7] = {
		// X3
		}
		opcodes[0xC8] = {
		// X3
		}
		opcodes[0xC9] = {
		// X3
		}
		opcodes[0xCA] = {
		// X3
		}
		opcodes[0xCB] = {
		// X3
		}
		opcodes[0xCC] = {
		// X3
		}
		opcodes[0xCD] = {
		// X3
		}
		opcodes[0xCE] = {
		// X3
		}
		opcodes[0xCF] = {
		// X3
		}
		opcodes[0xD0] = {
		// X3
		}
		opcodes[0xD1] = {
		// X3
		}
		opcodes[0xD2] = {
		// X3
		}
		opcodes[0xD3] = {
		// X3
		}
		opcodes[0xD4] = {
		// X3
		}
		opcodes[0xD5] = {
		// X3
		}
		opcodes[0xD6] = {
		// X3
		}
		opcodes[0xD7] = {
		// X3
		}
		opcodes[0xD8] = {
		// X3
		}
		opcodes[0xD9] = {
		// X3
		}
		opcodes[0xDA] = {
		// X3
		}
		opcodes[0xDB] = {
		// X3
		}
		opcodes[0xDC] = {
		// X3
		}
		opcodes[0xDD] = {
		// X3
		}
		opcodes[0xDE] = {
		// X3
		}
		opcodes[0xDF] = {
		// X3
		}
		opcodes[0xE0] = {
		// X3
		}
		opcodes[0xE1] = {
		// X3
		}
		opcodes[0xE2] = {
		// X3
		}
		opcodes[0xE3] = {
		// X3
		}
		opcodes[0xE4] = {
		// X3
		}
		opcodes[0xE5] = {
		// X3
		}
		opcodes[0xE6] = {
		// X3
		}
		opcodes[0xE7] = {
		// X3
		}
		opcodes[0xE8] = {
		// X3
		}
		opcodes[0xE9] = {
		// X3
		}
		opcodes[0xEA] = {
		// X3
		}
		opcodes[0xEB] = {
		// X3
		}
		opcodes[0xEC] = {
		// X3
		}
		opcodes[0xED] = {
		// X3
		}
		opcodes[0xEE] = {
		// X3
		}
		opcodes[0xEF] = {
		// X3
		}
		opcodes[0xF0] = {
		// X3
		}
		opcodes[0xF1] = {
		// X3
		}
		opcodes[0xF2] = {
		// X3
		}
		opcodes[0xF3] = {
		// X3
		}
		opcodes[0xF4] = {
		// X3
		}
		opcodes[0xF5] = {
		// X3
		}
		opcodes[0xF6] = {
		// X3
		}
		opcodes[0xF7] = {
		// X3
		}
		opcodes[0xF8] = {
		// X3
		}
		opcodes[0xF9] = {
		// X3
		}
		opcodes[0xFA] = {
		// X3
		}
		opcodes[0xFB] = {
		// X3
		}
		opcodes[0xFC] = {
		// X3
		}
		opcodes[0xFD] = {
		// X3
		}
		opcodes[0xFE] = {
		// X3
		}
		opcodes[0xFF] = {
		// X3
		}
	}
}
