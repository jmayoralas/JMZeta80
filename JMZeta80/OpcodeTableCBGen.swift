//
//  OpcodeTableCB.swift
//  JMZeta80
//
//  Created by Jose Luis Fernandez-Mayoralas on 4/10/18.
//  Copyright © 2018 Jose Luis Fernandez-Mayoralas. All rights reserved.
//

import Foundation

extension Cpu {
	func initOpcodeTableCB(_ opcodes: inout OpcodeTable) {
		opcodes[0x00] = {
			// rlc main.b
			self.regs.main.b = Alu.rlc(self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0x01] = {
			// rlc main.c
			self.regs.main.c = Alu.rlc(self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0x02] = {
			// rlc main.d
			self.regs.main.d = Alu.rlc(self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0x03] = {
			// rlc main.e
			self.regs.main.e = Alu.rlc(self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0x04] = {
			// rlc main.h
			self.regs.main.h = Alu.rlc(self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0x05] = {
			// rlc main.l
			self.regs.main.l = Alu.rlc(self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0x06] = {
			// rlc (hl)
			self.bus.write(self.regs.main.hl, value: Alu.rlc(self.bus.read(self.regs.main.hl), flags: &self.regs.main.f))
			self.clock.add(cycles: 1)
		}
		opcodes[0x07] = {
			// rlc main.a
			self.regs.main.a = Alu.rlc(self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x08] = {
			// rrc main.b
			self.regs.main.b = Alu.rrc(self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0x09] = {
			// rrc main.c
			self.regs.main.c = Alu.rrc(self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0x0A] = {
			// rrc main.d
			self.regs.main.d = Alu.rrc(self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0x0B] = {
			// rrc main.e
			self.regs.main.e = Alu.rrc(self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0x0C] = {
			// rrc main.h
			self.regs.main.h = Alu.rrc(self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0x0D] = {
			// rrc main.l
			self.regs.main.l = Alu.rrc(self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0x0E] = {
			// rrc (hl)
			self.bus.write(self.regs.main.hl, value: Alu.rrc(self.bus.read(self.regs.main.hl), flags: &self.regs.main.f))
			self.clock.add(cycles: 1)
		}
		opcodes[0x0F] = {
			// rrc main.a
			self.regs.main.a = Alu.rrc(self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x10] = {
			// rl main.b
			self.regs.main.b = Alu.rl(self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0x11] = {
			// rl main.c
			self.regs.main.c = Alu.rl(self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0x12] = {
			// rl main.d
			self.regs.main.d = Alu.rl(self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0x13] = {
			// rl main.e
			self.regs.main.e = Alu.rl(self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0x14] = {
			// rl main.h
			self.regs.main.h = Alu.rl(self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0x15] = {
			// rl main.l
			self.regs.main.l = Alu.rl(self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0x16] = {
			// rl (hl)
			self.bus.write(self.regs.main.hl, value: Alu.rl(self.bus.read(self.regs.main.hl), flags: &self.regs.main.f))
			self.clock.add(cycles: 1)
		}
		opcodes[0x17] = {
			// rl main.a
			self.regs.main.a = Alu.rl(self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x18] = {
			// rr main.b
			self.regs.main.b = Alu.rr(self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0x19] = {
			// rr main.c
			self.regs.main.c = Alu.rr(self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0x1A] = {
			// rr main.d
			self.regs.main.d = Alu.rr(self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0x1B] = {
			// rr main.e
			self.regs.main.e = Alu.rr(self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0x1C] = {
			// rr main.h
			self.regs.main.h = Alu.rr(self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0x1D] = {
			// rr main.l
			self.regs.main.l = Alu.rr(self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0x1E] = {
			// rr (hl)
			self.bus.write(self.regs.main.hl, value: Alu.rr(self.bus.read(self.regs.main.hl), flags: &self.regs.main.f))
			self.clock.add(cycles: 1)
		}
		opcodes[0x1F] = {
			// rr main.a
			self.regs.main.a = Alu.rr(self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x20] = {
			// sla main.b
			self.regs.main.b = Alu.sla(self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0x21] = {
			// sla main.c
			self.regs.main.c = Alu.sla(self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0x22] = {
			// sla main.d
			self.regs.main.d = Alu.sla(self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0x23] = {
			// sla main.e
			self.regs.main.e = Alu.sla(self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0x24] = {
			// sla main.h
			self.regs.main.h = Alu.sla(self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0x25] = {
			// sla main.l
			self.regs.main.l = Alu.sla(self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0x26] = {
			// sla (hl)
			self.bus.write(self.regs.main.hl, value: Alu.sla(self.bus.read(self.regs.main.hl), flags: &self.regs.main.f))
			self.clock.add(cycles: 1)
		}
		opcodes[0x27] = {
			// sla main.a
			self.regs.main.a = Alu.sla(self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x28] = {
			// sra main.b
			self.regs.main.b = Alu.sra(self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0x29] = {
			// sra main.c
			self.regs.main.c = Alu.sra(self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0x2A] = {
			// sra main.d
			self.regs.main.d = Alu.sra(self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0x2B] = {
			// sra main.e
			self.regs.main.e = Alu.sra(self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0x2C] = {
			// sra main.h
			self.regs.main.h = Alu.sra(self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0x2D] = {
			// sra main.l
			self.regs.main.l = Alu.sra(self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0x2E] = {
			// sra (hl)
			self.bus.write(self.regs.main.hl, value: Alu.sra(self.bus.read(self.regs.main.hl), flags: &self.regs.main.f))
			self.clock.add(cycles: 1)
		}
		opcodes[0x2F] = {
			// sra main.a
			self.regs.main.a = Alu.sra(self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x30] = {
			// sll main.b
			self.regs.main.b = Alu.sll(self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0x31] = {
			// sll main.c
			self.regs.main.c = Alu.sll(self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0x32] = {
			// sll main.d
			self.regs.main.d = Alu.sll(self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0x33] = {
			// sll main.e
			self.regs.main.e = Alu.sll(self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0x34] = {
			// sll main.h
			self.regs.main.h = Alu.sll(self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0x35] = {
			// sll main.l
			self.regs.main.l = Alu.sll(self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0x36] = {
			// sll (hl)
			self.bus.write(self.regs.main.hl, value: Alu.sll(self.bus.read(self.regs.main.hl), flags: &self.regs.main.f))
			self.clock.add(cycles: 1)
		}
		opcodes[0x37] = {
			// sll main.a
			self.regs.main.a = Alu.sll(self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x38] = {
			// srl main.b
			self.regs.main.b = Alu.srl(self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0x39] = {
			// srl main.c
			self.regs.main.c = Alu.srl(self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0x3A] = {
			// srl main.d
			self.regs.main.d = Alu.srl(self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0x3B] = {
			// srl main.e
			self.regs.main.e = Alu.srl(self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0x3C] = {
			// srl main.h
			self.regs.main.h = Alu.srl(self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0x3D] = {
			// srl main.l
			self.regs.main.l = Alu.srl(self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0x3E] = {
			// srl (hl)
			self.bus.write(self.regs.main.hl, value: Alu.srl(self.bus.read(self.regs.main.hl), flags: &self.regs.main.f))
			self.clock.add(cycles: 1)
		}
		opcodes[0x3F] = {
			// srl main.a
			self.regs.main.a = Alu.srl(self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x40] = {
			// bit
		}
		opcodes[0x41] = {
			// bit
		}
		opcodes[0x42] = {
			// bit
		}
		opcodes[0x43] = {
			// bit
		}
		opcodes[0x44] = {
			// bit
		}
		opcodes[0x45] = {
			// bit
		}
		opcodes[0x46] = {
			// bit
		}
		opcodes[0x47] = {
			// bit
		}
		opcodes[0x48] = {
			// bit
		}
		opcodes[0x49] = {
			// bit
		}
		opcodes[0x4A] = {
			// bit
		}
		opcodes[0x4B] = {
			// bit
		}
		opcodes[0x4C] = {
			// bit
		}
		opcodes[0x4D] = {
			// bit
		}
		opcodes[0x4E] = {
			// bit
		}
		opcodes[0x4F] = {
			// bit
		}
		opcodes[0x50] = {
			// bit
		}
		opcodes[0x51] = {
			// bit
		}
		opcodes[0x52] = {
			// bit
		}
		opcodes[0x53] = {
			// bit
		}
		opcodes[0x54] = {
			// bit
		}
		opcodes[0x55] = {
			// bit
		}
		opcodes[0x56] = {
			// bit
		}
		opcodes[0x57] = {
			// bit
		}
		opcodes[0x58] = {
			// bit
		}
		opcodes[0x59] = {
			// bit
		}
		opcodes[0x5A] = {
			// bit
		}
		opcodes[0x5B] = {
			// bit
		}
		opcodes[0x5C] = {
			// bit
		}
		opcodes[0x5D] = {
			// bit
		}
		opcodes[0x5E] = {
			// bit
		}
		opcodes[0x5F] = {
			// bit
		}
		opcodes[0x60] = {
			// bit
		}
		opcodes[0x61] = {
			// bit
		}
		opcodes[0x62] = {
			// bit
		}
		opcodes[0x63] = {
			// bit
		}
		opcodes[0x64] = {
			// bit
		}
		opcodes[0x65] = {
			// bit
		}
		opcodes[0x66] = {
			// bit
		}
		opcodes[0x67] = {
			// bit
		}
		opcodes[0x68] = {
			// bit
		}
		opcodes[0x69] = {
			// bit
		}
		opcodes[0x6A] = {
			// bit
		}
		opcodes[0x6B] = {
			// bit
		}
		opcodes[0x6C] = {
			// bit
		}
		opcodes[0x6D] = {
			// bit
		}
		opcodes[0x6E] = {
			// bit
		}
		opcodes[0x6F] = {
			// bit
		}
		opcodes[0x70] = {
			// bit
		}
		opcodes[0x71] = {
			// bit
		}
		opcodes[0x72] = {
			// bit
		}
		opcodes[0x73] = {
			// bit
		}
		opcodes[0x74] = {
			// bit
		}
		opcodes[0x75] = {
			// bit
		}
		opcodes[0x76] = {
			// bit
		}
		opcodes[0x77] = {
			// bit
		}
		opcodes[0x78] = {
			// bit
		}
		opcodes[0x79] = {
			// bit
		}
		opcodes[0x7A] = {
			// bit
		}
		opcodes[0x7B] = {
			// bit
		}
		opcodes[0x7C] = {
			// bit
		}
		opcodes[0x7D] = {
			// bit
		}
		opcodes[0x7E] = {
			// bit
		}
		opcodes[0x7F] = {
			// bit
		}
		opcodes[0x80] = {
			// res
		}
		opcodes[0x81] = {
			// res
		}
		opcodes[0x82] = {
			// res
		}
		opcodes[0x83] = {
			// res
		}
		opcodes[0x84] = {
			// res
		}
		opcodes[0x85] = {
			// res
		}
		opcodes[0x86] = {
			// res
		}
		opcodes[0x87] = {
			// res
		}
		opcodes[0x88] = {
			// res
		}
		opcodes[0x89] = {
			// res
		}
		opcodes[0x8A] = {
			// res
		}
		opcodes[0x8B] = {
			// res
		}
		opcodes[0x8C] = {
			// res
		}
		opcodes[0x8D] = {
			// res
		}
		opcodes[0x8E] = {
			// res
		}
		opcodes[0x8F] = {
			// res
		}
		opcodes[0x90] = {
			// res
		}
		opcodes[0x91] = {
			// res
		}
		opcodes[0x92] = {
			// res
		}
		opcodes[0x93] = {
			// res
		}
		opcodes[0x94] = {
			// res
		}
		opcodes[0x95] = {
			// res
		}
		opcodes[0x96] = {
			// res
		}
		opcodes[0x97] = {
			// res
		}
		opcodes[0x98] = {
			// res
		}
		opcodes[0x99] = {
			// res
		}
		opcodes[0x9A] = {
			// res
		}
		opcodes[0x9B] = {
			// res
		}
		opcodes[0x9C] = {
			// res
		}
		opcodes[0x9D] = {
			// res
		}
		opcodes[0x9E] = {
			// res
		}
		opcodes[0x9F] = {
			// res
		}
		opcodes[0xA0] = {
			// res
		}
		opcodes[0xA1] = {
			// res
		}
		opcodes[0xA2] = {
			// res
		}
		opcodes[0xA3] = {
			// res
		}
		opcodes[0xA4] = {
			// res
		}
		opcodes[0xA5] = {
			// res
		}
		opcodes[0xA6] = {
			// res
		}
		opcodes[0xA7] = {
			// res
		}
		opcodes[0xA8] = {
			// res
		}
		opcodes[0xA9] = {
			// res
		}
		opcodes[0xAA] = {
			// res
		}
		opcodes[0xAB] = {
			// res
		}
		opcodes[0xAC] = {
			// res
		}
		opcodes[0xAD] = {
			// res
		}
		opcodes[0xAE] = {
			// res
		}
		opcodes[0xAF] = {
			// res
		}
		opcodes[0xB0] = {
			// res
		}
		opcodes[0xB1] = {
			// res
		}
		opcodes[0xB2] = {
			// res
		}
		opcodes[0xB3] = {
			// res
		}
		opcodes[0xB4] = {
			// res
		}
		opcodes[0xB5] = {
			// res
		}
		opcodes[0xB6] = {
			// res
		}
		opcodes[0xB7] = {
			// res
		}
		opcodes[0xB8] = {
			// res
		}
		opcodes[0xB9] = {
			// res
		}
		opcodes[0xBA] = {
			// res
		}
		opcodes[0xBB] = {
			// res
		}
		opcodes[0xBC] = {
			// res
		}
		opcodes[0xBD] = {
			// res
		}
		opcodes[0xBE] = {
			// res
		}
		opcodes[0xBF] = {
			// res
		}
		opcodes[0xC0] = {
			// set
		}
		opcodes[0xC1] = {
			// set
		}
		opcodes[0xC2] = {
			// set
		}
		opcodes[0xC3] = {
			// set
		}
		opcodes[0xC4] = {
			// set
		}
		opcodes[0xC5] = {
			// set
		}
		opcodes[0xC6] = {
			// set
		}
		opcodes[0xC7] = {
			// set
		}
		opcodes[0xC8] = {
			// set
		}
		opcodes[0xC9] = {
			// set
		}
		opcodes[0xCA] = {
			// set
		}
		opcodes[0xCB] = {
			// set
		}
		opcodes[0xCC] = {
			// set
		}
		opcodes[0xCD] = {
			// set
		}
		opcodes[0xCE] = {
			// set
		}
		opcodes[0xCF] = {
			// set
		}
		opcodes[0xD0] = {
			// set
		}
		opcodes[0xD1] = {
			// set
		}
		opcodes[0xD2] = {
			// set
		}
		opcodes[0xD3] = {
			// set
		}
		opcodes[0xD4] = {
			// set
		}
		opcodes[0xD5] = {
			// set
		}
		opcodes[0xD6] = {
			// set
		}
		opcodes[0xD7] = {
			// set
		}
		opcodes[0xD8] = {
			// set
		}
		opcodes[0xD9] = {
			// set
		}
		opcodes[0xDA] = {
			// set
		}
		opcodes[0xDB] = {
			// set
		}
		opcodes[0xDC] = {
			// set
		}
		opcodes[0xDD] = {
			// set
		}
		opcodes[0xDE] = {
			// set
		}
		opcodes[0xDF] = {
			// set
		}
		opcodes[0xE0] = {
			// set
		}
		opcodes[0xE1] = {
			// set
		}
		opcodes[0xE2] = {
			// set
		}
		opcodes[0xE3] = {
			// set
		}
		opcodes[0xE4] = {
			// set
		}
		opcodes[0xE5] = {
			// set
		}
		opcodes[0xE6] = {
			// set
		}
		opcodes[0xE7] = {
			// set
		}
		opcodes[0xE8] = {
			// set
		}
		opcodes[0xE9] = {
			// set
		}
		opcodes[0xEA] = {
			// set
		}
		opcodes[0xEB] = {
			// set
		}
		opcodes[0xEC] = {
			// set
		}
		opcodes[0xED] = {
			// set
		}
		opcodes[0xEE] = {
			// set
		}
		opcodes[0xEF] = {
			// set
		}
		opcodes[0xF0] = {
			// set
		}
		opcodes[0xF1] = {
			// set
		}
		opcodes[0xF2] = {
			// set
		}
		opcodes[0xF3] = {
			// set
		}
		opcodes[0xF4] = {
			// set
		}
		opcodes[0xF5] = {
			// set
		}
		opcodes[0xF6] = {
			// set
		}
		opcodes[0xF7] = {
			// set
		}
		opcodes[0xF8] = {
			// set
		}
		opcodes[0xF9] = {
			// set
		}
		opcodes[0xFA] = {
			// set
		}
		opcodes[0xFB] = {
			// set
		}
		opcodes[0xFC] = {
			// set
		}
		opcodes[0xFD] = {
			// set
		}
		opcodes[0xFE] = {
			// set
		}
		opcodes[0xFF] = {
			// set
		}
	}
}
