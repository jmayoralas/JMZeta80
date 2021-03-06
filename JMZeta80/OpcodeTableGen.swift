//
//  OpcodeTable.swift
//  JMZeta80
//
//  Created by Jose Luis Fernandez-Mayoralas on 4/10/18.
//  Copyright © 2018 Jose Luis Fernandez-Mayoralas. All rights reserved.
//

import Foundation

extension Cpu {
	func initOpcodeTable(_ opcodes: inout OpcodeTable) {
		opcodes[0x00] = {
			// nop
		}
		opcodes[0x01] = {
			// ld main.bc,&0000
			self.regs.main.bc = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			self.regs.pc &+= 2
		}
		opcodes[0x02] = {
			// ld (main.bc),a
			self.bus.write(self.regs.main.bc, value: self.regs.main.a)
		}
		opcodes[0x03] = {
			// inc main.bc
			self.clock.add(address: self.regs.ir_reg, cycles: 2)
			self.regs.main.bc &+= 1
		}
		opcodes[0x04] = {
			// inc main.b
			self.regs.main.b = Alu.inc(self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0x05] = {
			// dec main.b
			self.regs.main.b = Alu.dec(self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0x06] = {
			// ld main.b,n
			self.regs.main.b = self.bus.read(self.regs.pc)
			self.regs.pc &+= 1
		}
		opcodes[0x07] = {
			// rlca
			let bit_7 = (self.regs.main.a & 0x80) >> 7
			self.regs.main.a <<= 1
			self.regs.main.f.reset(bit: FLAG_C)
			self.regs.main.f |= bit_7
			self.regs.main.a |= bit_7
			self.regs.main.f.reset(bit: FLAG_H)
			self.regs.main.f.reset(bit: FLAG_N)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | self.regs.main.a & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | self.regs.main.a & FLAG_5
		}
		opcodes[0x08] = {
			// ex af,af'
			let af_ = self.regs.alternate.af
			self.regs.alternate.af = self.regs.main.af
			self.regs.main.af = af_
		}
		opcodes[0x09] = {
			// add hl,main.bc
			self.clock.add(address: self.regs.ir_reg, cycles: 7)
			self.regs.main.hl = Alu.add(self.regs.main.hl, self.regs.main.bc, flags: &self.regs.main.f)
		}
		opcodes[0x0A] = {
			// ld a,(main.bc)
			self.regs.main.a = self.bus.read(self.regs.main.bc)
		}
		opcodes[0x0B] = {
			// dec main.bc
			self.clock.add(address: self.regs.ir_reg, cycles: 2)
			self.regs.main.bc &-= 1
		}
		opcodes[0x0C] = {
			// inc main.c
			self.regs.main.c = Alu.inc(self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0x0D] = {
			// dec main.c
			self.regs.main.c = Alu.dec(self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0x0E] = {
			// ld main.c,n
			self.regs.main.c = self.bus.read(self.regs.pc)
			self.regs.pc &+= 1
		}
		opcodes[0x0F] = {
			// rrca
			let bit_0 = self.regs.main.a & 0x01
			self.regs.main.a >>= 1
			self.regs.main.f.reset(bit: FLAG_C)
			self.regs.main.f |= bit_0
			self.regs.main.a |= bit_0 << 7
			self.regs.main.f.reset(bit: FLAG_H)
			self.regs.main.f.reset(bit: FLAG_N)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | self.regs.main.a & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | self.regs.main.a & FLAG_5
		}
		opcodes[0x10] = {
			// djnz n
			self.clock.add(address: self.regs.ir_reg, cycles: 1)
			let displ = self.bus.read(self.regs.pc)
			self.regs.pc &+= 1
			self.regs.main.b &-= 1
			if self.regs.main.b != 0 {
				self.clock.add(address: self.regs.pc, cycles: 5)
				self.regs.pc = self.addRelative(displacement: displ, toAddress: self.regs.pc)
			}
		}
		opcodes[0x11] = {
			// ld main.de,&0000
			self.regs.main.de = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			self.regs.pc &+= 2
		}
		opcodes[0x12] = {
			// ld (main.de),a
			self.bus.write(self.regs.main.de, value: self.regs.main.a)
		}
		opcodes[0x13] = {
			// inc main.de
			self.clock.add(address: self.regs.ir_reg, cycles: 2)
			self.regs.main.de &+= 1
		}
		opcodes[0x14] = {
			// inc main.d
			self.regs.main.d = Alu.inc(self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0x15] = {
			// dec main.d
			self.regs.main.d = Alu.dec(self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0x16] = {
			// ld main.d,n
			self.regs.main.d = self.bus.read(self.regs.pc)
			self.regs.pc &+= 1
		}
		opcodes[0x17] = {
			// rla
			let bit_7 = (self.regs.main.a & 0x80) >> 7
			self.regs.main.a <<= 1
			self.regs.main.a |= self.regs.main.f & FLAG_C
			self.regs.main.f.reset(bit: FLAG_C)
			self.regs.main.f |= bit_7
			self.regs.main.f.reset(bit: FLAG_H)
			self.regs.main.f.reset(bit: FLAG_N)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | self.regs.main.a & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | self.regs.main.a & FLAG_5
		}
		opcodes[0x18] = {
			// jr &00
			let displ = self.bus.read(self.regs.pc)
			self.regs.pc &+= 1
			self.regs.pc = self.addRelative(displacement: displ, toAddress: self.regs.pc)
			self.clock.add(address: self.regs.pc, cycles: 5)
		}
		opcodes[0x19] = {
			// add hl,main.de
			self.clock.add(address: self.regs.ir_reg, cycles: 7)
			self.regs.main.hl = Alu.add(self.regs.main.hl, self.regs.main.de, flags: &self.regs.main.f)
		}
		opcodes[0x1A] = {
			// ld a,(main.de)
			self.regs.main.a = self.bus.read(self.regs.main.de)
		}
		opcodes[0x1B] = {
			// dec main.de
			self.clock.add(address: self.regs.ir_reg, cycles: 2)
			self.regs.main.de &-= 1
		}
		opcodes[0x1C] = {
			// inc main.e
			self.regs.main.e = Alu.inc(self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0x1D] = {
			// dec main.e
			self.regs.main.e = Alu.dec(self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0x1E] = {
			// ld main.e,n
			self.regs.main.e = self.bus.read(self.regs.pc)
			self.regs.pc &+= 1
		}
		opcodes[0x1F] = {
			// rra
			let bit_0 = self.regs.main.a & 0x01
			self.regs.main.a >>= 1
			self.regs.main.a &= ~FLAG_S
			self.regs.main.a |= (self.regs.main.f & FLAG_C) << 7
			self.regs.main.f.reset(bit: FLAG_C)
			self.regs.main.f |= bit_0
			self.regs.main.f.reset(bit: FLAG_H)
			self.regs.main.f.reset(bit: FLAG_N)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | self.regs.main.a & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | self.regs.main.a & FLAG_5
		}
		opcodes[0x20] = {
			// jr FLAG_Z == 0 &00
			let displ = self.bus.read(self.regs.pc)
			self.regs.pc &+= 1
			if self.regs.main.f & FLAG_Z == 0 {
				self.clock.add(address: self.regs.pc, cycles: 5)
				self.regs.pc = self.addRelative(displacement: displ, toAddress: self.regs.pc)
			}
		}
		opcodes[0x21] = {
			// ld main.hl,&0000
			self.regs.main.hl = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			self.regs.pc &+= 2
		}
		opcodes[0x22] = {
			// ld (nn),hl
			let address = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			self.regs.pc &+= 2
			self.bus.write(address, value: self.regs.main.l)
			self.bus.write(address &+ 1, value: self.regs.main.h)
		}
		opcodes[0x23] = {
			// inc main.hl
			self.clock.add(address: self.regs.ir_reg, cycles: 2)
			self.regs.main.hl &+= 1
		}
		opcodes[0x24] = {
			// inc main.h
			self.regs.main.h = Alu.inc(self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0x25] = {
			// dec main.h
			self.regs.main.h = Alu.dec(self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0x26] = {
			// ld main.h,n
			self.regs.main.h = self.bus.read(self.regs.pc)
			self.regs.pc &+= 1
		}
		opcodes[0x27] = {
			// daa
			/*
			The exact process is the following:
			- if the least significant four bits of A contain a non-BCD digit (i. e. it is greater than 9) or the H flag is set, then $06 is added to the register
			- then the four most significant bits are checked. If this more significant digit also happens to be greater than 9 or the C flag is set, then $60 is added.
			- if the second addition was needed, the C flag is set after execution, otherwise it is reset.
			- the N flag is preserved
			- P/V is parity
			- the others flags are altered by definition.
			*/
			let a = self.regs.main.a
			var add: UInt8 = 0
			var carry = self.regs.main.f & FLAG_C
			
			if a.low > 9 || self.regs.main.f & FLAG_H != 0 {
				add = 0x06
			}
			
			if a > 0x99 || self.regs.main.f & FLAG_C != 0 {
				add |= 0x60
				carry = 1
			}
			
			if self.regs.main.f & FLAG_N != 0 {
				self.regs.main.a = Alu.sub(self.regs.main.a, add, flags: &self.regs.main.f)
			} else {
				self.regs.main.a = Alu.add(self.regs.main.a, add, flags: &self.regs.main.f)
			}
			if self.regs.main.a.parity == 0 {
				self.regs.main.f.set(bit: FLAG_PV) // even parity
			} else {
				self.regs.main.f.reset(bit: FLAG_PV) // odd parity
			}
			self.regs.main.f = self.regs.main.f & ~FLAG_C | carry & FLAG_C
		}
		opcodes[0x28] = {
			// jr FLAG_Z != 0 &00
			let displ = self.bus.read(self.regs.pc)
			self.regs.pc &+= 1
			if self.regs.main.f & FLAG_Z != 0 {
				self.clock.add(address: self.regs.pc, cycles: 5)
				self.regs.pc = self.addRelative(displacement: displ, toAddress: self.regs.pc)
			}
		}
		opcodes[0x29] = {
			// add hl,main.hl
			self.clock.add(address: self.regs.ir_reg, cycles: 7)
			self.regs.main.hl = Alu.add(self.regs.main.hl, self.regs.main.hl, flags: &self.regs.main.f)
		}
		opcodes[0x2A] = {
			// ld hl,(nn)
			let address = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			self.regs.pc &+= 2
			self.regs.main.l = self.bus.read(address)
			self.regs.main.h = self.bus.read(address &+ 1)
		}
		opcodes[0x2B] = {
			// dec main.hl
			self.clock.add(address: self.regs.ir_reg, cycles: 2)
			self.regs.main.hl &-= 1
		}
		opcodes[0x2C] = {
			// inc main.l
			self.regs.main.l = Alu.inc(self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0x2D] = {
			// dec main.l
			self.regs.main.l = Alu.dec(self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0x2E] = {
			// ld main.l,n
			self.regs.main.l = self.bus.read(self.regs.pc)
			self.regs.pc &+= 1
		}
		opcodes[0x2F] = {
			// cpl
			self.regs.main.a = ~self.regs.main.a
			self.regs.main.f.set(bit: FLAG_H)
			self.regs.main.f.set(bit: FLAG_N)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | self.regs.main.a & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | self.regs.main.a & FLAG_5
		}
		opcodes[0x30] = {
			// jr FLAG_C == 0 &00
			let displ = self.bus.read(self.regs.pc)
			self.regs.pc &+= 1
			if self.regs.main.f & FLAG_C == 0 {
				self.clock.add(address: self.regs.pc, cycles: 5)
				self.regs.pc = self.addRelative(displacement: displ, toAddress: self.regs.pc)
			}
		}
		opcodes[0x31] = {
			// ld sp,&0000
			self.regs.sp = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			self.regs.pc &+= 2
		}
		opcodes[0x32] = {
			// ld (nn),a
			self.bus.write(self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc)), value: self.regs.main.a)
			self.regs.pc &+= 2
		}
		opcodes[0x33] = {
			// inc sp
			self.clock.add(address: self.regs.ir_reg, cycles: 2)
			self.regs.sp &+= 1
		}
		opcodes[0x34] = {
			// inc (hl)
			var address = self.regs.main.hl
			if self.id_opcode_table == table_XX {
				let displ = self.bus.read(self.regs.pc)
				self.regs.pc &+= 1
				address = self.addRelative(displacement: displ, toAddress: address)
				self.clock.add(address: self.regs.pc, cycles: 5)
			}
			var data = self.bus.read(address)
			self.clock.add(address: address, cycles: 1)
			data = Alu.inc(data, flags: &self.regs.main.f)
			self.bus.write(address, value: data)
		}
		opcodes[0x35] = {
			// dec (hl)
			var address = self.regs.main.hl
			if self.id_opcode_table == table_XX {
				let displ = self.bus.read(self.regs.pc)
				self.regs.pc &+= 1
				address = self.addRelative(displacement: displ, toAddress: address)
				self.clock.add(address: self.regs.pc, cycles: 5)
			}
			var data = self.bus.read(address)
			self.clock.add(address: address, cycles: 1)
			data = Alu.dec(data, flags: &self.regs.main.f)
			self.bus.write(address, value: data)
		}
		opcodes[0x36] = {
			// ld (hl),n
			var address = self.regs.main.hl
			if self.id_opcode_table == table_XX {
				let displ = self.bus.read(self.regs.pc)
				self.regs.pc &+= 1
				address = self.addRelative(displacement: displ, toAddress: address)
				self.clock.add(address: self.regs.pc, cycles: 2)
			}
			self.bus.write(address, value: self.bus.read(self.regs.pc))
			self.regs.pc &+= 1
		}
		opcodes[0x37] = {
			// scf
			let data = self.regs.q == 1 ? self.regs.main.a : self.regs.main.a | self.regs.main.f
			self.regs.main.f.set(bit: FLAG_C)
			self.regs.main.f.reset(bit: FLAG_H)
			self.regs.main.f.reset(bit: FLAG_N)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | data & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | data & FLAG_5
			self.regs.q = 1
		}
		opcodes[0x38] = {
			// jr FLAG_C != 0 &00
			let displ = self.bus.read(self.regs.pc)
			self.regs.pc &+= 1
			if self.regs.main.f & FLAG_C != 0 {
				self.clock.add(address: self.regs.pc, cycles: 5)
				self.regs.pc = self.addRelative(displacement: displ, toAddress: self.regs.pc)
			}
		}
		opcodes[0x39] = {
			// add hl,sp
			self.clock.add(address: self.regs.ir_reg, cycles: 7)
			self.regs.main.hl = Alu.add(self.regs.main.hl, self.regs.sp, flags: &self.regs.main.f)
		}
		opcodes[0x3A] = {
			// ld a,(nn)
			self.regs.main.a = self.bus.read(self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc)))
			self.regs.pc &+= 2
		}
		opcodes[0x3B] = {
			// dec sp
			self.clock.add(address: self.regs.ir_reg, cycles: 2)
			self.regs.sp &-= 1
		}
		opcodes[0x3C] = {
			// inc main.a
			self.regs.main.a = Alu.inc(self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x3D] = {
			// dec main.a
			self.regs.main.a = Alu.dec(self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x3E] = {
			// ld main.a,n
			self.regs.main.a = self.bus.read(self.regs.pc)
			self.regs.pc &+= 1
		}
		opcodes[0x3F] = {
			// ccf
			let data = self.regs.q == 1 ? self.regs.main.a : self.regs.main.a | self.regs.main.f
			let carry = self.regs.main.f & FLAG_C
			if carry != 0 { self.regs.main.f.reset(bit: FLAG_C) }
			else { self.regs.main.f.set(bit: FLAG_C) }
			self.regs.main.f.reset(bit: FLAG_H)
			self.regs.main.f |= carry << 4
			self.regs.main.f.reset(bit: FLAG_N)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | data & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | data & FLAG_5
			self.regs.q = 1
		}
		opcodes[0x40] = {
			// ld main.b,main.b
			self.regs.main.b = self.regs.main.b
		}
		opcodes[0x41] = {
			// ld main.b,main.c
			self.regs.main.b = self.regs.main.c
		}
		opcodes[0x42] = {
			// ld main.b,main.d
			self.regs.main.b = self.regs.main.d
		}
		opcodes[0x43] = {
			// ld main.b,main.e
			self.regs.main.b = self.regs.main.e
		}
		opcodes[0x44] = {
			// ld main.b,main.h
			self.regs.main.b = self.regs.main.h
		}
		opcodes[0x45] = {
			// ld main.b,main.l
			self.regs.main.b = self.regs.main.l
		}
		opcodes[0x46] = {
			// ld main.b,(hl)
			var address = self.regs.main.hl
			if self.id_opcode_table == table_XX {
				let displ = self.bus.read(self.regs.pc)
				self.regs.pc &+= 1
				address = self.addRelative(displacement: displ, toAddress: address)
				self.clock.add(address: self.regs.pc, cycles: 5)
			}
			self.regs.main.b = self.bus.read(address)
		}
		opcodes[0x47] = {
			// ld main.b,main.a
			self.regs.main.b = self.regs.main.a
		}
		opcodes[0x48] = {
			// ld main.c,main.b
			self.regs.main.c = self.regs.main.b
		}
		opcodes[0x49] = {
			// ld main.c,main.c
			self.regs.main.c = self.regs.main.c
		}
		opcodes[0x4A] = {
			// ld main.c,main.d
			self.regs.main.c = self.regs.main.d
		}
		opcodes[0x4B] = {
			// ld main.c,main.e
			self.regs.main.c = self.regs.main.e
		}
		opcodes[0x4C] = {
			// ld main.c,main.h
			self.regs.main.c = self.regs.main.h
		}
		opcodes[0x4D] = {
			// ld main.c,main.l
			self.regs.main.c = self.regs.main.l
		}
		opcodes[0x4E] = {
			// ld main.c,(hl)
			var address = self.regs.main.hl
			if self.id_opcode_table == table_XX {
				let displ = self.bus.read(self.regs.pc)
				self.regs.pc &+= 1
				address = self.addRelative(displacement: displ, toAddress: address)
				self.clock.add(address: self.regs.pc, cycles: 5)
			}
			self.regs.main.c = self.bus.read(address)
		}
		opcodes[0x4F] = {
			// ld main.c,main.a
			self.regs.main.c = self.regs.main.a
		}
		opcodes[0x50] = {
			// ld main.d,main.b
			self.regs.main.d = self.regs.main.b
		}
		opcodes[0x51] = {
			// ld main.d,main.c
			self.regs.main.d = self.regs.main.c
		}
		opcodes[0x52] = {
			// ld main.d,main.d
			self.regs.main.d = self.regs.main.d
		}
		opcodes[0x53] = {
			// ld main.d,main.e
			self.regs.main.d = self.regs.main.e
		}
		opcodes[0x54] = {
			// ld main.d,main.h
			self.regs.main.d = self.regs.main.h
		}
		opcodes[0x55] = {
			// ld main.d,main.l
			self.regs.main.d = self.regs.main.l
		}
		opcodes[0x56] = {
			// ld main.d,(hl)
			var address = self.regs.main.hl
			if self.id_opcode_table == table_XX {
				let displ = self.bus.read(self.regs.pc)
				self.regs.pc &+= 1
				address = self.addRelative(displacement: displ, toAddress: address)
				self.clock.add(address: self.regs.pc, cycles: 5)
			}
			self.regs.main.d = self.bus.read(address)
		}
		opcodes[0x57] = {
			// ld main.d,main.a
			self.regs.main.d = self.regs.main.a
		}
		opcodes[0x58] = {
			// ld main.e,main.b
			self.regs.main.e = self.regs.main.b
		}
		opcodes[0x59] = {
			// ld main.e,main.c
			self.regs.main.e = self.regs.main.c
		}
		opcodes[0x5A] = {
			// ld main.e,main.d
			self.regs.main.e = self.regs.main.d
		}
		opcodes[0x5B] = {
			// ld main.e,main.e
			self.regs.main.e = self.regs.main.e
		}
		opcodes[0x5C] = {
			// ld main.e,main.h
			self.regs.main.e = self.regs.main.h
		}
		opcodes[0x5D] = {
			// ld main.e,main.l
			self.regs.main.e = self.regs.main.l
		}
		opcodes[0x5E] = {
			// ld main.e,(hl)
			var address = self.regs.main.hl
			if self.id_opcode_table == table_XX {
				let displ = self.bus.read(self.regs.pc)
				self.regs.pc &+= 1
				address = self.addRelative(displacement: displ, toAddress: address)
				self.clock.add(address: self.regs.pc, cycles: 5)
			}
			self.regs.main.e = self.bus.read(address)
		}
		opcodes[0x5F] = {
			// ld main.e,main.a
			self.regs.main.e = self.regs.main.a
		}
		opcodes[0x60] = {
			// ld main.h,main.b
			self.regs.main.h = self.regs.main.b
		}
		opcodes[0x61] = {
			// ld main.h,main.c
			self.regs.main.h = self.regs.main.c
		}
		opcodes[0x62] = {
			// ld main.h,main.d
			self.regs.main.h = self.regs.main.d
		}
		opcodes[0x63] = {
			// ld main.h,main.e
			self.regs.main.h = self.regs.main.e
		}
		opcodes[0x64] = {
			// ld main.h,main.h
			self.regs.main.h = self.regs.main.h
		}
		opcodes[0x65] = {
			// ld main.h,main.l
			self.regs.main.h = self.regs.main.l
		}
		opcodes[0x66] = {
			// ld main.h,(hl)
			var address = self.regs.main.hl
			if self.id_opcode_table == table_XX {
				let displ = self.bus.read(self.regs.pc)
				self.regs.pc &+= 1
				address = self.addRelative(displacement: displ, toAddress: address)
				self.clock.add(address: self.regs.pc, cycles: 5)
			}
			self.regs.main.h = self.bus.read(address)
		}
		opcodes[0x67] = {
			// ld main.h,main.a
			self.regs.main.h = self.regs.main.a
		}
		opcodes[0x68] = {
			// ld main.l,main.b
			self.regs.main.l = self.regs.main.b
		}
		opcodes[0x69] = {
			// ld main.l,main.c
			self.regs.main.l = self.regs.main.c
		}
		opcodes[0x6A] = {
			// ld main.l,main.d
			self.regs.main.l = self.regs.main.d
		}
		opcodes[0x6B] = {
			// ld main.l,main.e
			self.regs.main.l = self.regs.main.e
		}
		opcodes[0x6C] = {
			// ld main.l,main.h
			self.regs.main.l = self.regs.main.h
		}
		opcodes[0x6D] = {
			// ld main.l,main.l
			self.regs.main.l = self.regs.main.l
		}
		opcodes[0x6E] = {
			// ld main.l,(hl)
			var address = self.regs.main.hl
			if self.id_opcode_table == table_XX {
				let displ = self.bus.read(self.regs.pc)
				self.regs.pc &+= 1
				address = self.addRelative(displacement: displ, toAddress: address)
				self.clock.add(address: self.regs.pc, cycles: 5)
			}
			self.regs.main.l = self.bus.read(address)
		}
		opcodes[0x6F] = {
			// ld main.l,main.a
			self.regs.main.l = self.regs.main.a
		}
		opcodes[0x70] = {
			// ld (hl),main.b
			var address = self.regs.main.hl
			if self.id_opcode_table == table_XX {
				let displ = self.bus.read(self.regs.pc)
				self.regs.pc &+= 1
				address = self.addRelative(displacement: displ, toAddress: address)
				self.clock.add(address: self.regs.pc, cycles: 5)
			}
			self.bus.write(address, value: self.regs.main.b)
		}
		opcodes[0x71] = {
			// ld (hl),main.c
			var address = self.regs.main.hl
			if self.id_opcode_table == table_XX {
				let displ = self.bus.read(self.regs.pc)
				self.regs.pc &+= 1
				address = self.addRelative(displacement: displ, toAddress: address)
				self.clock.add(address: self.regs.pc, cycles: 5)
			}
			self.bus.write(address, value: self.regs.main.c)
		}
		opcodes[0x72] = {
			// ld (hl),main.d
			var address = self.regs.main.hl
			if self.id_opcode_table == table_XX {
				let displ = self.bus.read(self.regs.pc)
				self.regs.pc &+= 1
				address = self.addRelative(displacement: displ, toAddress: address)
				self.clock.add(address: self.regs.pc, cycles: 5)
			}
			self.bus.write(address, value: self.regs.main.d)
		}
		opcodes[0x73] = {
			// ld (hl),main.e
			var address = self.regs.main.hl
			if self.id_opcode_table == table_XX {
				let displ = self.bus.read(self.regs.pc)
				self.regs.pc &+= 1
				address = self.addRelative(displacement: displ, toAddress: address)
				self.clock.add(address: self.regs.pc, cycles: 5)
			}
			self.bus.write(address, value: self.regs.main.e)
		}
		opcodes[0x74] = {
			// ld (hl),main.h
			var address = self.regs.main.hl
			if self.id_opcode_table == table_XX {
				let displ = self.bus.read(self.regs.pc)
				self.regs.pc &+= 1
				address = self.addRelative(displacement: displ, toAddress: address)
				self.clock.add(address: self.regs.pc, cycles: 5)
			}
			self.bus.write(address, value: self.regs.main.h)
		}
		opcodes[0x75] = {
			// ld (hl),main.l
			var address = self.regs.main.hl
			if self.id_opcode_table == table_XX {
				let displ = self.bus.read(self.regs.pc)
				self.regs.pc &+= 1
				address = self.addRelative(displacement: displ, toAddress: address)
				self.clock.add(address: self.regs.pc, cycles: 5)
			}
			self.bus.write(address, value: self.regs.main.l)
		}
		opcodes[0x76] = {
			// halt
			self.halted = true
			self.regs.pc &-= 1
		}
		opcodes[0x77] = {
			// ld (hl),main.a
			var address = self.regs.main.hl
			if self.id_opcode_table == table_XX {
				let displ = self.bus.read(self.regs.pc)
				self.regs.pc &+= 1
				address = self.addRelative(displacement: displ, toAddress: address)
				self.clock.add(address: self.regs.pc, cycles: 5)
			}
			self.bus.write(address, value: self.regs.main.a)
		}
		opcodes[0x78] = {
			// ld main.a,main.b
			self.regs.main.a = self.regs.main.b
		}
		opcodes[0x79] = {
			// ld main.a,main.c
			self.regs.main.a = self.regs.main.c
		}
		opcodes[0x7A] = {
			// ld main.a,main.d
			self.regs.main.a = self.regs.main.d
		}
		opcodes[0x7B] = {
			// ld main.a,main.e
			self.regs.main.a = self.regs.main.e
		}
		opcodes[0x7C] = {
			// ld main.a,main.h
			self.regs.main.a = self.regs.main.h
		}
		opcodes[0x7D] = {
			// ld main.a,main.l
			self.regs.main.a = self.regs.main.l
		}
		opcodes[0x7E] = {
			// ld main.a,(hl)
			var address = self.regs.main.hl
			if self.id_opcode_table == table_XX {
				let displ = self.bus.read(self.regs.pc)
				self.regs.pc &+= 1
				address = self.addRelative(displacement: displ, toAddress: address)
				self.clock.add(address: self.regs.pc, cycles: 5)
			}
			self.regs.main.a = self.bus.read(address)
		}
		opcodes[0x7F] = {
			// ld main.a,main.a
			self.regs.main.a = self.regs.main.a
		}
		opcodes[0x80] = {
			// add a,main.b
			self.regs.main.a = Alu.add(self.regs.main.a, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0x81] = {
			// add a,main.c
			self.regs.main.a = Alu.add(self.regs.main.a, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0x82] = {
			// add a,main.d
			self.regs.main.a = Alu.add(self.regs.main.a, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0x83] = {
			// add a,main.e
			self.regs.main.a = Alu.add(self.regs.main.a, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0x84] = {
			// add a,main.h
			self.regs.main.a = Alu.add(self.regs.main.a, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0x85] = {
			// add a,main.l
			self.regs.main.a = Alu.add(self.regs.main.a, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0x86] = {
			// add a,(hl)
			var address = self.regs.main.hl
			if self.id_opcode_table == table_XX {
				let displ = self.bus.read(self.regs.pc)
				self.regs.pc &+= 1
				address = self.addRelative(displacement: displ, toAddress: address)
				self.clock.add(address: self.regs.pc, cycles: 5)
			}
			self.regs.main.a = Alu.add(self.regs.main.a, self.bus.read(address), flags: &self.regs.main.f)
		}
		opcodes[0x87] = {
			// add a,main.a
			self.regs.main.a = Alu.add(self.regs.main.a, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x88] = {
			// adc a,main.b
			self.regs.main.a = Alu.adc(self.regs.main.a, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0x89] = {
			// adc a,main.c
			self.regs.main.a = Alu.adc(self.regs.main.a, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0x8A] = {
			// adc a,main.d
			self.regs.main.a = Alu.adc(self.regs.main.a, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0x8B] = {
			// adc a,main.e
			self.regs.main.a = Alu.adc(self.regs.main.a, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0x8C] = {
			// adc a,main.h
			self.regs.main.a = Alu.adc(self.regs.main.a, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0x8D] = {
			// adc a,main.l
			self.regs.main.a = Alu.adc(self.regs.main.a, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0x8E] = {
			// adc a,(hl)
			var address = self.regs.main.hl
			if self.id_opcode_table == table_XX {
				let displ = self.bus.read(self.regs.pc)
				self.regs.pc &+= 1
				address = self.addRelative(displacement: displ, toAddress: address)
				self.clock.add(address: self.regs.pc, cycles: 5)
			}
			self.regs.main.a = Alu.adc(self.regs.main.a, self.bus.read(address), flags: &self.regs.main.f)
		}
		opcodes[0x8F] = {
			// adc a,main.a
			self.regs.main.a = Alu.adc(self.regs.main.a, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x90] = {
			// sub a,main.b
			self.regs.main.a = Alu.sub(self.regs.main.a, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0x91] = {
			// sub a,main.c
			self.regs.main.a = Alu.sub(self.regs.main.a, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0x92] = {
			// sub a,main.d
			self.regs.main.a = Alu.sub(self.regs.main.a, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0x93] = {
			// sub a,main.e
			self.regs.main.a = Alu.sub(self.regs.main.a, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0x94] = {
			// sub a,main.h
			self.regs.main.a = Alu.sub(self.regs.main.a, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0x95] = {
			// sub a,main.l
			self.regs.main.a = Alu.sub(self.regs.main.a, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0x96] = {
			// sub a,(hl)
			var address = self.regs.main.hl
			if self.id_opcode_table == table_XX {
				let displ = self.bus.read(self.regs.pc)
				self.regs.pc &+= 1
				address = self.addRelative(displacement: displ, toAddress: address)
				self.clock.add(address: self.regs.pc, cycles: 5)
			}
			self.regs.main.a = Alu.sub(self.regs.main.a, self.bus.read(address), flags: &self.regs.main.f)
		}
		opcodes[0x97] = {
			// sub a,main.a
			self.regs.main.a = Alu.sub(self.regs.main.a, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x98] = {
			// sbc a,main.b
			self.regs.main.a = Alu.sbc(self.regs.main.a, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0x99] = {
			// sbc a,main.c
			self.regs.main.a = Alu.sbc(self.regs.main.a, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0x9A] = {
			// sbc a,main.d
			self.regs.main.a = Alu.sbc(self.regs.main.a, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0x9B] = {
			// sbc a,main.e
			self.regs.main.a = Alu.sbc(self.regs.main.a, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0x9C] = {
			// sbc a,main.h
			self.regs.main.a = Alu.sbc(self.regs.main.a, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0x9D] = {
			// sbc a,main.l
			self.regs.main.a = Alu.sbc(self.regs.main.a, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0x9E] = {
			// sbc a,(hl)
			var address = self.regs.main.hl
			if self.id_opcode_table == table_XX {
				let displ = self.bus.read(self.regs.pc)
				self.regs.pc &+= 1
				address = self.addRelative(displacement: displ, toAddress: address)
				self.clock.add(address: self.regs.pc, cycles: 5)
			}
			self.regs.main.a = Alu.sbc(self.regs.main.a, self.bus.read(address), flags: &self.regs.main.f)
		}
		opcodes[0x9F] = {
			// sbc a,main.a
			self.regs.main.a = Alu.sbc(self.regs.main.a, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0xA0] = {
			// and a,main.b
			self.regs.main.a = Alu.and(self.regs.main.a, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0xA1] = {
			// and a,main.c
			self.regs.main.a = Alu.and(self.regs.main.a, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0xA2] = {
			// and a,main.d
			self.regs.main.a = Alu.and(self.regs.main.a, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0xA3] = {
			// and a,main.e
			self.regs.main.a = Alu.and(self.regs.main.a, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0xA4] = {
			// and a,main.h
			self.regs.main.a = Alu.and(self.regs.main.a, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0xA5] = {
			// and a,main.l
			self.regs.main.a = Alu.and(self.regs.main.a, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0xA6] = {
			// and a,(hl)
			var address = self.regs.main.hl
			if self.id_opcode_table == table_XX {
				let displ = self.bus.read(self.regs.pc)
				self.regs.pc &+= 1
				address = self.addRelative(displacement: displ, toAddress: address)
				self.clock.add(address: self.regs.pc, cycles: 5)
			}
			self.regs.main.a = Alu.and(self.regs.main.a, self.bus.read(address), flags: &self.regs.main.f)
		}
		opcodes[0xA7] = {
			// and a,main.a
			self.regs.main.a = Alu.and(self.regs.main.a, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0xA8] = {
			// xor a,main.b
			self.regs.main.a = Alu.xor(self.regs.main.a, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0xA9] = {
			// xor a,main.c
			self.regs.main.a = Alu.xor(self.regs.main.a, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0xAA] = {
			// xor a,main.d
			self.regs.main.a = Alu.xor(self.regs.main.a, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0xAB] = {
			// xor a,main.e
			self.regs.main.a = Alu.xor(self.regs.main.a, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0xAC] = {
			// xor a,main.h
			self.regs.main.a = Alu.xor(self.regs.main.a, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0xAD] = {
			// xor a,main.l
			self.regs.main.a = Alu.xor(self.regs.main.a, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0xAE] = {
			// xor a,(hl)
			var address = self.regs.main.hl
			if self.id_opcode_table == table_XX {
				let displ = self.bus.read(self.regs.pc)
				self.regs.pc &+= 1
				address = self.addRelative(displacement: displ, toAddress: address)
				self.clock.add(address: self.regs.pc, cycles: 5)
			}
			self.regs.main.a = Alu.xor(self.regs.main.a, self.bus.read(address), flags: &self.regs.main.f)
		}
		opcodes[0xAF] = {
			// xor a,main.a
			self.regs.main.a = Alu.xor(self.regs.main.a, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0xB0] = {
			// or a,main.b
			self.regs.main.a = Alu.or(self.regs.main.a, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0xB1] = {
			// or a,main.c
			self.regs.main.a = Alu.or(self.regs.main.a, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0xB2] = {
			// or a,main.d
			self.regs.main.a = Alu.or(self.regs.main.a, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0xB3] = {
			// or a,main.e
			self.regs.main.a = Alu.or(self.regs.main.a, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0xB4] = {
			// or a,main.h
			self.regs.main.a = Alu.or(self.regs.main.a, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0xB5] = {
			// or a,main.l
			self.regs.main.a = Alu.or(self.regs.main.a, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0xB6] = {
			// or a,(hl)
			var address = self.regs.main.hl
			if self.id_opcode_table == table_XX {
				let displ = self.bus.read(self.regs.pc)
				self.regs.pc &+= 1
				address = self.addRelative(displacement: displ, toAddress: address)
				self.clock.add(address: self.regs.pc, cycles: 5)
			}
			self.regs.main.a = Alu.or(self.regs.main.a, self.bus.read(address), flags: &self.regs.main.f)
		}
		opcodes[0xB7] = {
			// or a,main.a
			self.regs.main.a = Alu.or(self.regs.main.a, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0xB8] = {
			// cp a,main.b
			Alu.cp(self.regs.main.a, self.regs.main.b, flags: &self.regs.main.f)
		}
		opcodes[0xB9] = {
			// cp a,main.c
			Alu.cp(self.regs.main.a, self.regs.main.c, flags: &self.regs.main.f)
		}
		opcodes[0xBA] = {
			// cp a,main.d
			Alu.cp(self.regs.main.a, self.regs.main.d, flags: &self.regs.main.f)
		}
		opcodes[0xBB] = {
			// cp a,main.e
			Alu.cp(self.regs.main.a, self.regs.main.e, flags: &self.regs.main.f)
		}
		opcodes[0xBC] = {
			// cp a,main.h
			Alu.cp(self.regs.main.a, self.regs.main.h, flags: &self.regs.main.f)
		}
		opcodes[0xBD] = {
			// cp a,main.l
			Alu.cp(self.regs.main.a, self.regs.main.l, flags: &self.regs.main.f)
		}
		opcodes[0xBE] = {
			// cp a,(hl)
			var address = self.regs.main.hl
			if self.id_opcode_table == table_XX {
				let displ = self.bus.read(self.regs.pc)
				self.regs.pc &+= 1
				address = self.addRelative(displacement: displ, toAddress: address)
				self.clock.add(address: self.regs.pc, cycles: 5)
			}
			Alu.cp(self.regs.main.a, self.bus.read(address), flags: &self.regs.main.f)
		}
		opcodes[0xBF] = {
			// cp a,main.a
			Alu.cp(self.regs.main.a, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0xC0] = {
			// ret FLAG_Z == 0
			self.clock.add(address: self.regs.ir_reg, cycles: 1)
			if self.regs.main.f & FLAG_Z == 0 {
				self.regs.pc = self.buildAddress(self.bus.read(self.regs.sp &+ 1), self.bus.read(self.regs.sp))
				self.regs.sp &+= 2
			}
		}
		opcodes[0xC1] = {
			// pop main.bc
			let value = self.buildAddress(self.bus.read(self.regs.sp &+ 1), self.bus.read(self.regs.sp))
			self.regs.sp &+= 2
			self.regs.main.bc = value
		}
		opcodes[0xC2] = {
			// jp FLAG_Z == 0,nn
			let address = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			if self.regs.main.f & FLAG_Z == 0 {
				self.regs.pc = address
			} else {
				self.regs.pc &+= 2
			}
		}
		opcodes[0xC3] = {
			// jp nn
			self.regs.pc = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
		}
		opcodes[0xC4] = {
			// call FLAG_Z == 0,nn
			let address = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			self.regs.pc &+= 2
			if self.regs.main.f & FLAG_Z == 0 {
				self.call(address)
			}
		}
		opcodes[0xC5] = {
			// push main.bc
			self.clock.add(address: self.regs.ir_reg, cycles: 1)
			let value = self.regs.main.bc
			self.bus.write(self.regs.sp &- 1, value: value.high)
			self.bus.write(self.regs.sp &- 2, value: value.low)
			self.regs.sp &-= 2
		}
		opcodes[0xC6] = {
			// add a,n
			self.regs.main.a = Alu.add(self.regs.main.a, self.bus.read(self.regs.pc), flags: &self.regs.main.f)
			self.regs.pc &+= 1
		}
		opcodes[0xC7] = {
			// rst 0x0000
			self.call(0x0000)
		}
		opcodes[0xC8] = {
			// ret FLAG_Z != 0
			self.clock.add(address: self.regs.ir_reg, cycles: 1)
			if self.regs.main.f & FLAG_Z != 0 {
				self.regs.pc = self.buildAddress(self.bus.read(self.regs.sp &+ 1), self.bus.read(self.regs.sp))
				self.regs.sp &+= 2
			}
		}
		opcodes[0xC9] = {
			// ret
			self.regs.pc = self.buildAddress(self.bus.read(self.regs.sp &+ 1), self.bus.read(self.regs.sp))
			self.regs.sp &+= 2
		}
		opcodes[0xCA] = {
			// jp FLAG_Z != 0,nn
			let address = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			if self.regs.main.f & FLAG_Z != 0 {
				self.regs.pc = address
			} else {
				self.regs.pc &+= 2
			}
		}
		opcodes[0xCB] = {
			// CB prefix
			self.id_opcode_table = table_CB
			self.fetchAndExec()
			self.id_opcode_table = table_NONE
		}
		opcodes[0xCC] = {
			// call FLAG_Z != 0,nn
			let address = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			self.regs.pc &+= 2
			if self.regs.main.f & FLAG_Z != 0 {
				self.call(address)
			}
		}
		opcodes[0xCD] = {
			// call nn
			let address = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			self.regs.pc &+= 2
			self.call(address)
		}
		opcodes[0xCE] = {
			// adc a,n
			self.regs.main.a = Alu.adc(self.regs.main.a, self.bus.read(self.regs.pc), flags: &self.regs.main.f)
			self.regs.pc &+= 1
		}
		opcodes[0xCF] = {
			// rst 0x0008
			self.call(0x0008)
		}
		opcodes[0xD0] = {
			// ret FLAG_C == 0
			self.clock.add(address: self.regs.ir_reg, cycles: 1)
			if self.regs.main.f & FLAG_C == 0 {
				self.regs.pc = self.buildAddress(self.bus.read(self.regs.sp &+ 1), self.bus.read(self.regs.sp))
				self.regs.sp &+= 2
			}
		}
		opcodes[0xD1] = {
			// pop main.de
			let value = self.buildAddress(self.bus.read(self.regs.sp &+ 1), self.bus.read(self.regs.sp))
			self.regs.sp &+= 2
			self.regs.main.de = value
		}
		opcodes[0xD2] = {
			// jp FLAG_C == 0,nn
			let address = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			if self.regs.main.f & FLAG_C == 0 {
				self.regs.pc = address
			} else {
				self.regs.pc &+= 2
			}
		}
		opcodes[0xD3] = {
			// out (n),a
			self.bus.ioWrite(self.buildAddress(self.regs.main.a, self.bus.read(self.regs.pc)), value: self.regs.main.a)
			self.regs.pc &+= 1
		}
		opcodes[0xD4] = {
			// call FLAG_C == 0,nn
			let address = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			self.regs.pc &+= 2
			if self.regs.main.f & FLAG_C == 0 {
				self.call(address)
			}
		}
		opcodes[0xD5] = {
			// push main.de
			self.clock.add(address: self.regs.ir_reg, cycles: 1)
			let value = self.regs.main.de
			self.bus.write(self.regs.sp &- 1, value: value.high)
			self.bus.write(self.regs.sp &- 2, value: value.low)
			self.regs.sp &-= 2
		}
		opcodes[0xD6] = {
			// sub a,n
			self.regs.main.a = Alu.sub(self.regs.main.a, self.bus.read(self.regs.pc), flags: &self.regs.main.f)
			self.regs.pc &+= 1
		}
		opcodes[0xD7] = {
			// rst 0x0010
			self.call(0x0010)
		}
		opcodes[0xD8] = {
			// ret FLAG_C != 0
			self.clock.add(address: self.regs.ir_reg, cycles: 1)
			if self.regs.main.f & FLAG_C != 0 {
				self.regs.pc = self.buildAddress(self.bus.read(self.regs.sp &+ 1), self.bus.read(self.regs.sp))
				self.regs.sp &+= 2
			}
		}
		opcodes[0xD9] = {
			// exx
			let bc_ = self.regs.alternate.bc
			let de_ = self.regs.alternate.de
			let hl_ = self.regs.alternate.hl
			self.regs.alternate.bc = self.regs.main.bc
			self.regs.alternate.de = self.regs.main.de
			self.regs.alternate.hl = self.regs.main.hl
			self.regs.main.bc = bc_
			self.regs.main.de = de_
			self.regs.main.hl = hl_
		}
		opcodes[0xDA] = {
			// jp FLAG_C != 0,nn
			let address = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			if self.regs.main.f & FLAG_C != 0 {
				self.regs.pc = address
			} else {
				self.regs.pc &+= 2
			}
		}
		opcodes[0xDB] = {
			// in a,(n)
			self.regs.main.a = self.bus.ioRead(self.buildAddress(self.regs.main.a, self.bus.read(self.regs.pc)))
			self.regs.pc &+= 1
		}
		opcodes[0xDC] = {
			// call FLAG_C != 0,nn
			let address = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			self.regs.pc &+= 2
			if self.regs.main.f & FLAG_C != 0 {
				self.call(address)
			}
		}
		opcodes[0xDD] = {
			// DD prefix
			self.id_opcode_table = table_XX
			self.swap_hl = SwapHL.ix
		}
		opcodes[0xDE] = {
			// sbc a,n
			self.regs.main.a = Alu.sbc(self.regs.main.a, self.bus.read(self.regs.pc), flags: &self.regs.main.f)
			self.regs.pc &+= 1
		}
		opcodes[0xDF] = {
			// rst 0x0018
			self.call(0x0018)
		}
		opcodes[0xE0] = {
			// ret FLAG_PV == 0
			self.clock.add(address: self.regs.ir_reg, cycles: 1)
			if self.regs.main.f & FLAG_PV == 0 {
				self.regs.pc = self.buildAddress(self.bus.read(self.regs.sp &+ 1), self.bus.read(self.regs.sp))
				self.regs.sp &+= 2
			}
		}
		opcodes[0xE1] = {
			// pop main.hl
			let value = self.buildAddress(self.bus.read(self.regs.sp &+ 1), self.bus.read(self.regs.sp))
			self.regs.sp &+= 2
			self.regs.main.hl = value
		}
		opcodes[0xE2] = {
			// jp FLAG_PV == 0,nn
			let address = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			if self.regs.main.f & FLAG_PV == 0 {
				self.regs.pc = address
			} else {
				self.regs.pc &+= 2
			}
		}
		opcodes[0xE3] = {
			// ex (sp),hl
			let hl_ = self.regs.main.hl
			self.regs.main.hl = self.buildAddress(self.bus.read(self.regs.sp &+ 1), self.bus.read(self.regs.sp))
			self.clock.add(address: self.regs.sp &+ 1, cycles: 1)
			self.bus.write(self.regs.sp, value: hl_.low)
			self.bus.write(self.regs.sp &+ 1, value: hl_.high)
			self.clock.add(address: self.regs.sp, cycles: 2)
		}
		opcodes[0xE4] = {
			// call FLAG_PV == 0,nn
			let address = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			self.regs.pc &+= 2
			if self.regs.main.f & FLAG_PV == 0 {
				self.call(address)
			}
		}
		opcodes[0xE5] = {
			// push main.hl
			self.clock.add(address: self.regs.ir_reg, cycles: 1)
			let value = self.regs.main.hl
			self.bus.write(self.regs.sp &- 1, value: value.high)
			self.bus.write(self.regs.sp &- 2, value: value.low)
			self.regs.sp &-= 2
		}
		opcodes[0xE6] = {
			// and a,n
			self.regs.main.a = Alu.and(self.regs.main.a, self.bus.read(self.regs.pc), flags: &self.regs.main.f)
			self.regs.pc &+= 1
		}
		opcodes[0xE7] = {
			// rst 0x0020
			self.call(0x0020)
		}
		opcodes[0xE8] = {
			// ret FLAG_PV != 0
			self.clock.add(address: self.regs.ir_reg, cycles: 1)
			if self.regs.main.f & FLAG_PV != 0 {
				self.regs.pc = self.buildAddress(self.bus.read(self.regs.sp &+ 1), self.bus.read(self.regs.sp))
				self.regs.sp &+= 2
			}
		}
		opcodes[0xE9] = {
			// jp (hl)
			self.regs.pc = self.regs.main.hl
		}
		opcodes[0xEA] = {
			// jp FLAG_PV != 0,nn
			let address = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			if self.regs.main.f & FLAG_PV != 0 {
				self.regs.pc = address
			} else {
				self.regs.pc &+= 2
			}
		}
		opcodes[0xEB] = {
			// ex de,hl
			let hl_ = self.regs.main.hl
			self.regs.main.hl = self.regs.main.de
			self.regs.main.de = hl_
		}
		opcodes[0xEC] = {
			// call FLAG_PV != 0,nn
			let address = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			self.regs.pc &+= 2
			if self.regs.main.f & FLAG_PV != 0 {
				self.call(address)
			}
		}
		opcodes[0xED] = {
			// ED prefix
			self.id_opcode_table = table_ED
			self.fetchAndExec()
			self.id_opcode_table = table_NONE
		}
		opcodes[0xEE] = {
			// xor a,n
			self.regs.main.a = Alu.xor(self.regs.main.a, self.bus.read(self.regs.pc), flags: &self.regs.main.f)
			self.regs.pc &+= 1
		}
		opcodes[0xEF] = {
			// rst 0x0028
			self.call(0x0028)
		}
		opcodes[0xF0] = {
			// ret FLAG_S == 0
			self.clock.add(address: self.regs.ir_reg, cycles: 1)
			if self.regs.main.f & FLAG_S == 0 {
				self.regs.pc = self.buildAddress(self.bus.read(self.regs.sp &+ 1), self.bus.read(self.regs.sp))
				self.regs.sp &+= 2
			}
		}
		opcodes[0xF1] = {
			// pop main.af
			let value = self.buildAddress(self.bus.read(self.regs.sp &+ 1), self.bus.read(self.regs.sp))
			self.regs.sp &+= 2
			self.regs.main.af = value
		}
		opcodes[0xF2] = {
			// jp FLAG_S == 0,nn
			let address = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			if self.regs.main.f & FLAG_S == 0 {
				self.regs.pc = address
			} else {
				self.regs.pc &+= 2
			}
		}
		opcodes[0xF3] = {
			// di
			self.interrupt_status.IFF1 = false
			self.interrupt_status.IFF2 = false
		}
		opcodes[0xF4] = {
			// call FLAG_S == 0,nn
			let address = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			self.regs.pc &+= 2
			if self.regs.main.f & FLAG_S == 0 {
				self.call(address)
			}
		}
		opcodes[0xF5] = {
			// push main.af
			self.clock.add(address: self.regs.ir_reg, cycles: 1)
			let value = self.regs.main.af
			self.bus.write(self.regs.sp &- 1, value: value.high)
			self.bus.write(self.regs.sp &- 2, value: value.low)
			self.regs.sp &-= 2
		}
		opcodes[0xF6] = {
			// or a,n
			self.regs.main.a = Alu.or(self.regs.main.a, self.bus.read(self.regs.pc), flags: &self.regs.main.f)
			self.regs.pc &+= 1
		}
		opcodes[0xF7] = {
			// rst 0x0030
			self.call(0x0030)
		}
		opcodes[0xF8] = {
			// ret FLAG_S != 0
			self.clock.add(address: self.regs.ir_reg, cycles: 1)
			if self.regs.main.f & FLAG_S != 0 {
				self.regs.pc = self.buildAddress(self.bus.read(self.regs.sp &+ 1), self.bus.read(self.regs.sp))
				self.regs.sp &+= 2
			}
		}
		opcodes[0xF9] = {
			// ld sp,hl
			self.regs.sp = self.regs.main.hl
			self.clock.add(address: self.regs.ir_reg, cycles: 2)
		}
		opcodes[0xFA] = {
			// jp FLAG_S != 0,nn
			let address = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			if self.regs.main.f & FLAG_S != 0 {
				self.regs.pc = address
			} else {
				self.regs.pc &+= 2
			}
		}
		opcodes[0xFB] = {
			// ei
			self.interrupt_status.IFF1 = true
			self.interrupt_status.IFF2 = true
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xFC] = {
			// call FLAG_S != 0,nn
			let address = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			self.regs.pc &+= 2
			if self.regs.main.f & FLAG_S != 0 {
				self.call(address)
			}
		}
		opcodes[0xFD] = {
			// FD prefix
			self.id_opcode_table = table_XX
			self.swap_hl = SwapHL.iy
		}
		opcodes[0xFE] = {
			// cp a,n
			_ = Alu.cp(self.regs.main.a, self.bus.read(self.regs.pc), flags: &self.regs.main.f)
			self.regs.pc &+= 1
		}
		opcodes[0xFF] = {
			// rst 0x0038
			self.call(0x0038)
		}
	}
}
