//
//  OpcodeTableXXCB.swift
//  JMZeta80
//
//  Created by Jose Luis Fernandez-Mayoralas on 4/10/18.
//  Copyright © 2018 Jose Luis Fernandez-Mayoralas. All rights reserved.
//

import Foundation

extension Cpu {
	func initOpcodeTableXXCB(_ opcodes: inout OpcodeTable) {
		opcodes[0x00] = {
			// rlc (ix+d) -> main.b
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.b = Alu.rlc(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.b)
		}
		opcodes[0x01] = {
			// rlc (ix+d) -> main.c
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.c = Alu.rlc(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.c)
		}
		opcodes[0x02] = {
			// rlc (ix+d) -> main.d
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.d = Alu.rlc(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.d)
		}
		opcodes[0x03] = {
			// rlc (ix+d) -> main.e
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.e = Alu.rlc(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.e)
		}
		opcodes[0x04] = {
			// rlc (ix+d) -> main.h
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.h = Alu.rlc(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.h)
		}
		opcodes[0x05] = {
			// rlc (ix+d) -> main.l
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.l = Alu.rlc(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.l)
		}
		opcodes[0x06] = {
			// rlc (ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			let data = Alu.rlc(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: data)
		}
		opcodes[0x07] = {
			// rlc (ix+d) -> main.a
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.a = Alu.rlc(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.a)
		}
		opcodes[0x08] = {
			// rrc (ix+d) -> main.b
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.b = Alu.rrc(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.b)
		}
		opcodes[0x09] = {
			// rrc (ix+d) -> main.c
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.c = Alu.rrc(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.c)
		}
		opcodes[0x0A] = {
			// rrc (ix+d) -> main.d
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.d = Alu.rrc(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.d)
		}
		opcodes[0x0B] = {
			// rrc (ix+d) -> main.e
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.e = Alu.rrc(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.e)
		}
		opcodes[0x0C] = {
			// rrc (ix+d) -> main.h
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.h = Alu.rrc(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.h)
		}
		opcodes[0x0D] = {
			// rrc (ix+d) -> main.l
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.l = Alu.rrc(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.l)
		}
		opcodes[0x0E] = {
			// rrc (ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			let data = Alu.rrc(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: data)
		}
		opcodes[0x0F] = {
			// rrc (ix+d) -> main.a
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.a = Alu.rrc(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.a)
		}
		opcodes[0x10] = {
			// rl (ix+d) -> main.b
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.b = Alu.rl(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.b)
		}
		opcodes[0x11] = {
			// rl (ix+d) -> main.c
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.c = Alu.rl(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.c)
		}
		opcodes[0x12] = {
			// rl (ix+d) -> main.d
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.d = Alu.rl(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.d)
		}
		opcodes[0x13] = {
			// rl (ix+d) -> main.e
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.e = Alu.rl(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.e)
		}
		opcodes[0x14] = {
			// rl (ix+d) -> main.h
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.h = Alu.rl(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.h)
		}
		opcodes[0x15] = {
			// rl (ix+d) -> main.l
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.l = Alu.rl(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.l)
		}
		opcodes[0x16] = {
			// rl (ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			let data = Alu.rl(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: data)
		}
		opcodes[0x17] = {
			// rl (ix+d) -> main.a
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.a = Alu.rl(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.a)
		}
		opcodes[0x18] = {
			// rr (ix+d) -> main.b
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.b = Alu.rr(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.b)
		}
		opcodes[0x19] = {
			// rr (ix+d) -> main.c
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.c = Alu.rr(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.c)
		}
		opcodes[0x1A] = {
			// rr (ix+d) -> main.d
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.d = Alu.rr(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.d)
		}
		opcodes[0x1B] = {
			// rr (ix+d) -> main.e
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.e = Alu.rr(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.e)
		}
		opcodes[0x1C] = {
			// rr (ix+d) -> main.h
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.h = Alu.rr(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.h)
		}
		opcodes[0x1D] = {
			// rr (ix+d) -> main.l
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.l = Alu.rr(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.l)
		}
		opcodes[0x1E] = {
			// rr (ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			let data = Alu.rr(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: data)
		}
		opcodes[0x1F] = {
			// rr (ix+d) -> main.a
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.a = Alu.rr(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.a)
		}
		opcodes[0x20] = {
			// sla (ix+d) -> main.b
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.b = Alu.sla(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.b)
		}
		opcodes[0x21] = {
			// sla (ix+d) -> main.c
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.c = Alu.sla(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.c)
		}
		opcodes[0x22] = {
			// sla (ix+d) -> main.d
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.d = Alu.sla(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.d)
		}
		opcodes[0x23] = {
			// sla (ix+d) -> main.e
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.e = Alu.sla(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.e)
		}
		opcodes[0x24] = {
			// sla (ix+d) -> main.h
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.h = Alu.sla(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.h)
		}
		opcodes[0x25] = {
			// sla (ix+d) -> main.l
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.l = Alu.sla(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.l)
		}
		opcodes[0x26] = {
			// sla (ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			let data = Alu.sla(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: data)
		}
		opcodes[0x27] = {
			// sla (ix+d) -> main.a
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.a = Alu.sla(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.a)
		}
		opcodes[0x28] = {
			// sra (ix+d) -> main.b
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.b = Alu.sra(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.b)
		}
		opcodes[0x29] = {
			// sra (ix+d) -> main.c
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.c = Alu.sra(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.c)
		}
		opcodes[0x2A] = {
			// sra (ix+d) -> main.d
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.d = Alu.sra(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.d)
		}
		opcodes[0x2B] = {
			// sra (ix+d) -> main.e
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.e = Alu.sra(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.e)
		}
		opcodes[0x2C] = {
			// sra (ix+d) -> main.h
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.h = Alu.sra(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.h)
		}
		opcodes[0x2D] = {
			// sra (ix+d) -> main.l
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.l = Alu.sra(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.l)
		}
		opcodes[0x2E] = {
			// sra (ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			let data = Alu.sra(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: data)
		}
		opcodes[0x2F] = {
			// sra (ix+d) -> main.a
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.a = Alu.sra(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.a)
		}
		opcodes[0x30] = {
			// sll (ix+d) -> main.b
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.b = Alu.sll(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.b)
		}
		opcodes[0x31] = {
			// sll (ix+d) -> main.c
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.c = Alu.sll(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.c)
		}
		opcodes[0x32] = {
			// sll (ix+d) -> main.d
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.d = Alu.sll(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.d)
		}
		opcodes[0x33] = {
			// sll (ix+d) -> main.e
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.e = Alu.sll(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.e)
		}
		opcodes[0x34] = {
			// sll (ix+d) -> main.h
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.h = Alu.sll(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.h)
		}
		opcodes[0x35] = {
			// sll (ix+d) -> main.l
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.l = Alu.sll(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.l)
		}
		opcodes[0x36] = {
			// sll (ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			let data = Alu.sll(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: data)
		}
		opcodes[0x37] = {
			// sll (ix+d) -> main.a
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.a = Alu.sll(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.a)
		}
		opcodes[0x38] = {
			// srl (ix+d) -> main.b
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.b = Alu.srl(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.b)
		}
		opcodes[0x39] = {
			// srl (ix+d) -> main.c
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.c = Alu.srl(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.c)
		}
		opcodes[0x3A] = {
			// srl (ix+d) -> main.d
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.d = Alu.srl(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.d)
		}
		opcodes[0x3B] = {
			// srl (ix+d) -> main.e
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.e = Alu.srl(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.e)
		}
		opcodes[0x3C] = {
			// srl (ix+d) -> main.h
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.h = Alu.srl(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.h)
		}
		opcodes[0x3D] = {
			// srl (ix+d) -> main.l
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.l = Alu.srl(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.l)
		}
		opcodes[0x3E] = {
			// srl (ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			let data = Alu.srl(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: data)
		}
		opcodes[0x3F] = {
			// srl (ix+d) -> main.a
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.a = Alu.srl(self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.a)
		}
		opcodes[0x40] = {
			// bit 0,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(0, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x41] = {
			// bit 0,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(0, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x42] = {
			// bit 0,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(0, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x43] = {
			// bit 0,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(0, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x44] = {
			// bit 0,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(0, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x45] = {
			// bit 0,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(0, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x46] = {
			// bit 0,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(0, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x47] = {
			// bit 0,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(0, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x48] = {
			// bit 1,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(1, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x49] = {
			// bit 1,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(1, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x4A] = {
			// bit 1,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(1, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x4B] = {
			// bit 1,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(1, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x4C] = {
			// bit 1,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(1, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x4D] = {
			// bit 1,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(1, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x4E] = {
			// bit 1,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(1, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x4F] = {
			// bit 1,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(1, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x50] = {
			// bit 2,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(2, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x51] = {
			// bit 2,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(2, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x52] = {
			// bit 2,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(2, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x53] = {
			// bit 2,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(2, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x54] = {
			// bit 2,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(2, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x55] = {
			// bit 2,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(2, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x56] = {
			// bit 2,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(2, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x57] = {
			// bit 2,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(2, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x58] = {
			// bit 3,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(3, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x59] = {
			// bit 3,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(3, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x5A] = {
			// bit 3,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(3, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x5B] = {
			// bit 3,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(3, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x5C] = {
			// bit 3,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(3, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x5D] = {
			// bit 3,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(3, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x5E] = {
			// bit 3,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(3, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x5F] = {
			// bit 3,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(3, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x60] = {
			// bit 4,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(4, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x61] = {
			// bit 4,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(4, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x62] = {
			// bit 4,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(4, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x63] = {
			// bit 4,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(4, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x64] = {
			// bit 4,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(4, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x65] = {
			// bit 4,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(4, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x66] = {
			// bit 4,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(4, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x67] = {
			// bit 4,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(4, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x68] = {
			// bit 5,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(5, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x69] = {
			// bit 5,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(5, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x6A] = {
			// bit 5,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(5, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x6B] = {
			// bit 5,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(5, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x6C] = {
			// bit 5,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(5, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x6D] = {
			// bit 5,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(5, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x6E] = {
			// bit 5,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(5, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x6F] = {
			// bit 5,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(5, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x70] = {
			// bit 6,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(6, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x71] = {
			// bit 6,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(6, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x72] = {
			// bit 6,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(6, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x73] = {
			// bit 6,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(6, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x74] = {
			// bit 6,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(6, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x75] = {
			// bit 6,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(6, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x76] = {
			// bit 6,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(6, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x77] = {
			// bit 6,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(6, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x78] = {
			// bit 7,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(7, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x79] = {
			// bit 7,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(7, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x7A] = {
			// bit 7,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(7, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x7B] = {
			// bit 7,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(7, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x7C] = {
			// bit 7,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(7, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x7D] = {
			// bit 7,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(7, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x7E] = {
			// bit 7,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(7, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x7F] = {
			// bit 7,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			Alu.bit(7, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.regs.main.f = self.regs.main.f & ~FLAG_3 | address.high & FLAG_3
			self.regs.main.f = self.regs.main.f & ~FLAG_5 | address.high & FLAG_5
		}
		opcodes[0x80] = {
			// res 0,(ix+d) -> main.b
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.b = Alu.res(0, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.b)
		}
		opcodes[0x81] = {
			// res 0,(ix+d) -> main.c
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.c = Alu.res(0, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.c)
		}
		opcodes[0x82] = {
			// res 0,(ix+d) -> main.d
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.d = Alu.res(0, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.d)
		}
		opcodes[0x83] = {
			// res 0,(ix+d) -> main.e
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.e = Alu.res(0, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.e)
		}
		opcodes[0x84] = {
			// res 0,(ix+d) -> main.h
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.h = Alu.res(0, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.h)
		}
		opcodes[0x85] = {
			// res 0,(ix+d) -> main.l
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.l = Alu.res(0, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.l)
		}
		opcodes[0x86] = {
			// res 0,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			let data = Alu.res(0, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: data)
		}
		opcodes[0x87] = {
			// res 0,(ix+d) -> main.a
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.a = Alu.res(0, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.a)
		}
		opcodes[0x88] = {
			// res 1,(ix+d) -> main.b
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.b = Alu.res(1, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.b)
		}
		opcodes[0x89] = {
			// res 1,(ix+d) -> main.c
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.c = Alu.res(1, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.c)
		}
		opcodes[0x8A] = {
			// res 1,(ix+d) -> main.d
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.d = Alu.res(1, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.d)
		}
		opcodes[0x8B] = {
			// res 1,(ix+d) -> main.e
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.e = Alu.res(1, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.e)
		}
		opcodes[0x8C] = {
			// res 1,(ix+d) -> main.h
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.h = Alu.res(1, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.h)
		}
		opcodes[0x8D] = {
			// res 1,(ix+d) -> main.l
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.l = Alu.res(1, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.l)
		}
		opcodes[0x8E] = {
			// res 1,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			let data = Alu.res(1, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: data)
		}
		opcodes[0x8F] = {
			// res 1,(ix+d) -> main.a
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.a = Alu.res(1, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.a)
		}
		opcodes[0x90] = {
			// res 2,(ix+d) -> main.b
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.b = Alu.res(2, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.b)
		}
		opcodes[0x91] = {
			// res 2,(ix+d) -> main.c
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.c = Alu.res(2, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.c)
		}
		opcodes[0x92] = {
			// res 2,(ix+d) -> main.d
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.d = Alu.res(2, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.d)
		}
		opcodes[0x93] = {
			// res 2,(ix+d) -> main.e
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.e = Alu.res(2, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.e)
		}
		opcodes[0x94] = {
			// res 2,(ix+d) -> main.h
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.h = Alu.res(2, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.h)
		}
		opcodes[0x95] = {
			// res 2,(ix+d) -> main.l
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.l = Alu.res(2, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.l)
		}
		opcodes[0x96] = {
			// res 2,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			let data = Alu.res(2, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: data)
		}
		opcodes[0x97] = {
			// res 2,(ix+d) -> main.a
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.a = Alu.res(2, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.a)
		}
		opcodes[0x98] = {
			// res 3,(ix+d) -> main.b
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.b = Alu.res(3, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.b)
		}
		opcodes[0x99] = {
			// res 3,(ix+d) -> main.c
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.c = Alu.res(3, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.c)
		}
		opcodes[0x9A] = {
			// res 3,(ix+d) -> main.d
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.d = Alu.res(3, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.d)
		}
		opcodes[0x9B] = {
			// res 3,(ix+d) -> main.e
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.e = Alu.res(3, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.e)
		}
		opcodes[0x9C] = {
			// res 3,(ix+d) -> main.h
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.h = Alu.res(3, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.h)
		}
		opcodes[0x9D] = {
			// res 3,(ix+d) -> main.l
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.l = Alu.res(3, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.l)
		}
		opcodes[0x9E] = {
			// res 3,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			let data = Alu.res(3, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: data)
		}
		opcodes[0x9F] = {
			// res 3,(ix+d) -> main.a
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.a = Alu.res(3, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.a)
		}
		opcodes[0xA0] = {
			// res 4,(ix+d) -> main.b
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.b = Alu.res(4, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.b)
		}
		opcodes[0xA1] = {
			// res 4,(ix+d) -> main.c
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.c = Alu.res(4, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.c)
		}
		opcodes[0xA2] = {
			// res 4,(ix+d) -> main.d
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.d = Alu.res(4, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.d)
		}
		opcodes[0xA3] = {
			// res 4,(ix+d) -> main.e
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.e = Alu.res(4, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.e)
		}
		opcodes[0xA4] = {
			// res 4,(ix+d) -> main.h
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.h = Alu.res(4, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.h)
		}
		opcodes[0xA5] = {
			// res 4,(ix+d) -> main.l
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.l = Alu.res(4, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.l)
		}
		opcodes[0xA6] = {
			// res 4,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			let data = Alu.res(4, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: data)
		}
		opcodes[0xA7] = {
			// res 4,(ix+d) -> main.a
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.a = Alu.res(4, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.a)
		}
		opcodes[0xA8] = {
			// res 5,(ix+d) -> main.b
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.b = Alu.res(5, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.b)
		}
		opcodes[0xA9] = {
			// res 5,(ix+d) -> main.c
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.c = Alu.res(5, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.c)
		}
		opcodes[0xAA] = {
			// res 5,(ix+d) -> main.d
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.d = Alu.res(5, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.d)
		}
		opcodes[0xAB] = {
			// res 5,(ix+d) -> main.e
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.e = Alu.res(5, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.e)
		}
		opcodes[0xAC] = {
			// res 5,(ix+d) -> main.h
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.h = Alu.res(5, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.h)
		}
		opcodes[0xAD] = {
			// res 5,(ix+d) -> main.l
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.l = Alu.res(5, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.l)
		}
		opcodes[0xAE] = {
			// res 5,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			let data = Alu.res(5, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: data)
		}
		opcodes[0xAF] = {
			// res 5,(ix+d) -> main.a
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.a = Alu.res(5, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.a)
		}
		opcodes[0xB0] = {
			// res 6,(ix+d) -> main.b
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.b = Alu.res(6, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.b)
		}
		opcodes[0xB1] = {
			// res 6,(ix+d) -> main.c
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.c = Alu.res(6, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.c)
		}
		opcodes[0xB2] = {
			// res 6,(ix+d) -> main.d
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.d = Alu.res(6, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.d)
		}
		opcodes[0xB3] = {
			// res 6,(ix+d) -> main.e
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.e = Alu.res(6, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.e)
		}
		opcodes[0xB4] = {
			// res 6,(ix+d) -> main.h
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.h = Alu.res(6, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.h)
		}
		opcodes[0xB5] = {
			// res 6,(ix+d) -> main.l
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.l = Alu.res(6, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.l)
		}
		opcodes[0xB6] = {
			// res 6,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			let data = Alu.res(6, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: data)
		}
		opcodes[0xB7] = {
			// res 6,(ix+d) -> main.a
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.a = Alu.res(6, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.a)
		}
		opcodes[0xB8] = {
			// res 7,(ix+d) -> main.b
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.b = Alu.res(7, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.b)
		}
		opcodes[0xB9] = {
			// res 7,(ix+d) -> main.c
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.c = Alu.res(7, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.c)
		}
		opcodes[0xBA] = {
			// res 7,(ix+d) -> main.d
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.d = Alu.res(7, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.d)
		}
		opcodes[0xBB] = {
			// res 7,(ix+d) -> main.e
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.e = Alu.res(7, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.e)
		}
		opcodes[0xBC] = {
			// res 7,(ix+d) -> main.h
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.h = Alu.res(7, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.h)
		}
		opcodes[0xBD] = {
			// res 7,(ix+d) -> main.l
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.l = Alu.res(7, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.l)
		}
		opcodes[0xBE] = {
			// res 7,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			let data = Alu.res(7, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: data)
		}
		opcodes[0xBF] = {
			// res 7,(ix+d) -> main.a
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.a = Alu.res(7, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.a)
		}
		opcodes[0xC0] = {
			// set 0,(ix+d) -> main.b
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.b = Alu.set(0, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.b)
		}
		opcodes[0xC1] = {
			// set 0,(ix+d) -> main.c
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.c = Alu.set(0, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.c)
		}
		opcodes[0xC2] = {
			// set 0,(ix+d) -> main.d
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.d = Alu.set(0, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.d)
		}
		opcodes[0xC3] = {
			// set 0,(ix+d) -> main.e
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.e = Alu.set(0, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.e)
		}
		opcodes[0xC4] = {
			// set 0,(ix+d) -> main.h
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.h = Alu.set(0, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.h)
		}
		opcodes[0xC5] = {
			// set 0,(ix+d) -> main.l
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.l = Alu.set(0, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.l)
		}
		opcodes[0xC6] = {
			// set 0,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			let data = Alu.set(0, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: data)
		}
		opcodes[0xC7] = {
			// set 0,(ix+d) -> main.a
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.a = Alu.set(0, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.a)
		}
		opcodes[0xC8] = {
			// set 1,(ix+d) -> main.b
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.b = Alu.set(1, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.b)
		}
		opcodes[0xC9] = {
			// set 1,(ix+d) -> main.c
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.c = Alu.set(1, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.c)
		}
		opcodes[0xCA] = {
			// set 1,(ix+d) -> main.d
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.d = Alu.set(1, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.d)
		}
		opcodes[0xCB] = {
			// set 1,(ix+d) -> main.e
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.e = Alu.set(1, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.e)
		}
		opcodes[0xCC] = {
			// set 1,(ix+d) -> main.h
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.h = Alu.set(1, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.h)
		}
		opcodes[0xCD] = {
			// set 1,(ix+d) -> main.l
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.l = Alu.set(1, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.l)
		}
		opcodes[0xCE] = {
			// set 1,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			let data = Alu.set(1, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: data)
		}
		opcodes[0xCF] = {
			// set 1,(ix+d) -> main.a
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.a = Alu.set(1, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.a)
		}
		opcodes[0xD0] = {
			// set 2,(ix+d) -> main.b
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.b = Alu.set(2, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.b)
		}
		opcodes[0xD1] = {
			// set 2,(ix+d) -> main.c
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.c = Alu.set(2, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.c)
		}
		opcodes[0xD2] = {
			// set 2,(ix+d) -> main.d
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.d = Alu.set(2, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.d)
		}
		opcodes[0xD3] = {
			// set 2,(ix+d) -> main.e
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.e = Alu.set(2, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.e)
		}
		opcodes[0xD4] = {
			// set 2,(ix+d) -> main.h
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.h = Alu.set(2, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.h)
		}
		opcodes[0xD5] = {
			// set 2,(ix+d) -> main.l
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.l = Alu.set(2, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.l)
		}
		opcodes[0xD6] = {
			// set 2,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			let data = Alu.set(2, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: data)
		}
		opcodes[0xD7] = {
			// set 2,(ix+d) -> main.a
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.a = Alu.set(2, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.a)
		}
		opcodes[0xD8] = {
			// set 3,(ix+d) -> main.b
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.b = Alu.set(3, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.b)
		}
		opcodes[0xD9] = {
			// set 3,(ix+d) -> main.c
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.c = Alu.set(3, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.c)
		}
		opcodes[0xDA] = {
			// set 3,(ix+d) -> main.d
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.d = Alu.set(3, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.d)
		}
		opcodes[0xDB] = {
			// set 3,(ix+d) -> main.e
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.e = Alu.set(3, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.e)
		}
		opcodes[0xDC] = {
			// set 3,(ix+d) -> main.h
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.h = Alu.set(3, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.h)
		}
		opcodes[0xDD] = {
			// set 3,(ix+d) -> main.l
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.l = Alu.set(3, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.l)
		}
		opcodes[0xDE] = {
			// set 3,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			let data = Alu.set(3, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: data)
		}
		opcodes[0xDF] = {
			// set 3,(ix+d) -> main.a
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.a = Alu.set(3, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.a)
		}
		opcodes[0xE0] = {
			// set 4,(ix+d) -> main.b
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.b = Alu.set(4, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.b)
		}
		opcodes[0xE1] = {
			// set 4,(ix+d) -> main.c
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.c = Alu.set(4, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.c)
		}
		opcodes[0xE2] = {
			// set 4,(ix+d) -> main.d
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.d = Alu.set(4, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.d)
		}
		opcodes[0xE3] = {
			// set 4,(ix+d) -> main.e
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.e = Alu.set(4, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.e)
		}
		opcodes[0xE4] = {
			// set 4,(ix+d) -> main.h
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.h = Alu.set(4, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.h)
		}
		opcodes[0xE5] = {
			// set 4,(ix+d) -> main.l
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.l = Alu.set(4, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.l)
		}
		opcodes[0xE6] = {
			// set 4,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			let data = Alu.set(4, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: data)
		}
		opcodes[0xE7] = {
			// set 4,(ix+d) -> main.a
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.a = Alu.set(4, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.a)
		}
		opcodes[0xE8] = {
			// set 5,(ix+d) -> main.b
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.b = Alu.set(5, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.b)
		}
		opcodes[0xE9] = {
			// set 5,(ix+d) -> main.c
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.c = Alu.set(5, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.c)
		}
		opcodes[0xEA] = {
			// set 5,(ix+d) -> main.d
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.d = Alu.set(5, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.d)
		}
		opcodes[0xEB] = {
			// set 5,(ix+d) -> main.e
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.e = Alu.set(5, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.e)
		}
		opcodes[0xEC] = {
			// set 5,(ix+d) -> main.h
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.h = Alu.set(5, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.h)
		}
		opcodes[0xED] = {
			// set 5,(ix+d) -> main.l
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.l = Alu.set(5, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.l)
		}
		opcodes[0xEE] = {
			// set 5,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			let data = Alu.set(5, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: data)
		}
		opcodes[0xEF] = {
			// set 5,(ix+d) -> main.a
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.a = Alu.set(5, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.a)
		}
		opcodes[0xF0] = {
			// set 6,(ix+d) -> main.b
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.b = Alu.set(6, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.b)
		}
		opcodes[0xF1] = {
			// set 6,(ix+d) -> main.c
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.c = Alu.set(6, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.c)
		}
		opcodes[0xF2] = {
			// set 6,(ix+d) -> main.d
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.d = Alu.set(6, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.d)
		}
		opcodes[0xF3] = {
			// set 6,(ix+d) -> main.e
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.e = Alu.set(6, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.e)
		}
		opcodes[0xF4] = {
			// set 6,(ix+d) -> main.h
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.h = Alu.set(6, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.h)
		}
		opcodes[0xF5] = {
			// set 6,(ix+d) -> main.l
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.l = Alu.set(6, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.l)
		}
		opcodes[0xF6] = {
			// set 6,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			let data = Alu.set(6, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: data)
		}
		opcodes[0xF7] = {
			// set 6,(ix+d) -> main.a
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.a = Alu.set(6, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.a)
		}
		opcodes[0xF8] = {
			// set 7,(ix+d) -> main.b
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.b = Alu.set(7, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.b)
		}
		opcodes[0xF9] = {
			// set 7,(ix+d) -> main.c
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.c = Alu.set(7, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.c)
		}
		opcodes[0xFA] = {
			// set 7,(ix+d) -> main.d
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.d = Alu.set(7, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.d)
		}
		opcodes[0xFB] = {
			// set 7,(ix+d) -> main.e
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.e = Alu.set(7, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.e)
		}
		opcodes[0xFC] = {
			// set 7,(ix+d) -> main.h
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.h = Alu.set(7, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.h)
		}
		opcodes[0xFD] = {
			// set 7,(ix+d) -> main.l
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.l = Alu.set(7, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.l)
		}
		opcodes[0xFE] = {
			// set 7,(ix+d)
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			let data = Alu.set(7, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: data)
		}
		opcodes[0xFF] = {
			// set 7,(ix+d) -> main.a
			self.clock.sub(cycles: 1)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc &- 2)
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 2)
			self.regs.main.a = Alu.set(7, self.bus.read(address), flags: &self.regs.main.f)
			self.clock.add(cycles: 1)
			self.bus.write(address, value: self.regs.main.a)
		}
	}
}
