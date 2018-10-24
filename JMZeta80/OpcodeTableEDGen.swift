//
//  OpcodeTableCB.swift
//  JMZeta80
//
//  Created by Jose Luis Fernandez-Mayoralas on 4/10/18.
//  Copyright © 2018 Jose Luis Fernandez-Mayoralas. All rights reserved.
//

import Foundation

extension Cpu {
	func initOpcodeTableED(_ opcodes: inout OpcodeTable) {
		opcodes[0x00] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x01] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x02] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x03] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x04] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x05] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x06] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x07] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x08] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x09] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x0A] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x0B] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x0C] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x0D] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x0E] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x0F] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x10] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x11] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x12] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x13] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x14] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x15] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x16] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x17] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x18] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x19] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x1A] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x1B] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x1C] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x1D] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x1E] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x1F] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x20] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x21] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x22] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x23] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x24] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x25] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x26] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x27] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x28] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x29] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x2A] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x2B] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x2C] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x2D] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x2E] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x2F] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x30] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x31] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x32] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x33] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x34] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x35] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x36] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x37] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x38] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x39] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x3A] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x3B] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x3C] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x3D] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x3E] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x3F] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0x40] = {
			// in main.b,(c)
			let data = self.bus.ioRead(self.regs.main.bc)
			self.regs.main.f = self.regs.main.f & ~FLAG_S | data & FLAG_S
			if data == 0 { self.regs.main.f.set(bit: FLAG_Z) } else { self.regs.main.f.reset(bit: FLAG_Z) }
			if data.parity == 0 { self.regs.main.f.set(bit: FLAG_PV) } else { self.regs.main.f.reset(bit: FLAG_PV) }
			self.regs.main.f.reset(bit: FLAG_N)
			self.regs.main.f.reset(bit: FLAG_H)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | data & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | data & FLAG_5
			self.regs.main.b = data
		}
		opcodes[0x41] = {
			// out main.b,(c)
			self.bus.ioWrite(self.regs.main.bc, value: self.regs.main.b)
		}
		opcodes[0x42] = {
			// sbc hl,main.bc
			self.regs.main.hl = Alu.sbc(self.regs.main.hl, self.regs.main.bc, flags: &self.regs.main.f)
			self.clock.add(cycles: 7)
		}
		opcodes[0x43] = {
			// ld (nn),main.bc
			let address = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			let data = self.regs.main.bc
			self.bus.write(address, value: data.low)
			self.bus.write(address &+ 1, value: data.high)
			self.regs.pc &+= 2
		}
		opcodes[0x44] = {
			// neg
			self.regs.main.a = Alu.sub(0, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x45] = {
			// retn
			self.regs.pc = self.buildAddress(self.bus.read(self.regs.sp &+ 1), self.bus.read(self.regs.sp))
			self.regs.sp &+= 2
			self.interrupt_status.IFF1 = self.interrupt_status.IFF2
		}
		opcodes[0x46] = {
			// im 0
			self.interrupt_status.int_mode = 0
		}
		opcodes[0x47] = {
			// error z = 7
		}
		opcodes[0x48] = {
			// in main.c,(c)
			let data = self.bus.ioRead(self.regs.main.bc)
			self.regs.main.f = self.regs.main.f & ~FLAG_S | data & FLAG_S
			if data == 0 { self.regs.main.f.set(bit: FLAG_Z) } else { self.regs.main.f.reset(bit: FLAG_Z) }
			if data.parity == 0 { self.regs.main.f.set(bit: FLAG_PV) } else { self.regs.main.f.reset(bit: FLAG_PV) }
			self.regs.main.f.reset(bit: FLAG_N)
			self.regs.main.f.reset(bit: FLAG_H)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | data & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | data & FLAG_5
			self.regs.main.c = data
		}
		opcodes[0x49] = {
			// out main.c,(c)
			self.bus.ioWrite(self.regs.main.bc, value: self.regs.main.c)
		}
		opcodes[0x4A] = {
			// adc hl,main.bc
			self.regs.main.hl = Alu.adc(self.regs.main.hl, self.regs.main.bc, flags: &self.regs.main.f)
			self.clock.add(cycles: 7)
		}
		opcodes[0x4B] = {
			// ld main.bc,(nn)
			let address = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			self.regs.main.bc = self.buildAddress(self.bus.read(address &+ 1),self.bus.read(address))
			self.regs.pc &+= 2
		}
		opcodes[0x4C] = {
			// neg
			self.regs.main.a = Alu.sub(0, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x4D] = {
			// reti
			self.regs.pc = self.buildAddress(self.bus.read(self.regs.sp &+ 1), self.bus.read(self.regs.sp))
			self.regs.sp &+= 2
		}
		opcodes[0x4E] = {
			// im 1
			self.interrupt_status.int_mode = 1
		}
		opcodes[0x4F] = {
			// error z = 7
		}
		opcodes[0x50] = {
			// in main.d,(c)
			let data = self.bus.ioRead(self.regs.main.bc)
			self.regs.main.f = self.regs.main.f & ~FLAG_S | data & FLAG_S
			if data == 0 { self.regs.main.f.set(bit: FLAG_Z) } else { self.regs.main.f.reset(bit: FLAG_Z) }
			if data.parity == 0 { self.regs.main.f.set(bit: FLAG_PV) } else { self.regs.main.f.reset(bit: FLAG_PV) }
			self.regs.main.f.reset(bit: FLAG_N)
			self.regs.main.f.reset(bit: FLAG_H)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | data & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | data & FLAG_5
			self.regs.main.d = data
		}
		opcodes[0x51] = {
			// out main.d,(c)
			self.bus.ioWrite(self.regs.main.bc, value: self.regs.main.d)
		}
		opcodes[0x52] = {
			// sbc hl,main.de
			self.regs.main.hl = Alu.sbc(self.regs.main.hl, self.regs.main.de, flags: &self.regs.main.f)
			self.clock.add(cycles: 7)
		}
		opcodes[0x53] = {
			// ld (nn),main.de
			let address = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			let data = self.regs.main.de
			self.bus.write(address, value: data.low)
			self.bus.write(address &+ 1, value: data.high)
			self.regs.pc &+= 2
		}
		opcodes[0x54] = {
			// neg
			self.regs.main.a = Alu.sub(0, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x55] = {
			// retn
			self.regs.pc = self.buildAddress(self.bus.read(self.regs.sp &+ 1), self.bus.read(self.regs.sp))
			self.regs.sp &+= 2
			self.interrupt_status.IFF1 = self.interrupt_status.IFF2
		}
		opcodes[0x56] = {
			// im 1
			self.interrupt_status.int_mode = 1
		}
		opcodes[0x57] = {
			// error z = 7
		}
		opcodes[0x58] = {
			// in main.e,(c)
			let data = self.bus.ioRead(self.regs.main.bc)
			self.regs.main.f = self.regs.main.f & ~FLAG_S | data & FLAG_S
			if data == 0 { self.regs.main.f.set(bit: FLAG_Z) } else { self.regs.main.f.reset(bit: FLAG_Z) }
			if data.parity == 0 { self.regs.main.f.set(bit: FLAG_PV) } else { self.regs.main.f.reset(bit: FLAG_PV) }
			self.regs.main.f.reset(bit: FLAG_N)
			self.regs.main.f.reset(bit: FLAG_H)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | data & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | data & FLAG_5
			self.regs.main.e = data
		}
		opcodes[0x59] = {
			// out main.e,(c)
			self.bus.ioWrite(self.regs.main.bc, value: self.regs.main.e)
		}
		opcodes[0x5A] = {
			// adc hl,main.de
			self.regs.main.hl = Alu.adc(self.regs.main.hl, self.regs.main.de, flags: &self.regs.main.f)
			self.clock.add(cycles: 7)
		}
		opcodes[0x5B] = {
			// ld main.de,(nn)
			let address = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			self.regs.main.de = self.buildAddress(self.bus.read(address &+ 1),self.bus.read(address))
			self.regs.pc &+= 2
		}
		opcodes[0x5C] = {
			// neg
			self.regs.main.a = Alu.sub(0, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x5D] = {
			// retn
			self.regs.pc = self.buildAddress(self.bus.read(self.regs.sp &+ 1), self.bus.read(self.regs.sp))
			self.regs.sp &+= 2
			self.interrupt_status.IFF1 = self.interrupt_status.IFF2
		}
		opcodes[0x5E] = {
			// im 2
			self.interrupt_status.int_mode = 2
		}
		opcodes[0x5F] = {
			// error z = 7
		}
		opcodes[0x60] = {
			// in main.h,(c)
			let data = self.bus.ioRead(self.regs.main.bc)
			self.regs.main.f = self.regs.main.f & ~FLAG_S | data & FLAG_S
			if data == 0 { self.regs.main.f.set(bit: FLAG_Z) } else { self.regs.main.f.reset(bit: FLAG_Z) }
			if data.parity == 0 { self.regs.main.f.set(bit: FLAG_PV) } else { self.regs.main.f.reset(bit: FLAG_PV) }
			self.regs.main.f.reset(bit: FLAG_N)
			self.regs.main.f.reset(bit: FLAG_H)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | data & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | data & FLAG_5
			self.regs.main.h = data
		}
		opcodes[0x61] = {
			// out main.h,(c)
			self.bus.ioWrite(self.regs.main.bc, value: self.regs.main.h)
		}
		opcodes[0x62] = {
			// sbc hl,main.hl
			self.regs.main.hl = Alu.sbc(self.regs.main.hl, self.regs.main.hl, flags: &self.regs.main.f)
			self.clock.add(cycles: 7)
		}
		opcodes[0x63] = {
			// ld (nn),main.hl
			let address = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			let data = self.regs.main.hl
			self.bus.write(address, value: data.low)
			self.bus.write(address &+ 1, value: data.high)
			self.regs.pc &+= 2
		}
		opcodes[0x64] = {
			// neg
			self.regs.main.a = Alu.sub(0, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x65] = {
			// retn
			self.regs.pc = self.buildAddress(self.bus.read(self.regs.sp &+ 1), self.bus.read(self.regs.sp))
			self.regs.sp &+= 2
			self.interrupt_status.IFF1 = self.interrupt_status.IFF2
		}
		opcodes[0x66] = {
			// im 0
			self.interrupt_status.int_mode = 0
		}
		opcodes[0x67] = {
			// error z = 7
		}
		opcodes[0x68] = {
			// in main.l,(c)
			let data = self.bus.ioRead(self.regs.main.bc)
			self.regs.main.f = self.regs.main.f & ~FLAG_S | data & FLAG_S
			if data == 0 { self.regs.main.f.set(bit: FLAG_Z) } else { self.regs.main.f.reset(bit: FLAG_Z) }
			if data.parity == 0 { self.regs.main.f.set(bit: FLAG_PV) } else { self.regs.main.f.reset(bit: FLAG_PV) }
			self.regs.main.f.reset(bit: FLAG_N)
			self.regs.main.f.reset(bit: FLAG_H)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | data & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | data & FLAG_5
			self.regs.main.l = data
		}
		opcodes[0x69] = {
			// out main.l,(c)
			self.bus.ioWrite(self.regs.main.bc, value: self.regs.main.l)
		}
		opcodes[0x6A] = {
			// adc hl,main.hl
			self.regs.main.hl = Alu.adc(self.regs.main.hl, self.regs.main.hl, flags: &self.regs.main.f)
			self.clock.add(cycles: 7)
		}
		opcodes[0x6B] = {
			// ld main.hl,(nn)
			let address = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			self.regs.main.hl = self.buildAddress(self.bus.read(address &+ 1),self.bus.read(address))
			self.regs.pc &+= 2
		}
		opcodes[0x6C] = {
			// neg
			self.regs.main.a = Alu.sub(0, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x6D] = {
			// retn
			self.regs.pc = self.buildAddress(self.bus.read(self.regs.sp &+ 1), self.bus.read(self.regs.sp))
			self.regs.sp &+= 2
			self.interrupt_status.IFF1 = self.interrupt_status.IFF2
		}
		opcodes[0x6E] = {
			// im 1
			self.interrupt_status.int_mode = 1
		}
		opcodes[0x6F] = {
			// error z = 7
		}
		opcodes[0x70] = {
			// in _,(c)
			let data = self.bus.ioRead(self.regs.main.bc)
			self.regs.main.f = self.regs.main.f & ~FLAG_S | data & FLAG_S
			if data == 0 { self.regs.main.f.set(bit: FLAG_Z) } else { self.regs.main.f.reset(bit: FLAG_Z) }
			if data.parity == 0 { self.regs.main.f.set(bit: FLAG_PV) } else { self.regs.main.f.reset(bit: FLAG_PV) }
			self.regs.main.f.reset(bit: FLAG_N)
			self.regs.main.f.reset(bit: FLAG_H)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | data & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | data & FLAG_5
		}
		opcodes[0x71] = {
			// out _,(c)
			self.bus.ioWrite(self.regs.main.bc, value: 0x00)
		}
		opcodes[0x72] = {
			// sbc hl,sp
			self.regs.main.hl = Alu.sbc(self.regs.main.hl, self.regs.sp, flags: &self.regs.main.f)
			self.clock.add(cycles: 7)
		}
		opcodes[0x73] = {
			// ld (nn),sp
			let address = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			let data = self.regs.sp
			self.bus.write(address, value: data.low)
			self.bus.write(address &+ 1, value: data.high)
			self.regs.pc &+= 2
		}
		opcodes[0x74] = {
			// neg
			self.regs.main.a = Alu.sub(0, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x75] = {
			// retn
			self.regs.pc = self.buildAddress(self.bus.read(self.regs.sp &+ 1), self.bus.read(self.regs.sp))
			self.regs.sp &+= 2
			self.interrupt_status.IFF1 = self.interrupt_status.IFF2
		}
		opcodes[0x76] = {
			// im 1
			self.interrupt_status.int_mode = 1
		}
		opcodes[0x77] = {
			// error z = 7
		}
		opcodes[0x78] = {
			// in main.a,(c)
			let data = self.bus.ioRead(self.regs.main.bc)
			self.regs.main.f = self.regs.main.f & ~FLAG_S | data & FLAG_S
			if data == 0 { self.regs.main.f.set(bit: FLAG_Z) } else { self.regs.main.f.reset(bit: FLAG_Z) }
			if data.parity == 0 { self.regs.main.f.set(bit: FLAG_PV) } else { self.regs.main.f.reset(bit: FLAG_PV) }
			self.regs.main.f.reset(bit: FLAG_N)
			self.regs.main.f.reset(bit: FLAG_H)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | data & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | data & FLAG_5
			self.regs.main.a = data
		}
		opcodes[0x79] = {
			// out main.a,(c)
			self.bus.ioWrite(self.regs.main.bc, value: self.regs.main.a)
		}
		opcodes[0x7A] = {
			// adc hl,sp
			self.regs.main.hl = Alu.adc(self.regs.main.hl, self.regs.sp, flags: &self.regs.main.f)
			self.clock.add(cycles: 7)
		}
		opcodes[0x7B] = {
			// ld sp,(nn)
			let address = self.buildAddress(self.bus.read(self.regs.pc &+ 1), self.bus.read(self.regs.pc))
			self.regs.sp = self.buildAddress(self.bus.read(address &+ 1),self.bus.read(address))
			self.regs.pc &+= 2
		}
		opcodes[0x7C] = {
			// neg
			self.regs.main.a = Alu.sub(0, self.regs.main.a, flags: &self.regs.main.f)
		}
		opcodes[0x7D] = {
			// retn
			self.regs.pc = self.buildAddress(self.bus.read(self.regs.sp &+ 1), self.bus.read(self.regs.sp))
			self.regs.sp &+= 2
			self.interrupt_status.IFF1 = self.interrupt_status.IFF2
		}
		opcodes[0x7E] = {
			// im 2
			self.interrupt_status.int_mode = 2
		}
		opcodes[0x7F] = {
			// error z = 7
		}
		opcodes[0x80] = {
		}
		opcodes[0x81] = {
		}
		opcodes[0x82] = {
		}
		opcodes[0x83] = {
		}
		opcodes[0x84] = {
		}
		opcodes[0x85] = {
		}
		opcodes[0x86] = {
		}
		opcodes[0x87] = {
		}
		opcodes[0x88] = {
		}
		opcodes[0x89] = {
		}
		opcodes[0x8A] = {
		}
		opcodes[0x8B] = {
		}
		opcodes[0x8C] = {
		}
		opcodes[0x8D] = {
		}
		opcodes[0x8E] = {
		}
		opcodes[0x8F] = {
		}
		opcodes[0x90] = {
		}
		opcodes[0x91] = {
		}
		opcodes[0x92] = {
		}
		opcodes[0x93] = {
		}
		opcodes[0x94] = {
		}
		opcodes[0x95] = {
		}
		opcodes[0x96] = {
		}
		opcodes[0x97] = {
		}
		opcodes[0x98] = {
		}
		opcodes[0x99] = {
		}
		opcodes[0x9A] = {
		}
		opcodes[0x9B] = {
		}
		opcodes[0x9C] = {
		}
		opcodes[0x9D] = {
		}
		opcodes[0x9E] = {
		}
		opcodes[0x9F] = {
		}
		opcodes[0xA0] = {
		}
		opcodes[0xA1] = {
		}
		opcodes[0xA2] = {
		}
		opcodes[0xA3] = {
		}
		opcodes[0xA4] = {
		}
		opcodes[0xA5] = {
		}
		opcodes[0xA6] = {
		}
		opcodes[0xA7] = {
		}
		opcodes[0xA8] = {
		}
		opcodes[0xA9] = {
		}
		opcodes[0xAA] = {
		}
		opcodes[0xAB] = {
		}
		opcodes[0xAC] = {
		}
		opcodes[0xAD] = {
		}
		opcodes[0xAE] = {
		}
		opcodes[0xAF] = {
		}
		opcodes[0xB0] = {
		}
		opcodes[0xB1] = {
		}
		opcodes[0xB2] = {
		}
		opcodes[0xB3] = {
		}
		opcodes[0xB4] = {
		}
		opcodes[0xB5] = {
		}
		opcodes[0xB6] = {
		}
		opcodes[0xB7] = {
		}
		opcodes[0xB8] = {
		}
		opcodes[0xB9] = {
		}
		opcodes[0xBA] = {
		}
		opcodes[0xBB] = {
		}
		opcodes[0xBC] = {
		}
		opcodes[0xBD] = {
		}
		opcodes[0xBE] = {
		}
		opcodes[0xBF] = {
		}
		opcodes[0xC0] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xC1] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xC2] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xC3] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xC4] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xC5] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xC6] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xC7] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xC8] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xC9] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xCA] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xCB] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xCC] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xCD] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xCE] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xCF] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xD0] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xD1] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xD2] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xD3] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xD4] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xD5] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xD6] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xD7] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xD8] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xD9] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xDA] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xDB] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xDC] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xDD] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xDE] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xDF] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xE0] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xE1] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xE2] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xE3] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xE4] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xE5] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xE6] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xE7] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xE8] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xE9] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xEA] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xEB] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xEC] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xED] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xEE] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xEF] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xF0] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xF1] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xF2] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xF3] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xF4] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xF5] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xF6] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xF7] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xF8] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xF9] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xFA] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xFB] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xFC] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xFD] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xFE] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
		opcodes[0xFF] = {
			// noni (NOP plus interruptions not allowed for the next instruction)
			self.interrupt_status.pending_execution = true
		}
	}
}
