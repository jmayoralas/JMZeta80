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
			let data = Alu.rlc(self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.bus.write(self.regs.main.hl, value: data)
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
			let data = Alu.rrc(self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.bus.write(self.regs.main.hl, value: data)
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
			let data = Alu.rl(self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.bus.write(self.regs.main.hl, value: data)
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
			let data = Alu.rr(self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.bus.write(self.regs.main.hl, value: data)
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
			let data = Alu.sla(self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.bus.write(self.regs.main.hl, value: data)
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
			let data = Alu.sra(self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.bus.write(self.regs.main.hl, value: data)
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
			let data = Alu.sll(self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.bus.write(self.regs.main.hl, value: data)
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
			let data = Alu.srl(self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.bus.write(self.regs.main.hl, value: data)
		}
		opcodes[0x3F] = {
			// srl main.a
			self.regs.main.a = Alu.srl(self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x40] = {
			// bit 0,main.b
			Alu.bit(0, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0x41] = {
			// bit 0,main.c
			Alu.bit(0, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0x42] = {
			// bit 0,main.d
			Alu.bit(0, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0x43] = {
			// bit 0,main.e
			Alu.bit(0, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0x44] = {
			// bit 0,main.h
			Alu.bit(0, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0x45] = {
			// bit 0,main.l
			Alu.bit(0, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0x46] = {
			// bit 0,(hl)
			Alu.bit(0, self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | self.regs.main.h & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | self.regs.main.h & FLAG_5
		}
		opcodes[0x47] = {
			// bit 0,main.a
			Alu.bit(0, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x48] = {
			// bit 1,main.b
			Alu.bit(1, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0x49] = {
			// bit 1,main.c
			Alu.bit(1, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0x4A] = {
			// bit 1,main.d
			Alu.bit(1, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0x4B] = {
			// bit 1,main.e
			Alu.bit(1, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0x4C] = {
			// bit 1,main.h
			Alu.bit(1, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0x4D] = {
			// bit 1,main.l
			Alu.bit(1, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0x4E] = {
			// bit 1,(hl)
			Alu.bit(1, self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | self.regs.main.h & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | self.regs.main.h & FLAG_5
		}
		opcodes[0x4F] = {
			// bit 1,main.a
			Alu.bit(1, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x50] = {
			// bit 2,main.b
			Alu.bit(2, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0x51] = {
			// bit 2,main.c
			Alu.bit(2, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0x52] = {
			// bit 2,main.d
			Alu.bit(2, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0x53] = {
			// bit 2,main.e
			Alu.bit(2, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0x54] = {
			// bit 2,main.h
			Alu.bit(2, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0x55] = {
			// bit 2,main.l
			Alu.bit(2, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0x56] = {
			// bit 2,(hl)
			Alu.bit(2, self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | self.regs.main.h & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | self.regs.main.h & FLAG_5
		}
		opcodes[0x57] = {
			// bit 2,main.a
			Alu.bit(2, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x58] = {
			// bit 3,main.b
			Alu.bit(3, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0x59] = {
			// bit 3,main.c
			Alu.bit(3, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0x5A] = {
			// bit 3,main.d
			Alu.bit(3, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0x5B] = {
			// bit 3,main.e
			Alu.bit(3, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0x5C] = {
			// bit 3,main.h
			Alu.bit(3, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0x5D] = {
			// bit 3,main.l
			Alu.bit(3, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0x5E] = {
			// bit 3,(hl)
			Alu.bit(3, self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | self.regs.main.h & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | self.regs.main.h & FLAG_5
		}
		opcodes[0x5F] = {
			// bit 3,main.a
			Alu.bit(3, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x60] = {
			// bit 4,main.b
			Alu.bit(4, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0x61] = {
			// bit 4,main.c
			Alu.bit(4, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0x62] = {
			// bit 4,main.d
			Alu.bit(4, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0x63] = {
			// bit 4,main.e
			Alu.bit(4, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0x64] = {
			// bit 4,main.h
			Alu.bit(4, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0x65] = {
			// bit 4,main.l
			Alu.bit(4, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0x66] = {
			// bit 4,(hl)
			Alu.bit(4, self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | self.regs.main.h & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | self.regs.main.h & FLAG_5
		}
		opcodes[0x67] = {
			// bit 4,main.a
			Alu.bit(4, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x68] = {
			// bit 5,main.b
			Alu.bit(5, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0x69] = {
			// bit 5,main.c
			Alu.bit(5, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0x6A] = {
			// bit 5,main.d
			Alu.bit(5, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0x6B] = {
			// bit 5,main.e
			Alu.bit(5, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0x6C] = {
			// bit 5,main.h
			Alu.bit(5, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0x6D] = {
			// bit 5,main.l
			Alu.bit(5, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0x6E] = {
			// bit 5,(hl)
			Alu.bit(5, self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | self.regs.main.h & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | self.regs.main.h & FLAG_5
		}
		opcodes[0x6F] = {
			// bit 5,main.a
			Alu.bit(5, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x70] = {
			// bit 6,main.b
			Alu.bit(6, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0x71] = {
			// bit 6,main.c
			Alu.bit(6, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0x72] = {
			// bit 6,main.d
			Alu.bit(6, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0x73] = {
			// bit 6,main.e
			Alu.bit(6, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0x74] = {
			// bit 6,main.h
			Alu.bit(6, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0x75] = {
			// bit 6,main.l
			Alu.bit(6, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0x76] = {
			// bit 6,(hl)
			Alu.bit(6, self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | self.regs.main.h & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | self.regs.main.h & FLAG_5
		}
		opcodes[0x77] = {
			// bit 6,main.a
			Alu.bit(6, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x78] = {
			// bit 7,main.b
			Alu.bit(7, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0x79] = {
			// bit 7,main.c
			Alu.bit(7, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0x7A] = {
			// bit 7,main.d
			Alu.bit(7, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0x7B] = {
			// bit 7,main.e
			Alu.bit(7, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0x7C] = {
			// bit 7,main.h
			Alu.bit(7, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0x7D] = {
			// bit 7,main.l
			Alu.bit(7, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0x7E] = {
			// bit 7,(hl)
			Alu.bit(7, self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | self.regs.main.h & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | self.regs.main.h & FLAG_5
		}
		opcodes[0x7F] = {
			// bit 7,main.a
			Alu.bit(7, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x80] = {
			// res 0,main.b
			self.regs.main.b = Alu.res(0, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0x81] = {
			// res 0,main.c
			self.regs.main.c = Alu.res(0, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0x82] = {
			// res 0,main.d
			self.regs.main.d = Alu.res(0, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0x83] = {
			// res 0,main.e
			self.regs.main.e = Alu.res(0, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0x84] = {
			// res 0,main.h
			self.regs.main.h = Alu.res(0, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0x85] = {
			// res 0,main.l
			self.regs.main.l = Alu.res(0, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0x86] = {
			// res 0,(hl)
			let data = Alu.res(0, self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.bus.write(self.regs.main.hl, value: data)
		}
		opcodes[0x87] = {
			// res 0,main.a
			self.regs.main.a = Alu.res(0, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x88] = {
			// res 1,main.b
			self.regs.main.b = Alu.res(1, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0x89] = {
			// res 1,main.c
			self.regs.main.c = Alu.res(1, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0x8A] = {
			// res 1,main.d
			self.regs.main.d = Alu.res(1, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0x8B] = {
			// res 1,main.e
			self.regs.main.e = Alu.res(1, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0x8C] = {
			// res 1,main.h
			self.regs.main.h = Alu.res(1, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0x8D] = {
			// res 1,main.l
			self.regs.main.l = Alu.res(1, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0x8E] = {
			// res 1,(hl)
			let data = Alu.res(1, self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.bus.write(self.regs.main.hl, value: data)
		}
		opcodes[0x8F] = {
			// res 1,main.a
			self.regs.main.a = Alu.res(1, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x90] = {
			// res 2,main.b
			self.regs.main.b = Alu.res(2, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0x91] = {
			// res 2,main.c
			self.regs.main.c = Alu.res(2, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0x92] = {
			// res 2,main.d
			self.regs.main.d = Alu.res(2, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0x93] = {
			// res 2,main.e
			self.regs.main.e = Alu.res(2, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0x94] = {
			// res 2,main.h
			self.regs.main.h = Alu.res(2, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0x95] = {
			// res 2,main.l
			self.regs.main.l = Alu.res(2, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0x96] = {
			// res 2,(hl)
			let data = Alu.res(2, self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.bus.write(self.regs.main.hl, value: data)
		}
		opcodes[0x97] = {
			// res 2,main.a
			self.regs.main.a = Alu.res(2, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x98] = {
			// res 3,main.b
			self.regs.main.b = Alu.res(3, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0x99] = {
			// res 3,main.c
			self.regs.main.c = Alu.res(3, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0x9A] = {
			// res 3,main.d
			self.regs.main.d = Alu.res(3, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0x9B] = {
			// res 3,main.e
			self.regs.main.e = Alu.res(3, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0x9C] = {
			// res 3,main.h
			self.regs.main.h = Alu.res(3, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0x9D] = {
			// res 3,main.l
			self.regs.main.l = Alu.res(3, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0x9E] = {
			// res 3,(hl)
			let data = Alu.res(3, self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.bus.write(self.regs.main.hl, value: data)
		}
		opcodes[0x9F] = {
			// res 3,main.a
			self.regs.main.a = Alu.res(3, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0xA0] = {
			// res 4,main.b
			self.regs.main.b = Alu.res(4, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0xA1] = {
			// res 4,main.c
			self.regs.main.c = Alu.res(4, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0xA2] = {
			// res 4,main.d
			self.regs.main.d = Alu.res(4, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0xA3] = {
			// res 4,main.e
			self.regs.main.e = Alu.res(4, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0xA4] = {
			// res 4,main.h
			self.regs.main.h = Alu.res(4, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0xA5] = {
			// res 4,main.l
			self.regs.main.l = Alu.res(4, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0xA6] = {
			// res 4,(hl)
			let data = Alu.res(4, self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.bus.write(self.regs.main.hl, value: data)
		}
		opcodes[0xA7] = {
			// res 4,main.a
			self.regs.main.a = Alu.res(4, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0xA8] = {
			// res 5,main.b
			self.regs.main.b = Alu.res(5, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0xA9] = {
			// res 5,main.c
			self.regs.main.c = Alu.res(5, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0xAA] = {
			// res 5,main.d
			self.regs.main.d = Alu.res(5, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0xAB] = {
			// res 5,main.e
			self.regs.main.e = Alu.res(5, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0xAC] = {
			// res 5,main.h
			self.regs.main.h = Alu.res(5, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0xAD] = {
			// res 5,main.l
			self.regs.main.l = Alu.res(5, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0xAE] = {
			// res 5,(hl)
			let data = Alu.res(5, self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.bus.write(self.regs.main.hl, value: data)
		}
		opcodes[0xAF] = {
			// res 5,main.a
			self.regs.main.a = Alu.res(5, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0xB0] = {
			// res 6,main.b
			self.regs.main.b = Alu.res(6, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0xB1] = {
			// res 6,main.c
			self.regs.main.c = Alu.res(6, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0xB2] = {
			// res 6,main.d
			self.regs.main.d = Alu.res(6, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0xB3] = {
			// res 6,main.e
			self.regs.main.e = Alu.res(6, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0xB4] = {
			// res 6,main.h
			self.regs.main.h = Alu.res(6, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0xB5] = {
			// res 6,main.l
			self.regs.main.l = Alu.res(6, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0xB6] = {
			// res 6,(hl)
			let data = Alu.res(6, self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.bus.write(self.regs.main.hl, value: data)
		}
		opcodes[0xB7] = {
			// res 6,main.a
			self.regs.main.a = Alu.res(6, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0xB8] = {
			// res 7,main.b
			self.regs.main.b = Alu.res(7, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0xB9] = {
			// res 7,main.c
			self.regs.main.c = Alu.res(7, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0xBA] = {
			// res 7,main.d
			self.regs.main.d = Alu.res(7, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0xBB] = {
			// res 7,main.e
			self.regs.main.e = Alu.res(7, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0xBC] = {
			// res 7,main.h
			self.regs.main.h = Alu.res(7, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0xBD] = {
			// res 7,main.l
			self.regs.main.l = Alu.res(7, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0xBE] = {
			// res 7,(hl)
			let data = Alu.res(7, self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.bus.write(self.regs.main.hl, value: data)
		}
		opcodes[0xBF] = {
			// res 7,main.a
			self.regs.main.a = Alu.res(7, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0xC0] = {
			// set 0,main.b
			self.regs.main.b = Alu.set(0, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0xC1] = {
			// set 0,main.c
			self.regs.main.c = Alu.set(0, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0xC2] = {
			// set 0,main.d
			self.regs.main.d = Alu.set(0, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0xC3] = {
			// set 0,main.e
			self.regs.main.e = Alu.set(0, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0xC4] = {
			// set 0,main.h
			self.regs.main.h = Alu.set(0, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0xC5] = {
			// set 0,main.l
			self.regs.main.l = Alu.set(0, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0xC6] = {
			// set 0,(hl)
			let data = Alu.set(0, self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.bus.write(self.regs.main.hl, value: data)
		}
		opcodes[0xC7] = {
			// set 0,main.a
			self.regs.main.a = Alu.set(0, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0xC8] = {
			// set 1,main.b
			self.regs.main.b = Alu.set(1, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0xC9] = {
			// set 1,main.c
			self.regs.main.c = Alu.set(1, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0xCA] = {
			// set 1,main.d
			self.regs.main.d = Alu.set(1, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0xCB] = {
			// set 1,main.e
			self.regs.main.e = Alu.set(1, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0xCC] = {
			// set 1,main.h
			self.regs.main.h = Alu.set(1, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0xCD] = {
			// set 1,main.l
			self.regs.main.l = Alu.set(1, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0xCE] = {
			// set 1,(hl)
			let data = Alu.set(1, self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.bus.write(self.regs.main.hl, value: data)
		}
		opcodes[0xCF] = {
			// set 1,main.a
			self.regs.main.a = Alu.set(1, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0xD0] = {
			// set 2,main.b
			self.regs.main.b = Alu.set(2, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0xD1] = {
			// set 2,main.c
			self.regs.main.c = Alu.set(2, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0xD2] = {
			// set 2,main.d
			self.regs.main.d = Alu.set(2, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0xD3] = {
			// set 2,main.e
			self.regs.main.e = Alu.set(2, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0xD4] = {
			// set 2,main.h
			self.regs.main.h = Alu.set(2, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0xD5] = {
			// set 2,main.l
			self.regs.main.l = Alu.set(2, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0xD6] = {
			// set 2,(hl)
			let data = Alu.set(2, self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.bus.write(self.regs.main.hl, value: data)
		}
		opcodes[0xD7] = {
			// set 2,main.a
			self.regs.main.a = Alu.set(2, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0xD8] = {
			// set 3,main.b
			self.regs.main.b = Alu.set(3, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0xD9] = {
			// set 3,main.c
			self.regs.main.c = Alu.set(3, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0xDA] = {
			// set 3,main.d
			self.regs.main.d = Alu.set(3, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0xDB] = {
			// set 3,main.e
			self.regs.main.e = Alu.set(3, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0xDC] = {
			// set 3,main.h
			self.regs.main.h = Alu.set(3, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0xDD] = {
			// set 3,main.l
			self.regs.main.l = Alu.set(3, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0xDE] = {
			// set 3,(hl)
			let data = Alu.set(3, self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.bus.write(self.regs.main.hl, value: data)
		}
		opcodes[0xDF] = {
			// set 3,main.a
			self.regs.main.a = Alu.set(3, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0xE0] = {
			// set 4,main.b
			self.regs.main.b = Alu.set(4, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0xE1] = {
			// set 4,main.c
			self.regs.main.c = Alu.set(4, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0xE2] = {
			// set 4,main.d
			self.regs.main.d = Alu.set(4, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0xE3] = {
			// set 4,main.e
			self.regs.main.e = Alu.set(4, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0xE4] = {
			// set 4,main.h
			self.regs.main.h = Alu.set(4, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0xE5] = {
			// set 4,main.l
			self.regs.main.l = Alu.set(4, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0xE6] = {
			// set 4,(hl)
			let data = Alu.set(4, self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.bus.write(self.regs.main.hl, value: data)
		}
		opcodes[0xE7] = {
			// set 4,main.a
			self.regs.main.a = Alu.set(4, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0xE8] = {
			// set 5,main.b
			self.regs.main.b = Alu.set(5, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0xE9] = {
			// set 5,main.c
			self.regs.main.c = Alu.set(5, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0xEA] = {
			// set 5,main.d
			self.regs.main.d = Alu.set(5, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0xEB] = {
			// set 5,main.e
			self.regs.main.e = Alu.set(5, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0xEC] = {
			// set 5,main.h
			self.regs.main.h = Alu.set(5, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0xED] = {
			// set 5,main.l
			self.regs.main.l = Alu.set(5, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0xEE] = {
			// set 5,(hl)
			let data = Alu.set(5, self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.bus.write(self.regs.main.hl, value: data)
		}
		opcodes[0xEF] = {
			// set 5,main.a
			self.regs.main.a = Alu.set(5, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0xF0] = {
			// set 6,main.b
			self.regs.main.b = Alu.set(6, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0xF1] = {
			// set 6,main.c
			self.regs.main.c = Alu.set(6, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0xF2] = {
			// set 6,main.d
			self.regs.main.d = Alu.set(6, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0xF3] = {
			// set 6,main.e
			self.regs.main.e = Alu.set(6, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0xF4] = {
			// set 6,main.h
			self.regs.main.h = Alu.set(6, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0xF5] = {
			// set 6,main.l
			self.regs.main.l = Alu.set(6, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0xF6] = {
			// set 6,(hl)
			let data = Alu.set(6, self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.bus.write(self.regs.main.hl, value: data)
		}
		opcodes[0xF7] = {
			// set 6,main.a
			self.regs.main.a = Alu.set(6, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0xF8] = {
			// set 7,main.b
			self.regs.main.b = Alu.set(7, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0xF9] = {
			// set 7,main.c
			self.regs.main.c = Alu.set(7, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0xFA] = {
			// set 7,main.d
			self.regs.main.d = Alu.set(7, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0xFB] = {
			// set 7,main.e
			self.regs.main.e = Alu.set(7, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0xFC] = {
			// set 7,main.h
			self.regs.main.h = Alu.set(7, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0xFD] = {
			// set 7,main.l
			self.regs.main.l = Alu.set(7, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0xFE] = {
			// set 7,(hl)
			let data = Alu.set(7, self.bus.read(self.regs.main.hl), flags: &self.regs.main.f)
			self.clock.add(address: self.regs.main.hl, cycles: 1)
			self.bus.write(self.regs.main.hl, value: data)
		}
		opcodes[0xFF] = {
			// set 7,main.a
			self.regs.main.a = Alu.set(7, self.regs.main.a, flags: &self.regs.main.f)
		}
	}
}
