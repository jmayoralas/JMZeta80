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
			// ld (main.bc),a
			self.bus.write(self.regs.main.bc, value: self.regs.main.a)
		}
		opcodes[0x03] = {
			// inc main.bc
			self.clock.add(cycles: 2)
			self.regs.main.bc &+= 1
		}
		opcodes[0x04] = {
			// inc main.b
			if self.regs.main.b == 0x7F { self.regs.main.f.set(bit: FLAG_PV) }
			else { self.regs.main.f.reset(bit: FLAG_PV) }
			if self.regs.main.b & 0x0F == 0xF {
				self.regs.main.f.set(bit: FLAG_H)
			} else {
				self.regs.main.f.reset(bit: FLAG_H)
			}
			self.regs.main.b &+= 1
			self.regs.main.f = self.regs.main.f & ~FLAG_S | self.regs.main.b & FLAG_S
			if self.regs.main.b == 0 { self.regs.main.f.set(bit: FLAG_Z) }
			else { self.regs.main.f.reset(bit: FLAG_Z) }
			self.regs.main.f.reset(bit: FLAG_N)
		}
		opcodes[0x05] = {
			// dec main.b
			if self.regs.main.b == 0x80 { self.regs.main.f.set(bit: FLAG_PV) }
			else { self.regs.main.f.reset(bit: FLAG_PV) }
			if self.regs.main.b & 0x0F == 0 {
				self.regs.main.f.set(bit: FLAG_H)
			} else {
				self.regs.main.f.reset(bit: FLAG_H)
			}
			self.regs.main.b &-= 1
			self.regs.main.f = self.regs.main.f & ~FLAG_S | self.regs.main.b & FLAG_S
			if self.regs.main.b == 0 { self.regs.main.f.set(bit: FLAG_Z) }
			else { self.regs.main.f.reset(bit: FLAG_Z) }
			self.regs.main.f.set(bit: FLAG_N)
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
			let pre_h = self.regs.main.h
			self.regs.main.hl &+= added_value
			let post_h = self.regs.main.h
			self.regs.main.f.reset(bit: FLAG_N)
			if self.regs.main.hl < added_value {
				self.regs.main.f.set(bit: FLAG_C)
			} else {
				self.regs.main.f.reset(bit: FLAG_C)
			}
			if post_h.low < pre_h.low || ((post_h.low == pre_h.low) && (post_h.high > pre_h.high)) {
				self.regs.main.f.set(bit: FLAG_H)
			} else {
				self.regs.main.f.reset(bit: FLAG_H)
			}
		}
		opcodes[0x0A] = {
			// ld a,(main.bc)
			self.regs.main.a = self.bus.read(self.regs.main.bc)
		}
		opcodes[0x0B] = {
			// dec main.bc
			self.clock.add(cycles: 2)
			self.regs.main.bc &-= 1
		}
		opcodes[0x0C] = {
			// inc main.c
			if self.regs.main.c == 0x7F { self.regs.main.f.set(bit: FLAG_PV) }
			else { self.regs.main.f.reset(bit: FLAG_PV) }
			if self.regs.main.c & 0x0F == 0xF {
				self.regs.main.f.set(bit: FLAG_H)
			} else {
				self.regs.main.f.reset(bit: FLAG_H)
			}
			self.regs.main.c &+= 1
			self.regs.main.f = self.regs.main.f & ~FLAG_S | self.regs.main.c & FLAG_S
			if self.regs.main.c == 0 { self.regs.main.f.set(bit: FLAG_Z) }
			else { self.regs.main.f.reset(bit: FLAG_Z) }
			self.regs.main.f.reset(bit: FLAG_N)
		}
		opcodes[0x0D] = {
			// dec main.c
			if self.regs.main.c == 0x80 { self.regs.main.f.set(bit: FLAG_PV) }
			else { self.regs.main.f.reset(bit: FLAG_PV) }
			if self.regs.main.c & 0x0F == 0 {
				self.regs.main.f.set(bit: FLAG_H)
			} else {
				self.regs.main.f.reset(bit: FLAG_H)
			}
			self.regs.main.c &-= 1
			self.regs.main.f = self.regs.main.f & ~FLAG_S | self.regs.main.c & FLAG_S
			if self.regs.main.c == 0 { self.regs.main.f.set(bit: FLAG_Z) }
			else { self.regs.main.f.reset(bit: FLAG_Z) }
			self.regs.main.f.set(bit: FLAG_N)
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
			// ld (main.de),a
			self.bus.write(self.regs.main.de, value: self.regs.main.a)
		}
		opcodes[0x13] = {
			// inc main.de
			self.clock.add(cycles: 2)
			self.regs.main.de &+= 1
		}
		opcodes[0x14] = {
			// inc main.d
			if self.regs.main.d == 0x7F { self.regs.main.f.set(bit: FLAG_PV) }
			else { self.regs.main.f.reset(bit: FLAG_PV) }
			if self.regs.main.d & 0x0F == 0xF {
				self.regs.main.f.set(bit: FLAG_H)
			} else {
				self.regs.main.f.reset(bit: FLAG_H)
			}
			self.regs.main.d &+= 1
			self.regs.main.f = self.regs.main.f & ~FLAG_S | self.regs.main.d & FLAG_S
			if self.regs.main.d == 0 { self.regs.main.f.set(bit: FLAG_Z) }
			else { self.regs.main.f.reset(bit: FLAG_Z) }
			self.regs.main.f.reset(bit: FLAG_N)
		}
		opcodes[0x15] = {
			// dec main.d
			if self.regs.main.d == 0x80 { self.regs.main.f.set(bit: FLAG_PV) }
			else { self.regs.main.f.reset(bit: FLAG_PV) }
			if self.regs.main.d & 0x0F == 0 {
				self.regs.main.f.set(bit: FLAG_H)
			} else {
				self.regs.main.f.reset(bit: FLAG_H)
			}
			self.regs.main.d &-= 1
			self.regs.main.f = self.regs.main.f & ~FLAG_S | self.regs.main.d & FLAG_S
			if self.regs.main.d == 0 { self.regs.main.f.set(bit: FLAG_Z) }
			else { self.regs.main.f.reset(bit: FLAG_Z) }
			self.regs.main.f.set(bit: FLAG_N)
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
			let pre_h = self.regs.main.h
			self.regs.main.hl &+= added_value
			let post_h = self.regs.main.h
			self.regs.main.f.reset(bit: FLAG_N)
			if self.regs.main.hl < added_value {
				self.regs.main.f.set(bit: FLAG_C)
			} else {
				self.regs.main.f.reset(bit: FLAG_C)
			}
			if post_h.low < pre_h.low || ((post_h.low == pre_h.low) && (post_h.high > pre_h.high)) {
				self.regs.main.f.set(bit: FLAG_H)
			} else {
				self.regs.main.f.reset(bit: FLAG_H)
			}
		}
		opcodes[0x1A] = {
			// ld a,(main.de)
			self.regs.main.a = self.bus.read(self.regs.main.de)
		}
		opcodes[0x1B] = {
			// dec main.de
			self.clock.add(cycles: 2)
			self.regs.main.de &-= 1
		}
		opcodes[0x1C] = {
			// inc main.e
			if self.regs.main.e == 0x7F { self.regs.main.f.set(bit: FLAG_PV) }
			else { self.regs.main.f.reset(bit: FLAG_PV) }
			if self.regs.main.e & 0x0F == 0xF {
				self.regs.main.f.set(bit: FLAG_H)
			} else {
				self.regs.main.f.reset(bit: FLAG_H)
			}
			self.regs.main.e &+= 1
			self.regs.main.f = self.regs.main.f & ~FLAG_S | self.regs.main.e & FLAG_S
			if self.regs.main.e == 0 { self.regs.main.f.set(bit: FLAG_Z) }
			else { self.regs.main.f.reset(bit: FLAG_Z) }
			self.regs.main.f.reset(bit: FLAG_N)
		}
		opcodes[0x1D] = {
			// dec main.e
			if self.regs.main.e == 0x80 { self.regs.main.f.set(bit: FLAG_PV) }
			else { self.regs.main.f.reset(bit: FLAG_PV) }
			if self.regs.main.e & 0x0F == 0 {
				self.regs.main.f.set(bit: FLAG_H)
			} else {
				self.regs.main.f.reset(bit: FLAG_H)
			}
			self.regs.main.e &-= 1
			self.regs.main.f = self.regs.main.f & ~FLAG_S | self.regs.main.e & FLAG_S
			if self.regs.main.e == 0 { self.regs.main.f.set(bit: FLAG_Z) }
			else { self.regs.main.f.reset(bit: FLAG_Z) }
			self.regs.main.f.set(bit: FLAG_N)
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
			self.regs.main.f.reset(bit: FLAG_C)
			self.regs.main.a |= (self.regs.main.f & FLAG_C) << 7
			self.regs.main.f |= bit_0
			self.regs.main.f.reset(bit: FLAG_H)
			self.regs.main.f.reset(bit: FLAG_N)
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
			// ld (nn),hl
			let address = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			self.regs.pc &+= 2
			self.bus.write(address, value: self.regs.main.l)
			self.bus.write(address &+ 1, value: self.regs.main.h)
		}
		opcodes[0x23] = {
			// inc main.hl
			self.clock.add(cycles: 2)
			self.regs.main.hl &+= 1
		}
		opcodes[0x24] = {
			// inc main.h
			if self.regs.main.h == 0x7F { self.regs.main.f.set(bit: FLAG_PV) }
			else { self.regs.main.f.reset(bit: FLAG_PV) }
			if self.regs.main.h & 0x0F == 0xF {
				self.regs.main.f.set(bit: FLAG_H)
			} else {
				self.regs.main.f.reset(bit: FLAG_H)
			}
			self.regs.main.h &+= 1
			self.regs.main.f = self.regs.main.f & ~FLAG_S | self.regs.main.h & FLAG_S
			if self.regs.main.h == 0 { self.regs.main.f.set(bit: FLAG_Z) }
			else { self.regs.main.f.reset(bit: FLAG_Z) }
			self.regs.main.f.reset(bit: FLAG_N)
		}
		opcodes[0x25] = {
			// dec main.h
			if self.regs.main.h == 0x80 { self.regs.main.f.set(bit: FLAG_PV) }
			else { self.regs.main.f.reset(bit: FLAG_PV) }
			if self.regs.main.h & 0x0F == 0 {
				self.regs.main.f.set(bit: FLAG_H)
			} else {
				self.regs.main.f.reset(bit: FLAG_H)
			}
			self.regs.main.h &-= 1
			self.regs.main.f = self.regs.main.f & ~FLAG_S | self.regs.main.h & FLAG_S
			if self.regs.main.h == 0 { self.regs.main.f.set(bit: FLAG_Z) }
			else { self.regs.main.f.reset(bit: FLAG_Z) }
			self.regs.main.f.set(bit: FLAG_N)
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
				self.regs.main.a -= add
			} else {
				self.regs.main.a += add
			}
			if self.regs.main.a.parity == 0 {
				self.regs.main.f.set(bit: FLAG_PV) // even parity
			} else {
				self.regs.main.f.reset(bit: FLAG_PV) // odd parity
			}
			self.regs.main.f = self.regs.main.f & ~FLAG_C | carry & FLAG_C
			self.regs.main.f = self.regs.main.f & ~FLAG_S | self.regs.main.a & FLAG_S
			if self.regs.main.a == 0 { self.regs.main.f.set(bit: FLAG_Z) }
			else { self.regs.main.f.reset(bit: FLAG_Z) }
			if self.regs.main.a & 0x0F < a.low {
				self.regs.main.f.set(bit: FLAG_H)
			} else {
				self.regs.main.f.reset(bit: FLAG_H)
			}
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
			let pre_h = self.regs.main.h
			self.regs.main.hl &+= added_value
			let post_h = self.regs.main.h
			self.regs.main.f.reset(bit: FLAG_N)
			if self.regs.main.hl < added_value {
				self.regs.main.f.set(bit: FLAG_C)
			} else {
				self.regs.main.f.reset(bit: FLAG_C)
			}
			if post_h.low < pre_h.low || ((post_h.low == pre_h.low) && (post_h.high > pre_h.high)) {
				self.regs.main.f.set(bit: FLAG_H)
			} else {
				self.regs.main.f.reset(bit: FLAG_H)
			}
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
			self.clock.add(cycles: 2)
			self.regs.main.hl &-= 1
		}
		opcodes[0x2C] = {
			// inc main.l
			if self.regs.main.l == 0x7F { self.regs.main.f.set(bit: FLAG_PV) }
			else { self.regs.main.f.reset(bit: FLAG_PV) }
			if self.regs.main.l & 0x0F == 0xF {
				self.regs.main.f.set(bit: FLAG_H)
			} else {
				self.regs.main.f.reset(bit: FLAG_H)
			}
			self.regs.main.l &+= 1
			self.regs.main.f = self.regs.main.f & ~FLAG_S | self.regs.main.l & FLAG_S
			if self.regs.main.l == 0 { self.regs.main.f.set(bit: FLAG_Z) }
			else { self.regs.main.f.reset(bit: FLAG_Z) }
			self.regs.main.f.reset(bit: FLAG_N)
		}
		opcodes[0x2D] = {
			// dec main.l
			if self.regs.main.l == 0x80 { self.regs.main.f.set(bit: FLAG_PV) }
			else { self.regs.main.f.reset(bit: FLAG_PV) }
			if self.regs.main.l & 0x0F == 0 {
				self.regs.main.f.set(bit: FLAG_H)
			} else {
				self.regs.main.f.reset(bit: FLAG_H)
			}
			self.regs.main.l &-= 1
			self.regs.main.f = self.regs.main.f & ~FLAG_S | self.regs.main.l & FLAG_S
			if self.regs.main.l == 0 { self.regs.main.f.set(bit: FLAG_Z) }
			else { self.regs.main.f.reset(bit: FLAG_Z) }
			self.regs.main.f.set(bit: FLAG_N)
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
			// ld (nn),a
			self.bus.write(self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc)), value: self.regs.main.a)
			self.regs.pc &+= 2
		}
		opcodes[0x33] = {
			// inc sp
			self.clock.add(cycles: 2)
			self.regs.sp &+= 1
		}
		opcodes[0x34] = {
			// inc (hl)
			var data = self.bus.read(self.regs.main.hl)
			if data == 0x7F { self.regs.main.f.set(bit: FLAG_PV) }
			else { self.regs.main.f.reset(bit: FLAG_PV) }
			if data & 0x0F == 0xF {
				self.regs.main.f.set(bit: FLAG_H)
			} else {
				self.regs.main.f.reset(bit: FLAG_H)
			}
			data &+= 1
			self.regs.main.f = self.regs.main.f & ~FLAG_S | data & FLAG_S
			if data == 0 { self.regs.main.f.set(bit: FLAG_Z) }
			else { self.regs.main.f.reset(bit: FLAG_Z) }
			self.regs.main.f.reset(bit: FLAG_N)
			self.bus.write(self.regs.main.hl, value: data)
			self.clock.add(cycles: 1)
		}
		opcodes[0x35] = {
			// dec (hl)
			var data = self.bus.read(self.regs.main.hl)
			if data == 0x80 { self.regs.main.f.set(bit: FLAG_PV) }
			else { self.regs.main.f.reset(bit: FLAG_PV) }
			if data & 0x0F == 0 {
				self.regs.main.f.set(bit: FLAG_H)
			} else {
				self.regs.main.f.reset(bit: FLAG_H)
			}
			data &-= 1
			self.regs.main.f = self.regs.main.f & ~FLAG_S | data & FLAG_S
			if data == 0 { self.regs.main.f.set(bit: FLAG_Z) }
			else { self.regs.main.f.reset(bit: FLAG_Z) }
			self.regs.main.f.set(bit: FLAG_N)
			self.bus.write(self.regs.main.hl, value: data)
			self.clock.add(cycles: 1)
		}
		opcodes[0x36] = {
			// ld (hl),n
			self.bus.write(self.regs.main.hl, value: self.bus.read(self.regs.pc))
			self.regs.pc &+= 1
		}
		opcodes[0x37] = {
			// scf
			self.regs.main.f.set(bit: FLAG_C)
			self.regs.main.f.reset(bit: FLAG_H)
			self.regs.main.f.reset(bit: FLAG_N)
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
			let pre_h = self.regs.main.h
			self.regs.main.hl &+= added_value
			let post_h = self.regs.main.h
			self.regs.main.f.reset(bit: FLAG_N)
			if self.regs.main.hl < added_value {
				self.regs.main.f.set(bit: FLAG_C)
			} else {
				self.regs.main.f.reset(bit: FLAG_C)
			}
			if post_h.low < pre_h.low || ((post_h.low == pre_h.low) && (post_h.high > pre_h.high)) {
				self.regs.main.f.set(bit: FLAG_H)
			} else {
				self.regs.main.f.reset(bit: FLAG_H)
			}
		}
		opcodes[0x3A] = {
			// ld a,(nn)
			self.regs.main.a = self.bus.read(self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc)))
			self.regs.pc &+= 2
		}
		opcodes[0x3B] = {
			// dec sp
			self.clock.add(cycles: 2)
			self.regs.sp &-= 1
		}
		opcodes[0x3C] = {
			// inc main.a
			if self.regs.main.a == 0x7F { self.regs.main.f.set(bit: FLAG_PV) }
			else { self.regs.main.f.reset(bit: FLAG_PV) }
			if self.regs.main.a & 0x0F == 0xF {
				self.regs.main.f.set(bit: FLAG_H)
			} else {
				self.regs.main.f.reset(bit: FLAG_H)
			}
			self.regs.main.a &+= 1
			self.regs.main.f = self.regs.main.f & ~FLAG_S | self.regs.main.a & FLAG_S
			if self.regs.main.a == 0 { self.regs.main.f.set(bit: FLAG_Z) }
			else { self.regs.main.f.reset(bit: FLAG_Z) }
			self.regs.main.f.reset(bit: FLAG_N)
		}
		opcodes[0x3D] = {
			// dec main.a
			if self.regs.main.a == 0x80 { self.regs.main.f.set(bit: FLAG_PV) }
			else { self.regs.main.f.reset(bit: FLAG_PV) }
			if self.regs.main.a & 0x0F == 0 {
				self.regs.main.f.set(bit: FLAG_H)
			} else {
				self.regs.main.f.reset(bit: FLAG_H)
			}
			self.regs.main.a &-= 1
			self.regs.main.f = self.regs.main.f & ~FLAG_S | self.regs.main.a & FLAG_S
			if self.regs.main.a == 0 { self.regs.main.f.set(bit: FLAG_Z) }
			else { self.regs.main.f.reset(bit: FLAG_Z) }
			self.regs.main.f.set(bit: FLAG_N)
		}
		opcodes[0x3E] = {
			// ld main.a,n
			self.regs.main.a = self.bus.read(self.regs.pc)
			self.regs.pc &+= 1
		}
		opcodes[0x3F] = {
			// ccf
			let carry = self.regs.main.f & FLAG_C
			if carry != 0 { self.regs.main.f.reset(bit: FLAG_C) }
			else { self.regs.main.f.set(bit: FLAG_C) }
			self.regs.main.f.reset(bit: FLAG_H)
			self.regs.main.f |= carry << 4
			self.regs.main.f.reset(bit: FLAG_N)
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
