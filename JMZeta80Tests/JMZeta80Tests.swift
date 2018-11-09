//
//  JMZeta80Tests.swift
//  JMZeta80Tests
//
//  Created by Jose Luis Fernandez-Mayoralas on 2/10/18.
//  Copyright © 2018 Jose Luis Fernandez-Mayoralas. All rights reserved.
//

import XCTest
@testable import JMZeta80

class JMZeta80Tests: XCTestCase {
    let clock = Clock()
    var bus: TestBus!
    
    var cpu: Cpu!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        bus = TestBus(clock: clock)
        cpu = Cpu(bus: bus, clock: clock)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRegister() {
        var reg = Register()
        
        reg.value = 0x1234
        XCTAssert(reg.high == 0x12)
        XCTAssert(reg.low == 0x34)
        reg.high = 0x56
        reg.low = 0x78
        XCTAssert(reg.value == 0x5678, String.init(format: "value: 0x%X", reg.value))
    }
    
    func testOpcode() {
        var opcode: Opcode
        
        opcode = 0x22
        XCTAssert(opcode.x == 0, String.init(format: "value: %d", opcode.x))
        XCTAssert(opcode.y == 4, String.init(format: "value: %d", opcode.y))
        XCTAssert(opcode.z == 2, String.init(format: "value: %d", opcode.z))
        XCTAssert(opcode.p == 2, String.init(format: "value: %d", opcode.p))
        XCTAssert(opcode.q == 0, String.init(format: "value: %d", opcode.q))
        
        opcode = 0xA2
        XCTAssert(opcode.x == 2, String.init(format: "value: %d", opcode.x))
        XCTAssert(opcode.y == 4, String.init(format: "value: %d", opcode.y))
        XCTAssert(opcode.z == 2, String.init(format: "value: %d", opcode.z))
        XCTAssert(opcode.p == 2, String.init(format: "value: %d", opcode.p))
        XCTAssert(opcode.q == 0, String.init(format: "value: %d", opcode.q))
    }
    
    func testCpuRegs() {
        cpu.reset()
     
        // test cpu registers accessors for each z80 register
        cpu.regs.main.a = 0x12
        cpu.regs.main.f = 0x34
        XCTAssert(cpu.regs.main.af == 0x1234)
        cpu.regs.main.af = 0x5678
        XCTAssert(cpu.regs.main.a == 0x56)
        XCTAssert(cpu.regs.main.f == 0x78)

        cpu.regs.main.b = 0x12
        cpu.regs.main.c = 0x34
        XCTAssert(cpu.regs.main.bc == 0x1234)
        cpu.regs.main.bc = 0x5678
        XCTAssert(cpu.regs.main.b == 0x56)
        XCTAssert(cpu.regs.main.c == 0x78)

        cpu.regs.main.d = 0x12
        cpu.regs.main.e = 0x34
        XCTAssert(cpu.regs.main.de == 0x1234)
        cpu.regs.main.de = 0x5678
        XCTAssert(cpu.regs.main.d == 0x56)
        XCTAssert(cpu.regs.main.e == 0x78)

        cpu.regs.main.h = 0x12
        cpu.regs.main.l = 0x34
        XCTAssert(cpu.regs.main.hl == 0x1234)
        cpu.regs.main.hl = 0x5678
        XCTAssert(cpu.regs.main.h == 0x56)
        XCTAssert(cpu.regs.main.l == 0x78)
    }
    
    func testExtensions() {
        let a: UInt8 = 0xFF
        
        XCTAssert(a.comp2 == a.oldComp2, String.init(format: "new = %d - old = %d", a.comp2, a.oldComp2))
        
        let b: UInt16 = 0x1122
        XCTAssert(b.high == 0x11)
        XCTAssert(b.low == 0x22)
        
        var c: UInt8 = 0b00000001
        XCTAssert(c.parity != 0)
        c = 0b00000011
        XCTAssert(c.parity == 0)
    }

    func testBus() {
        cpu.reset()
        
        // test bus operation and cpu accessibility
        bus.write(0x0000, value: 0x11)
        XCTAssert(cpu.bus.read(0x0000) == 0x11)
        XCTAssert(cpu.bus.ioRead(0xFE) == 0xFF)
        
        bus.ioPoke(0x77FE, value: 0x77)
        XCTAssert(bus.ioPeek(0x00FE) == 0x77)
    }
    
    func testCpu() {
        cpu.reset()
        
        // test cpu reset on instance creation
        XCTAssert(cpu.regs.sp == 0xFFFF)
        XCTAssert(cpu.regs.pc == 0)
        XCTAssert(cpu.clock.getCycles() == 0)
        
        // test memory operation delays
        _ = cpu.bus.read(0x0000)
        XCTAssert(cpu.clock.getCycles() == 3)
        cpu.bus.write(0x0000, value: 0x11)
        XCTAssert(cpu.clock.getCycles() == 6)
        XCTAssert(cpu.buildAddress(0x12, 0x34) == 0x1234)
    }
    
    // MARK: Opcode Tests
    func test_nop() {
        cpu.reset()
        
        bus.write(0x00, data: [0x00])
        cpu.executeNextOpcode()
        
        XCTAssert(clock.getCycles() == 4)
        XCTAssert(cpu.regs.pc == 0x0001)
    }
    
    func test_ex_af_af() {
        cpu.reset()
        
        bus.write(0x00, data: [0x08])
        cpu.regs.main.af = 0xAABB
        cpu.regs.alternate.af = 0xBBCC
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.af == 0xBBCC)
        XCTAssert(cpu.regs.alternate.af == 0xAABB)
        
        XCTAssert(clock.getCycles() == 4)
    }
    
    func test_djnz_n() {
        cpu.reset()
        
        bus.write(0x0000, data: [0x00, 0x10, 0xFE])
        cpu.regs.main.b = 0x02
        cpu.executeNextOpcode()
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.b == 0x01)
        XCTAssert(cpu.regs.pc == 0x0001, String.init(format: "pc = %04X", cpu.regs.pc))
        XCTAssert(clock.getCycles() == 4 + 5 + 3 + 5)
        
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.b == 0x00)
        XCTAssert(cpu.regs.pc == 0x0003)
        XCTAssert(clock.getCycles() == 17 + 5 + 3)

    }
    
    func test_jr_e() {
        cpu.reset()
        
        bus.write(480, data: [0x18, 0x05])
        cpu.regs.pc = 480
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 487)
        XCTAssert(clock.getCycles() == 4 + 3 + 5)
        
        bus.write(0, data: [0x18, 0xFD])
        cpu.regs.pc = 0
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0xFFFF)
        XCTAssert(clock.getCycles() == 12 + 4 + 3 + 5)

    }

    func test_jr_cc_e() {
        cpu.reset()
        
        bus.write(480, data: [0x20, 0x05, 0x20, 0x05])
        cpu.regs.pc = 480
        cpu.regs.main.f.set(bit: FLAG_Z)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 482)
        XCTAssert(clock.getCycles() == 4 + 3)
        
        cpu.regs.main.f.reset(bit: FLAG_Z)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 489)
        XCTAssert(clock.getCycles() == 7 + 4 + 3 + 5)
        
        cpu.reset()
        
        bus.write(480, data: [0x28, 0x05, 0x28, 0x05])
        cpu.regs.pc = 480
        cpu.regs.main.f.reset(bit: FLAG_Z)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 482)
        XCTAssert(clock.getCycles() == 4 + 3)
        
        cpu.regs.main.f.set(bit: FLAG_Z)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 489)
        XCTAssert(clock.getCycles() == 7 + 4 + 3 + 5)
        
        cpu.reset()
        
        bus.write(480, data: [0x30, 0x05, 0x30, 0x05])
        cpu.regs.pc = 480
        cpu.regs.main.f.set(bit: FLAG_C)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 482)
        XCTAssert(clock.getCycles() == 4 + 3)
        
        cpu.regs.main.f.reset(bit: FLAG_C)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 489)
        XCTAssert(clock.getCycles() == 7 + 4 + 3 + 5)
        
        cpu.reset()
        
        bus.write(480, data: [0x38, 0x05, 0x38, 0x05])
        cpu.regs.pc = 480
        cpu.regs.main.f.reset(bit: FLAG_C)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 482)
        XCTAssert(clock.getCycles() == 4 + 3)
        
        cpu.regs.main.f.set(bit: FLAG_C)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 489)
        XCTAssert(clock.getCycles() == 7 + 4 + 3 + 5)

    }

    func test_ld_dd_nn() {
        cpu.reset()
        
        bus.write(0x00, data: [0x01, 0x34, 0x12])
        cpu.executeNextOpcode()
        
        XCTAssert(cpu.regs.main.bc == 0x1234, String.init(format: "bc: 0x%X", cpu.regs.main.bc))
        XCTAssert(clock.getCycles() == 4 + 3 + 3, String.init(format: "value: %d", clock.getCycles()))
        XCTAssert(cpu.regs.pc == 0x0003)
        
        /*
         bus.write(0x04, value: 0xDB)
         bus.write(0x05, value: 0xFE)
         cpu.regs.main.a = 0x00
         cpu.executeNextOpcode()
         XCTAssert(cpu.regs.main.a == 0xFF)
         XCTAssert(clock.getCycles() == 14 + 11)
         XCTAssert(cpu.regs.pc == 0x06)
         */
    }

    func test_add_hl_ss() {
        cpu.reset()
        
        bus.write(0x0000, data: [0x09, 0x09, 0x09, 0x09, 0x09, 0x19])
        
        cpu.regs.main.hl = 0x4242
        cpu.regs.main.bc = 0x1111
        cpu.regs.main.f = 0xFF
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.hl == 0x5353)
        XCTAssert(cpu.regs.main.f & FLAG_C == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(clock.getCycles() == 4 + 4 + 3)
        
        cpu.regs.main.hl = 0xFFFF
        cpu.regs.main.bc = 0x0001
        cpu.regs.main.f = 0xFF
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.hl == 0x0000)
        XCTAssert(cpu.regs.main.f & FLAG_C != 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        
        cpu.regs.main.hl = 0x1EFF
        cpu.regs.main.bc = 0x0002
        cpu.regs.main.f = 0xFF
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.hl == 0x1F01)
        XCTAssert(cpu.regs.main.f & FLAG_C == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        
        cpu.regs.main.hl = 0x1818
        cpu.regs.main.bc = 0x1818
        cpu.regs.main.f = 0xFF
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.hl == 0x3030)
        XCTAssert(cpu.regs.main.f & FLAG_C == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)

        cpu.regs.main.hl = 0x0100
        cpu.regs.main.bc = 0x1000
        cpu.regs.main.f = 0xFF
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.hl == 0x1100)
        XCTAssert(cpu.regs.main.f & FLAG_C == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        
        cpu.regs.main.hl = 0x4001
        cpu.regs.main.bc = 0xFFFF
        cpu.regs.main.f = 0xFF
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.hl == 0x4000)
        XCTAssert(cpu.regs.main.f & FLAG_C != 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)

        XCTAssert(clock.getCycles() == 11 + 11 + 11 + 11 + 11 + 11)
    }
    
    func test_ld_ddi_a() {
        cpu.reset()
        
        bus.write(0x0000, data: [0x02])
        
        cpu.regs.main.bc = 0x8000
        cpu.regs.main.a = 0xAA
        cpu.executeNextOpcode()
        XCTAssert(bus.read(0x8000) == 0xAA)
        XCTAssert(clock.getCycles() == 4 + 3)
    }
    
    func test_ld_nni_hl() {
        cpu.reset()
        
        bus.write(0x0000, data: [0x22, 0x00, 0x80])
        
        cpu.regs.main.hl = 0x1122
        cpu.executeNextOpcode()
        XCTAssert(bus.read(0x8000) == 0x22)
        XCTAssert(bus.read(0x8001) == 0x11)
        XCTAssert(clock.getCycles() == 4 + 3 + 3 + 3 + 3)
    }
    
    func test_ld_nni_a() {
        cpu.reset()
        
        bus.write(0x0000, data: [0x32, 0x00, 0x80])
        
        cpu.regs.main.a = 0xDD
        cpu.executeNextOpcode()
        XCTAssert(bus.read(0x8000) == 0xDD)
        XCTAssert(clock.getCycles() == 4 + 3 + 3 + 3)
    }
    
    func test_ld_a_ddi() {
        cpu.reset()
        
        bus.write(0x0000, data: [0x0A])
        bus.write(0x8000, value: 0xEE)
        cpu.regs.main.bc = 0x8000
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.a == 0xEE)
        XCTAssert(clock.getCycles() == 4 + 3)

    }
    
    func test_ld_hl_nni() {
        cpu.reset()
        
        bus.write(0x0000, data: [0x2A, 0x00, 0x80])
        bus.write(0x8000, data: [0x33, 0x22])
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.hl == 0x2233)
        XCTAssert(clock.getCycles() == 4 + 3 + 3 + 3 + 3)

    }
    
    func test_ld_a_nni() {
        cpu.reset()
        
        bus.write(0x0000, data: [0x3A, 0x00, 0x80])
        bus.write(0x8000, data: [0x44, 0x33])
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.a == 0x44)
        XCTAssert(clock.getCycles() == 4 + 3 + 3 + 3)

    }
    
    func test_inc_ss() {
        cpu.reset()

        bus.write(0x0000, data: [0x03])
        cpu.regs.main.bc = 0x01
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.bc == 0x02)
        XCTAssert(clock.getCycles() == 6)
    }
    
    func test_dec_ss() {
        cpu.reset()
        
        bus.write(0x0000, data: [0x0B])
        cpu.regs.main.bc = 0x1000
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.bc == 0x0FFF)
        XCTAssert(clock.getCycles() == 6)
    }
    
    func test_inc_r() {
        cpu.reset()
        
        bus.write(0x0000, data: [0x0C, 0x0C, 0x0C, 0x0C])
        cpu.regs.main.c = 0x1E
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.c == 0x1F)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.c == 0x20)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        
        cpu.regs.main.c = 0x7F
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.c == 0x80)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S != 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV != 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        
        cpu.regs.main.c = 0xFF
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.c == 0x00)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z != 0)
        
        
        XCTAssert(clock.getCycles() == 4 + 4 + 4 + 4)
    }
    
    func test_dec_r() {
        cpu.reset()
        
        bus.write(0x0000, data: [0x05, 0x05, 0x05, 0x05, 0x05])
        cpu.regs.main.b = 0x21
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.b == 0x20)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.b == 0x1F)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        
        cpu.regs.main.b = 0x80
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.b == 0x7F)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV != 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        
        cpu.regs.main.b = 0x01
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.b == 0x00)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z != 0)

        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.b == 0xFF)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S != 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        
        
        XCTAssert(clock.getCycles() == 4 + 4 + 4 + 4 + 4)
    }
    
    func test_inc_hli() {
        cpu.reset()
        
        bus.write(0x0000, data: [0x34, 0x34, 0x34, 0x34])
        cpu.regs.main.hl = 0x8000

        bus.write(cpu.regs.main.hl, value: 0x1E)
        cpu.executeNextOpcode()
        XCTAssert(bus.read(cpu.regs.main.hl) == 0x1F)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        
        cpu.executeNextOpcode()
        XCTAssert(bus.read(cpu.regs.main.hl) == 0x20)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        
        bus.write(cpu.regs.main.hl, value: 0x7F)
        cpu.executeNextOpcode()
        XCTAssert(bus.read(cpu.regs.main.hl) == 0x80)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S != 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV != 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        
        bus.write(cpu.regs.main.hl, value: 0xFF)
        cpu.executeNextOpcode()
        XCTAssert(bus.read(cpu.regs.main.hl) == 0x00)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z != 0)
        
        XCTAssert(clock.getCycles() == 11 + 11 + 11 + 11)
    }
    
    func test_dec_hli() {
        cpu.reset()
        
        bus.write(0x0000, data: [0x35, 0x35, 0x35, 0x35, 0x35])
        cpu.regs.main.hl = 0x8000
        bus.write(cpu.regs.main.hl, value: 0x21)
        cpu.regs.main.f.set(bit: FLAG_C)
        cpu.executeNextOpcode()
        XCTAssert(bus.read(cpu.regs.main.hl) == 0x20)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        XCTAssertNotEqual(cpu.regs.main.f & FLAG_C, 0)
        
        cpu.executeNextOpcode()
        XCTAssert(bus.read(cpu.regs.main.hl) == 0x1F)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        XCTAssertNotEqual(cpu.regs.main.f & FLAG_C, 0)
        
        bus.write(cpu.regs.main.hl, value: 0x80)
        cpu.executeNextOpcode()
        XCTAssert(bus.read(cpu.regs.main.hl) == 0x7F)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV != 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        XCTAssertNotEqual(cpu.regs.main.f & FLAG_C, 0)
        
        bus.write(cpu.regs.main.hl, value: 0x01)
        cpu.executeNextOpcode()
        XCTAssert(bus.read(cpu.regs.main.hl) == 0x00)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z != 0)
        XCTAssertNotEqual(cpu.regs.main.f & FLAG_C, 0)
        
        cpu.executeNextOpcode()
        XCTAssert(bus.read(cpu.regs.main.hl) == 0xFF)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S != 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        XCTAssertNotEqual(cpu.regs.main.f & FLAG_C, 0)
        
        XCTAssert(clock.getCycles() == 11 + 11 + 11 + 11 + 11)
    }
    func test_ld_r_n() {
        cpu.reset()
        
        bus.write(0x0000, data: [0x3E, 0x22])
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.a == 0x22)
        XCTAssert(cpu.regs.pc == 0x0002)
        
        XCTAssert(clock.getCycles() == 7)
    }
    
    func test_ld_hli_n() {
        cpu.reset()
        
        bus.write(0x0000, data: [0x36, 0x22])
        cpu.regs.main.hl = 0x8000
        cpu.executeNextOpcode()
        XCTAssert(bus.read(cpu.regs.main.hl) == 0x22)
        XCTAssert(cpu.regs.pc == 0x0002)
        
        XCTAssert(clock.getCycles() == 10)
    }
    
    func test_rlca() {
        cpu.reset()
        
        bus.write(0x0000, data: [0x07])
        cpu.regs.main.a = 0b10001000
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.a == 0b00010001)
        XCTAssert(cpu.regs.main.f & FLAG_C != 0)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        
        XCTAssert(clock.getCycles() == 4)
    }
    
    func test_rrca() {
        cpu.reset()
        
        bus.write(0x0000, data: [0x0F])
        cpu.regs.main.a = 0b00010001
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.a == 0b10001000)
        XCTAssert(cpu.regs.main.f & FLAG_C != 0)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        
        XCTAssert(clock.getCycles() == 4)
    }
    
    func test_rla() {
        cpu.reset()
        
        bus.write(0x0000, data: [0x17])
        cpu.regs.main.a = 0b01110110
        cpu.regs.main.f.set(bit: FLAG_C)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.a == 0b11101101)
        XCTAssert(cpu.regs.main.f & FLAG_C == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        
        XCTAssert(clock.getCycles() == 4)
    }
    
    func test_rra() {
        cpu.reset()
        
        bus.write(0x0000, data: [0x1F])
        cpu.regs.main.a = 0b11100001
        cpu.regs.main.f.reset(bit: FLAG_C)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.a == 0b01110000)
        XCTAssert(cpu.regs.main.f & FLAG_C != 0)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        
        XCTAssert(clock.getCycles() == 4)
    }
    
    func test_daa() {
        cpu.reset()
        bus.write(0x0000, data: [0x27, 0x27])
        cpu.regs.main.a = 0x3C
        cpu.regs.main.f.reset(bit: FLAG_C)
        cpu.regs.main.f.reset(bit: FLAG_N)
        cpu.regs.main.f.set(bit: FLAG_H)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.a == 0x42, String.init(format: "a = 0x%02X", cpu.regs.main.a))
        XCTAssert(cpu.regs.main.f & FLAG_C == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        
        cpu.regs.main.a = 0x43
        cpu.regs.main.f.reset(bit: FLAG_C)
        cpu.regs.main.f.reset(bit: FLAG_N)
        cpu.regs.main.f.reset(bit: FLAG_H)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.a == 0x43, String.init(format: "a = 0x%02X", cpu.regs.main.a))
        XCTAssert(cpu.regs.main.f & FLAG_C == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        
        XCTAssert(clock.getCycles() == 4 + 4)

    }
    
    func test_cpl() {
        cpu.reset()
        
        bus.write(0x0000, data: [0x2F])
        cpu.regs.main.a = 0b10110100
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.a == 0b01001011)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_N != 0)
        
        XCTAssert(clock.getCycles() == 4)
    }
    
    func test_scf() {
        cpu.reset()
        
        bus.write(0x0000, data: [0x37])
        cpu.regs.main.f.reset(bit: FLAG_C)
        XCTAssert(cpu.regs.main.f & FLAG_C == 0)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.f & FLAG_C != 0)
        
        XCTAssert(clock.getCycles() == 4)
    }
    
    func test_ccf() {
        cpu.reset()
        
        bus.write(0x0000, data: [0x3F])
        cpu.regs.main.f.set(bit: FLAG_C)
        XCTAssert(cpu.regs.main.f & FLAG_C != 0)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.f & FLAG_C == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        
        XCTAssert(clock.getCycles() == 4)
    }
    
    func test_halt() {
        cpu.reset()
        
        bus.write(0x0000, data: [0x76, 0x01])
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x0000)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x0000)
        
        XCTAssert(clock.getCycles() == 4 + 4)
    }
    
    func test_ld_hli_r() {
        cpu.reset()
        
        bus.write(0x0000, data: [0x73])
        cpu.regs.main.hl = 0x8000
        cpu.regs.main.e = 0x88
        cpu.executeNextOpcode()
        XCTAssert(bus.read(0x8000) == 0x88)
        
        XCTAssert(clock.getCycles() == 4 + 3)
    }
    
    func test_ld_r_hli() {
        cpu.reset()
        
        bus.write(0x0000, data: [0x66])
        bus.write(0x8000, data: [0x55])
        cpu.regs.main.hl = 0x8000
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.h == 0x55)
        
        XCTAssert(clock.getCycles() == 4 + 3)
    }

    func test_ld_r_r() {
        cpu.reset()
        
        bus.write(0x0000, data: [0x6A])
        cpu.regs.main.d = 0x99
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.l == 0x99)
        
        XCTAssert(clock.getCycles() == 4)
    }
    
    func test_add_a_r() {
        cpu.reset()
        
        bus.write(0x0000, data: [0x80, 0x80, 0x80])
        
        cpu.regs.main.a = 0x78
        cpu.regs.main.b = 0x69
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.a == 0xE1)
        XCTAssert(cpu.regs.main.f & FLAG_C == 0)
        XCTAssert(cpu.regs.main.f & FLAG_S != 0)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV != 0)
        
        cpu.regs.main.a = 0x6F
        cpu.regs.main.b = 0x10
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.a == 0x7F)
        XCTAssert(cpu.regs.main.f & FLAG_C == 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        
        cpu.regs.main.a = 0xFE
        cpu.regs.main.b = 0x02
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.a == 0x00)
        XCTAssert(cpu.regs.main.f & FLAG_C != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z != 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        
        XCTAssert(clock.getCycles() == 4 + 4 + 4)
    }
    
    func test_adc_a_r() {
        cpu.reset()
        
        bus.write(0x0000, data: [0x88, 0x88, 0x88])
        
        cpu.regs.main.a = 0x78
        cpu.regs.main.b = 0x69
        cpu.regs.main.f.reset(bit: FLAG_C)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.a == 0xE1)
        XCTAssert(cpu.regs.main.f & FLAG_C == 0)
        XCTAssert(cpu.regs.main.f & FLAG_S != 0)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV != 0)
        
        cpu.regs.main.a = 0x6F
        cpu.regs.main.b = 0xE0
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.a == 0x4F)
        XCTAssert(cpu.regs.main.f & FLAG_C != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        
        cpu.regs.main.a = 0xFE
        cpu.regs.main.b = 0x02
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.a == 0x01)
        XCTAssert(cpu.regs.main.f & FLAG_C != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        
        XCTAssert(clock.getCycles() == 4 + 4 + 4)
    }
    
    func test_ret_cc() {
        cpu.reset()
        
        // ret nz
        bus.write(0x0000, data: [0xC0, 0xC0])
        bus.write(0xFFFD, data: [0x00, 0x80])
        cpu.regs.pc = 0x0000
        cpu.regs.sp = 0xFFFD
        cpu.regs.main.f.set(bit: FLAG_Z)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x0001)
        cpu.regs.main.f.reset(bit: FLAG_Z)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x8000)
        XCTAssert(cpu.regs.sp == 0xFFFF)
        
        XCTAssert(clock.getCycles() == 11 + 5)
        
        // ret z
        bus.write(0x0000, data: [0xC8, 0xC8])
        bus.write(0xFFFD, data: [0x00, 0x80])
        cpu.regs.pc = 0x0000
        cpu.regs.sp = 0xFFFD
        cpu.regs.main.f.reset(bit: FLAG_Z)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x0001)
        cpu.regs.main.f.set(bit: FLAG_Z)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x8000)
        XCTAssert(cpu.regs.sp == 0xFFFF)
        
        // ret nc
        bus.write(0x0000, data: [0xD0, 0xD0])
        bus.write(0xFFFD, data: [0x00, 0x80])
        cpu.regs.pc = 0x0000
        cpu.regs.sp = 0xFFFD
        cpu.regs.main.f.set(bit: FLAG_C)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x0001)
        cpu.regs.main.f.reset(bit: FLAG_C)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x8000)
        XCTAssert(cpu.regs.sp == 0xFFFF)
        
        // ret c
        bus.write(0x0000, data: [0xD8, 0xD8])
        bus.write(0xFFFD, data: [0x00, 0x80])
        cpu.regs.pc = 0x0000
        cpu.regs.sp = 0xFFFD
        cpu.regs.main.f.reset(bit: FLAG_C)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x0001)
        cpu.regs.main.f.set(bit: FLAG_C)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x8000)
        XCTAssert(cpu.regs.sp == 0xFFFF)
        
        // ret po
        bus.write(0x0000, data: [0xE0, 0xE0])
        bus.write(0xFFFD, data: [0x00, 0x80])
        cpu.regs.pc = 0x0000
        cpu.regs.sp = 0xFFFD
        cpu.regs.main.f.set(bit: FLAG_PV)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x0001)
        cpu.regs.main.f.reset(bit: FLAG_PV)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x8000)
        XCTAssert(cpu.regs.sp == 0xFFFF)
        
        // ret pe
        bus.write(0x0000, data: [0xE8, 0xE8])
        bus.write(0xFFFD, data: [0x00, 0x80])
        cpu.regs.pc = 0x0000
        cpu.regs.sp = 0xFFFD
        cpu.regs.main.f.reset(bit: FLAG_PV)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x0001)
        cpu.regs.main.f.set(bit: FLAG_PV)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x8000)
        XCTAssert(cpu.regs.sp == 0xFFFF)
        
        // ret p
        bus.write(0x0000, data: [0xF0, 0xF0])
        bus.write(0xFFFD, data: [0x00, 0x80])
        cpu.regs.pc = 0x0000
        cpu.regs.sp = 0xFFFD
        cpu.regs.main.f.set(bit: FLAG_S)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x0001)
        cpu.regs.main.f.reset(bit: FLAG_S)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x8000)
        XCTAssert(cpu.regs.sp == 0xFFFF)
        
        // ret m
        bus.write(0x0000, data: [0xF8, 0xF8])
        bus.write(0xFFFD, data: [0x00, 0x80])
        cpu.regs.pc = 0x0000
        cpu.regs.sp = 0xFFFD
        cpu.regs.main.f.reset(bit: FLAG_S)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x0001)
        cpu.regs.main.f.set(bit: FLAG_S)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x8000)
        XCTAssert(cpu.regs.sp == 0xFFFF)
        
        // ret
        bus.write(0x0000, data: [0xC9])
        bus.write(0xFFFD, data: [0x00, 0x80])
        cpu.regs.pc = 0x0000
        cpu.regs.sp = 0xFFFD
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x8000)
        XCTAssert(cpu.regs.sp == 0xFFFF)
        
        XCTAssert(clock.getCycles() == 16 * 8 + 10)
    }

    func test_pop_rp() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xC1])
        bus.write(0xFFFE, data: [0x22, 0x11])
        cpu.regs.sp = 0xFFFE
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.bc == 0x1122)
        XCTAssert(cpu.regs.sp == 0x0000)
        
        XCTAssert(clock.getCycles() == 10)
    }
    
    
    func test_exx() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xD9])
        cpu.regs.main.bc = 0x1122
        cpu.regs.main.de = 0x3344
        cpu.regs.main.hl = 0x5566
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.bc == 0xFFFF)
        XCTAssert(cpu.regs.main.de == 0xFFFF)
        XCTAssert(cpu.regs.main.hl == 0xFFFF)
        XCTAssert(cpu.regs.alternate.bc == 0x1122)
        XCTAssert(cpu.regs.alternate.de == 0x3344)
        XCTAssert(cpu.regs.alternate.hl == 0x5566)
        
        XCTAssert(clock.getCycles() == 4)
    }
    
    func test_jp_hl() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xE9])
        cpu.regs.main.hl = 0x8000
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x8000)
        
        XCTAssert(clock.getCycles() == 4)
    }
    
    func test_ld_sp_hl() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xF9])
        cpu.regs.main.hl = 0x8000
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.sp == 0x8000)
        XCTAssert(cpu.regs.pc == 0x0001)
        
        XCTAssert(clock.getCycles() == 6)
    }
    
    func test_jp_cc_nn() {
        cpu.reset()
        
        // jp nz
        bus.write(0x0000, data: [0xC2, 0x00, 0x80, 0xC2, 0x00, 0x80])
        cpu.regs.pc = 0x0000
        cpu.regs.main.f.set(bit: FLAG_Z)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x0003)
        cpu.regs.main.f.reset(bit: FLAG_Z)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x8000)
        
        // jp z
        bus.write(0x0000, data: [0xCA, 0x00, 0x80, 0xCA, 0x00, 0x80])
        cpu.regs.pc = 0x0000
        cpu.regs.main.f.reset(bit: FLAG_Z)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x0003)
        cpu.regs.main.f.set(bit: FLAG_Z)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x8000)
        
        // jp nc
        bus.write(0x0000, data: [0xD2, 0x00, 0x80, 0xD2, 0x00, 0x80])
        cpu.regs.pc = 0x0000
        cpu.regs.main.f.set(bit: FLAG_C)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x0003)
        cpu.regs.main.f.reset(bit: FLAG_C)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x8000)
        
        // jp c
        bus.write(0x0000, data: [0xDA, 0x00, 0x80, 0xDA, 0x00, 0x80])
        cpu.regs.pc = 0x0000
        cpu.regs.main.f.reset(bit: FLAG_C)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x0003)
        cpu.regs.main.f.set(bit: FLAG_C)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x8000)
        
        // jp po
        bus.write(0x0000, data: [0xE2, 0x00, 0x80, 0xE2, 0x00, 0x80])
        cpu.regs.pc = 0x0000
        cpu.regs.main.f.set(bit: FLAG_PV)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x0003)
        cpu.regs.main.f.reset(bit: FLAG_PV)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x8000)
        
        // jp pe
        bus.write(0x0000, data: [0xEA, 0x00, 0x80, 0xEA, 0x00, 0x80])
        cpu.regs.pc = 0x0000
        cpu.regs.main.f.reset(bit: FLAG_PV)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x0003)
        cpu.regs.main.f.set(bit: FLAG_PV)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x8000)
        
        // jp p
        bus.write(0x0000, data: [0xF2, 0x00, 0x80, 0xF2, 0x00, 0x80])
        cpu.regs.pc = 0x0000
        cpu.regs.main.f.set(bit: FLAG_S)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x0003)
        cpu.regs.main.f.reset(bit: FLAG_S)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x8000)
        
        // jp m
        bus.write(0x0000, data: [0xFA, 0x00, 0x80, 0xFA, 0x00, 0x80])
        cpu.regs.pc = 0x0000
        cpu.regs.main.f.reset(bit: FLAG_S)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x0003)
        cpu.regs.main.f.set(bit: FLAG_S)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x8000)
        
        // jp
        bus.write(0x0000, data: [0xC3, 0x00, 0x80])
        cpu.regs.pc = 0x0000
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x8000)
        
        XCTAssert(clock.getCycles() == 17 * 10)
    }
    
    func test_out_n_a() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xD3, 0xFF])
        cpu.regs.main.a = 0x55
        cpu.executeNextOpcode()
        XCTAssert(bus.ioRead(0xFF) == 0x55)
        
        XCTAssert(clock.getCycles() == 11)
    }
    
    func test_in_a_n() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xDB, 0xFF])
        bus.ioWrite(0x77FF, value: 0x77)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.a == 0x77)
        
        XCTAssert(clock.getCycles() == 11)
    }
    
    func test_ex_hl_sp() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xE3])
        bus.write(0xFFFE, data: [0x44, 0x33])
        cpu.regs.main.hl = 0x1122
        cpu.regs.sp = 0xFFFE
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.hl == 0x3344)
        XCTAssert(bus.read(cpu.regs.sp) == 0x22)
        XCTAssert(bus.read(cpu.regs.sp + 1) == 0x11)
        
        XCTAssert(clock.getCycles() == 19, String.init(format: "ciclos: %d", clock.getCycles()))
    }
    
    func test_ex_de_hl() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xEB, 0xDD, 0xEB])
        cpu.regs.main.de = 0x3344
        cpu.regs.main.hl = 0x5566
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.de == 0x5566)
        XCTAssert(cpu.regs.main.hl == 0x3344)
        
        XCTAssert(clock.getCycles() == 4)
        
        cpu.regs.ix = 0x1111
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.ix == 0x1111)
        XCTAssert(cpu.regs.main.hl == 0x5566)
        XCTAssert(cpu.regs.main.de == 0x3344)
    }
    
    func test_di() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xF3])
        cpu.interrupt_status.IFF1 = true
        cpu.interrupt_status.IFF2 = true
        cpu.executeNextOpcode()
        XCTAssert(cpu.interrupt_status.IFF1 == false)
        XCTAssert(cpu.interrupt_status.IFF2 == false)
        XCTAssert(cpu.interrupt_status.pending_execution == false)
        
        XCTAssert(clock.getCycles() == 4)
    }
    
    func test_ei() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xFB, 0x00])
        cpu.interrupt_status.IFF1 = false
        cpu.interrupt_status.IFF2 = false
        cpu.executeNextOpcode()
        XCTAssert(cpu.interrupt_status.IFF1 == true)
        XCTAssert(cpu.interrupt_status.IFF2 == true)
        XCTAssert(cpu.interrupt_status.pending_execution == true)
        cpu.executeNextOpcode()
        XCTAssert(cpu.interrupt_status.pending_execution == false)
        
        XCTAssert(clock.getCycles() == 8)
    }
    
    func test_call_cc() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xF4, 0x00, 0x80, 0xF4, 0x00, 0x90])
        bus.write(0x9000, data: [0xC9])
        cpu.regs.sp = 0xFFFF
        cpu.regs.main.f.set(bit: FLAG_S)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x0003)
        cpu.regs.main.f.reset(bit: FLAG_S)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x9000)
        XCTAssert(bus.read(cpu.regs.sp) == 0x06)
        XCTAssert(bus.read(cpu.regs.sp &+ 1) == 0x00)
        XCTAssert(cpu.regs.sp == 0xFFFD)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x0006)
        XCTAssert(cpu.regs.sp == 0xFFFF)
        
        XCTAssert(clock.getCycles() == 37)
    }
    
    func test_call() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xCD, 0x00, 0x90])
        bus.write(0x9000, data: [0xC9])
        cpu.regs.sp = 0xFFFF
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x9000)
        XCTAssert(bus.read(cpu.regs.sp) == 0x03)
        XCTAssert(bus.read(cpu.regs.sp &+ 1) == 0x00)
        XCTAssert(cpu.regs.sp == 0xFFFD)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x0003)
        XCTAssert(cpu.regs.sp == 0xFFFF)
        
        XCTAssert(clock.getCycles() == 27)
    }
    
    func test_push_rp() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xC5, 0xD1])
        cpu.regs.main.bc = 0x1122
        cpu.regs.sp = 0xFFFF
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.sp == 0xFFFD)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.sp == 0xFFFF)
        XCTAssert(cpu.regs.main.de == 0x1122)
        
        XCTAssert(clock.getCycles() == 21)
    }
    
    func test_add_a_n() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xC6, 0x69, 0xC6, 0x10, 0xC6, 0x02])
        
        cpu.regs.main.a = 0x78
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.a == 0xE1)
        XCTAssert(cpu.regs.main.f & FLAG_C == 0)
        XCTAssert(cpu.regs.main.f & FLAG_S != 0)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV != 0)
        
        cpu.regs.main.a = 0x6F
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.a == 0x7F)
        XCTAssert(cpu.regs.main.f & FLAG_C == 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        
        cpu.regs.main.a = 0xFE
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.a == 0x00)
        XCTAssert(cpu.regs.main.f & FLAG_C != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z != 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        
        XCTAssert(clock.getCycles() == 7 + 7 + 7)
    }
    
    func test_rst() {
        cpu.reset()
        
        bus.write(0x4000, data: [0xFF])
        bus.write(0x0038, data: [0xC9])
        cpu.regs.pc = 0x4000
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x0038)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x4001)
        
        XCTAssert(clock.getCycles() == 11 + 10)
    }
    
    func test_rlc() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xCB, 0x00])
        cpu.regs.main.b = 0b10001000
        cpu.regs.main.f.set(bit: FLAG_S)
        cpu.regs.main.f.reset(bit: FLAG_C)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.b == 0b00010001)
        XCTAssert(cpu.regs.main.f & FLAG_C != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV != 0)
        XCTAssert(cpu.regs.pc == 0x0002)
        
        XCTAssert(clock.getCycles() == 8)
    }
    
    func test_rlc_hli() {
        cpu.reset()
        
        cpu.regs.main.hl = 0x8000
        bus.write(0x0000, data: [0xCB, 0x06])
        bus.write(cpu.regs.main.hl, value: 0b10001000)
        cpu.regs.main.f.set(bit: FLAG_S)
        cpu.regs.main.f.reset(bit: FLAG_C)
        cpu.executeNextOpcode()
        XCTAssert(bus.read(cpu.regs.main.hl) == 0b00010001)
        XCTAssert(cpu.regs.main.f & FLAG_C != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV != 0)
        XCTAssert(cpu.regs.pc == 0x0002)
        
        XCTAssert(clock.getCycles() == 15)
    }
    
    func test_rrc() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xCB, 0x08])
        cpu.regs.main.b = 0b00110001
        cpu.regs.main.f.reset(bit: FLAG_S)
        cpu.regs.main.f.reset(bit: FLAG_C)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.b == 0b10011000)
        XCTAssert(cpu.regs.main.f & FLAG_C != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S != 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.pc == 0x0002)
        
        XCTAssert(clock.getCycles() == 8)
    }
    
    func test_rl() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xCB, 0x10])
        cpu.regs.main.b = 0b10001111
        cpu.regs.main.f.set(bit: FLAG_S)
        cpu.regs.main.f.reset(bit: FLAG_C)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.b == 0b00011110)
        XCTAssert(cpu.regs.main.f & FLAG_C != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV != 0)
        XCTAssert(cpu.regs.pc == 0x0002)
        
        XCTAssert(clock.getCycles() == 8)
    }
    
    func test_rr() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xCB, 0x18])
        cpu.regs.main.b = 0b11011101
        cpu.regs.main.f.set(bit: FLAG_S)
        cpu.regs.main.f.reset(bit: FLAG_C)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.b == 0b01101110)
        XCTAssert(cpu.regs.main.f & FLAG_C != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.pc == 0x0002)
        
        XCTAssert(clock.getCycles() == 8)
    }
    
    func test_sla() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xCB, 0x20])
        cpu.regs.main.b = 0b10110001
        cpu.regs.main.f.set(bit: FLAG_S)
        cpu.regs.main.f.reset(bit: FLAG_C)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.b == 0b01100010)
        XCTAssert(cpu.regs.main.f & FLAG_C != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.pc == 0x0002)
        
        XCTAssert(clock.getCycles() == 8)
    }
    
    func test_sra() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xCB, 0x28])
        cpu.regs.main.b = 0b10111000
        cpu.regs.main.f.set(bit: FLAG_S)
        cpu.regs.main.f.set(bit: FLAG_C)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.b == 0b11011100)
        XCTAssert(cpu.regs.main.f & FLAG_C == 0)
        XCTAssert(cpu.regs.main.f & FLAG_S != 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.pc == 0x0002)
        
        XCTAssert(clock.getCycles() == 8)
    }
    
    func test_sll() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xCB, 0x30])
        cpu.regs.main.b = 0b10110001
        cpu.regs.main.f.set(bit: FLAG_S)
        cpu.regs.main.f.reset(bit: FLAG_C)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.b == 0b01100011)
        XCTAssert(cpu.regs.main.f & FLAG_C != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV != 0)
        XCTAssert(cpu.regs.pc == 0x0002)
        
        XCTAssert(clock.getCycles() == 8)
    }
    
    func test_srl() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xCB, 0x38])
        cpu.regs.main.b = 0b10001111
        cpu.regs.main.f.set(bit: FLAG_S)
        cpu.regs.main.f.reset(bit: FLAG_C)
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.b == 0b01000111)
        XCTAssert(cpu.regs.main.f & FLAG_C != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV != 0)
        XCTAssert(cpu.regs.pc == 0x0002)
        
        XCTAssert(clock.getCycles() == 8)
    }
    
    func test_bit() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xCB, 0x40, 0xCB, 0x40, 0xCB, 0x78, 0xCB, 0x78])
        cpu.regs.main.b = 0b00010000
        cpu.regs.main.f = 0
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.f & FLAG_Z != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV != 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.pc == 0x0002)
        
        cpu.regs.main.b = 0b00010001
        cpu.regs.main.f = 0
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        
        cpu.regs.main.b = 0b00010001
        cpu.regs.main.f = 0
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.f & FLAG_Z != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV != 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        
        cpu.regs.main.b = 0b10010001
        cpu.regs.main.f = 0
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        XCTAssert(cpu.regs.main.f & FLAG_S != 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        
        XCTAssert(clock.getCycles() == 4 * 8)
    }
    
    func test_bit_hli() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xCB, 0x46, 0xCB, 0x46, 0xCB, 0x7E, 0xCB, 0x7E])
        cpu.regs.main.hl = 0xA000
        bus.write(cpu.regs.main.hl, data: [0b00010000])
        cpu.regs.main.f = 0
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.f & FLAG_Z != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV != 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_3 == 0)
        XCTAssert(cpu.regs.main.f & FLAG_5 != 0)
        XCTAssert(cpu.regs.pc == 0x0002)
        
        bus.write(cpu.regs.main.hl, data: [0b00010001])
        cpu.regs.main.f = 0
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_3 == 0)
        XCTAssert(cpu.regs.main.f & FLAG_5 != 0)

        bus.write(cpu.regs.main.hl, data: [0b00110001])
        cpu.regs.main.f = 0
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.f & FLAG_Z != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV != 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_3 == 0)
        XCTAssert(cpu.regs.main.f & FLAG_5 != 0)
        
        bus.write(cpu.regs.main.hl, data: [0b10011001])
        cpu.regs.main.f = 0
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        XCTAssert(cpu.regs.main.f & FLAG_S != 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_3 == 0)
        XCTAssert(cpu.regs.main.f & FLAG_5 != 0)
        
        XCTAssert(clock.getCycles() == 4 * 12)
    }
    
    func test_set() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xCB, 0xDD])
        cpu.regs.main.l = 0
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.l == 0x08)
        
        XCTAssert(clock.getCycles() == 8)
    }
    
    func test_reset() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xCB, 0x9D])
        cpu.regs.main.l = 0x08
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.l == 0)
        
        XCTAssert(clock.getCycles() == 8)
    }
    
    func test_in_r_c() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0x40])
        bus.ioWrite(0x00FF, value: 0xA9)
        cpu.regs.main.c = 0xFF
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.b == 0xA9)
        XCTAssert(cpu.regs.main.f & FLAG_S != 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV != 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(cpu.regs.main.f & FLAG_3 != 0)
        XCTAssert(cpu.regs.main.f & FLAG_5 != 0)
        
        XCTAssert(clock.getCycles() == 12)
    }
    
    func test_out_r_c() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0x41])
        cpu.regs.main.bc = 0xB9FF
        cpu.executeNextOpcode()
        XCTAssert(bus.ioRead(0x00FF) == 0xB9)
        
        XCTAssert(clock.getCycles() == 12)
    }
    
    func test_adc_hl_r() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0x4A, 0xDD, 0xED, 0x4A])
        cpu.regs.main.bc = 0x2222
        cpu.regs.main.hl = 0x5437
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.hl == 0x765A)
        XCTAssert(cpu.regs.main.f & FLAG_C == 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(cpu.regs.main.f & FLAG_3 == 0)
        XCTAssert(cpu.regs.main.f & FLAG_5 != 0)
        
        cpu.regs.main.bc = 0xDDDD
        cpu.regs.main.hl = 0x5437
        cpu.regs.main.f |= FLAG_C
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.hl == 0x3215)
        XCTAssert(cpu.regs.main.f & FLAG_C != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_3 == 0)
        XCTAssert(cpu.regs.main.f & FLAG_5 != 0)
        
        XCTAssert(clock.getCycles() == 8 + 2 * 15)
    }
    
    func test_sbc_hl_r() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0x42, 0xED, 0x42, 0xED, 0x52, 0xED, 0x52])
        cpu.regs.main.bc = 0x1111
        cpu.regs.main.hl = 0x9999
        cpu.regs.main.f |= FLAG_C
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.hl == 0x8887)
        XCTAssert(cpu.regs.main.f & FLAG_C == 0)
        XCTAssert(cpu.regs.main.f & FLAG_S != 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N != 0)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(cpu.regs.main.f & FLAG_3 != 0)
        XCTAssert(cpu.regs.main.f & FLAG_5 == 0)
        
        cpu.regs.main.bc = 0xDDDD
        cpu.regs.main.hl = 0x5437
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.hl == 0x765A)
        XCTAssert(cpu.regs.main.f & FLAG_C != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N != 0)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_3 == 0)
        XCTAssert(cpu.regs.main.f & FLAG_5 != 0)
        
        cpu.regs.main.de = 0xFFFF
        cpu.regs.main.hl = 0x4000
        cpu.regs.main.f.reset(bit: FLAG_C)
        cpu.executeNextOpcode()
        XCTAssertEqual(cpu.regs.main.hl, 0x4001)
        XCTAssert(cpu.regs.main.f & FLAG_C != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N != 0)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_3 == 0)
        XCTAssert(cpu.regs.main.f & FLAG_5 == 0)
        
        cpu.regs.main.de = 0x5CCB
        cpu.regs.main.hl = 0x5CCC
        cpu.regs.main.f.set(bit: FLAG_Z)
        cpu.regs.main.f.reset(bit: FLAG_C)
        cpu.executeNextOpcode()
        XCTAssertEqual(cpu.regs.main.hl, 0x0001)
        XCTAssert(cpu.regs.main.f & FLAG_C == 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N != 0)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(cpu.regs.main.f & FLAG_3 == 0)
        XCTAssert(cpu.regs.main.f & FLAG_5 == 0)
        
        XCTAssert(clock.getCycles() == 4 * 15)
    }
    
    func test_ld_nni_rp() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0x43, 0x00, 0x80])
        cpu.regs.main.bc = 0x4644
        cpu.executeNextOpcode()
        XCTAssert(bus.read(0x8000) == 0x44)
        XCTAssert(bus.read(0x8001) == 0x46)
        
        XCTAssert(clock.getCycles() == 20)
    }
    
    func test_ld_rp_nni() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0x4B, 0x00, 0x90])
        bus.write(0x9000, data: [0x65, 0x78])
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.bc == 0x7865)
        
        XCTAssert(clock.getCycles() == 20)
    }
    
    func test_neg() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0x44])
        cpu.regs.main.a = 0b10011000
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.a == 0b01101000)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N != 0)
        XCTAssert(cpu.regs.main.f & FLAG_C != 0)
        XCTAssert(cpu.regs.main.f & FLAG_3 != 0)
        XCTAssert(cpu.regs.main.f & FLAG_5 != 0)
        
        XCTAssert(clock.getCycles() == 8)
    }
    
    func test_retn() {
        cpu.reset()
        
        bus.write(0x0066, data: [0x00, 0xED, 0x45])
        cpu.interrupt_status.IFF1 = true
        cpu.executeNextOpcode()
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x0002)
        cpu.nmi_req = true
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x0066)
        XCTAssert(cpu.interrupt_status.IFF1 == false)
        XCTAssert(cpu.nmi_req == false)
        cpu.executeNextOpcode()
        cpu.executeNextOpcode()
        XCTAssert(cpu.interrupt_status.IFF1 == true)
        XCTAssert(cpu.regs.pc == 0x0002)
        
        XCTAssert(clock.getCycles() == 4 + 4 + 11 + 4 + 14)
    }
    
    func test_reti() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0x56])
        bus.write(0x0038, data: [0x00, 0xED, 0x4D])
        cpu.interrupt_status.IFF1 = true
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x0002)
        cpu.int_req = true
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x0038)
        XCTAssert(cpu.interrupt_status.IFF1 == false)
        XCTAssert(cpu.int_req == true)
        cpu.executeNextOpcode()
        cpu.executeNextOpcode()
        XCTAssert(cpu.interrupt_status.IFF1 == false)
        XCTAssert(cpu.regs.pc == 0x0002)
        
        XCTAssert(clock.getCycles() == 8 + 13 + 4 + 14)
    }
    
    func test_ld_i_a() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0x47])
        cpu.regs.main.a = 0xDD
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.i == 0xDD)
        
        XCTAssert(clock.getCycles() == 9)
    }
    
    func test_ld_r_a() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0x4F])
        cpu.regs.main.a = 0xBB
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.r == 0xBB)
        
        XCTAssert(clock.getCycles() == 9)
    }
    
    func test_ld_a_i() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0x57])
        cpu.regs.i = 0xDD
        cpu.interrupt_status.IFF2 = true
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.a == 0xDD)
        XCTAssert(cpu.regs.main.f & FLAG_S != 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        XCTAssert(cpu.regs.main.f & FLAG_5 == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(cpu.regs.main.f & FLAG_3 != 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV != 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        
        XCTAssert(clock.getCycles() == 9)
    }
    
    func test_ld_a_r() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0x5F])
        cpu.regs.r = 0xDD
        cpu.interrupt_status.IFF2 = true
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.a == 0xDF)
        XCTAssert(cpu.regs.main.f & FLAG_S != 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        XCTAssert(cpu.regs.main.f & FLAG_5 == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(cpu.regs.main.f & FLAG_3 != 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        
        XCTAssert(clock.getCycles() == 9)
    }
    
    func test_rrd() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0x67])
        bus.write(0x5000, data: [0b00100000])
        cpu.regs.main.hl = 0x5000
        cpu.regs.main.a = 0b10000100
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.a == 0b10000000)
        XCTAssert(bus.read(0x5000) == 0b01000010)
        XCTAssert(cpu.regs.main.f & FLAG_S != 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        XCTAssert(cpu.regs.main.f & FLAG_5 == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(cpu.regs.main.f & FLAG_3 == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        
        XCTAssert(clock.getCycles() == 18)
    }
    
    func test_rld() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0x6F])
        bus.write(0x5000, data: [0b00110001])
        cpu.regs.main.hl = 0x5000
        cpu.regs.main.a = 0b01111010
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.a == 0b01110011)
        XCTAssert(bus.read(0x5000) == 0b00011010)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z == 0)
        XCTAssert(cpu.regs.main.f & FLAG_5 != 0)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(cpu.regs.main.f & FLAG_3 == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        
        XCTAssert(clock.getCycles() == 18)
    }
    
    func test_ldi() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0xA0])
        bus.write(0x1111, data: [0x88])
        bus.write(0x2222, data: [0x66])
        cpu.regs.main.a = 0x11
        cpu.regs.main.hl = 0x1111
        cpu.regs.main.de = 0x2222
        cpu.regs.main.bc = 0x0007
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.hl == 0x1112)
        XCTAssert(cpu.regs.main.de == 0x2223)
        XCTAssert(bus.read(0x1111) == 0x88)
        XCTAssert(bus.read(0x2222) == 0x88)
        XCTAssert(cpu.regs.main.bc == 0x0006)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV != 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_3 != 0)
        XCTAssert(cpu.regs.main.f & FLAG_5 == 0)
        
        XCTAssert(clock.getCycles() == 16)
    }
    
    func test_cpi() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0xA1])
        bus.write(0x1111, data: [0x3B])
        cpu.regs.main.a = 0x3B
        cpu.regs.main.hl = 0x1111
        cpu.regs.main.bc = 0x0001
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.hl == 0x1112)
        XCTAssert(bus.read(0x1111) == 0x3B)
        XCTAssert(cpu.regs.main.bc == 0x0000)
        XCTAssert(cpu.regs.main.a == 0x3B)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N != 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_3 == 0)
        XCTAssert(cpu.regs.main.f & FLAG_5 == 0)
        
        XCTAssert(clock.getCycles() == 16)
    }
    func test_ini() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0xA2])
        bus.ioWrite(0x0007, value: 0x7B)
        cpu.regs.main.b = 0x10
        cpu.regs.main.c = 0x07
        cpu.regs.main.hl = 0x1000
        cpu.executeNextOpcode()
        XCTAssert(bus.read(0x1000) == 0x7B)
        XCTAssert(cpu.regs.main.hl == 0x1001)
        XCTAssert(cpu.regs.main.b == 0x0F)
        
        XCTAssert(clock.getCycles() == 16)
    }
    func test_outi() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0xA3])
        bus.write(0x1000, data: [0x59])
        cpu.regs.main.b = 0x10
        cpu.regs.main.c = 0x07
        cpu.regs.main.hl = 0x1000
        cpu.executeNextOpcode()
        XCTAssert(bus.ioRead(0x07) == 0x59)
        XCTAssert(cpu.regs.main.hl == 0x1001)
        XCTAssert(cpu.regs.main.b == 0x0F)
        
        XCTAssert(clock.getCycles() == 16)
    }
    func test_ldd() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0xA8])
        bus.write(0x1111, data: [0x88])
        bus.write(0x2222, data: [0x66])
        cpu.regs.main.a = 0x11
        cpu.regs.main.hl = 0x1111
        cpu.regs.main.de = 0x2222
        cpu.regs.main.bc = 0x0007
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.hl == 0x1110)
        XCTAssert(cpu.regs.main.de == 0x2221)
        XCTAssert(bus.read(0x1111) == 0x88)
        XCTAssert(bus.read(0x2222) == 0x88)
        XCTAssert(cpu.regs.main.bc == 0x0006)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV != 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_3 != 0)
        XCTAssert(cpu.regs.main.f & FLAG_5 == 0)
        
        XCTAssert(clock.getCycles() == 16)
    }
    func test_cpd() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0xA9])
        bus.write(0x1111, data: [0x3B])
        cpu.regs.main.a = 0x3B
        cpu.regs.main.hl = 0x1111
        cpu.regs.main.bc = 0x0001
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.hl == 0x1110)
        XCTAssert(bus.read(0x1111) == 0x3B)
        XCTAssert(cpu.regs.main.bc == 0x0000)
        XCTAssert(cpu.regs.main.a == 0x3B)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N != 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_3 == 0)
        XCTAssert(cpu.regs.main.f & FLAG_5 == 0)
        
        XCTAssert(clock.getCycles() == 16)

    }
    func test_ind() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0xAA])
        bus.ioWrite(0x0007, value: 0x7B)
        cpu.regs.main.b = 0x10
        cpu.regs.main.c = 0x07
        cpu.regs.main.hl = 0x1000
        cpu.executeNextOpcode()
        XCTAssert(bus.read(0x1000) == 0x7B)
        XCTAssert(cpu.regs.main.hl == 0x0FFF)
        XCTAssert(cpu.regs.main.b == 0x0F)
        
        XCTAssert(clock.getCycles() == 16)

    }
    func test_outd() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0xAB])
        bus.write(0x1000, data: [0x59])
        cpu.regs.main.b = 0x10
        cpu.regs.main.c = 0x07
        cpu.regs.main.hl = 0x1000
        cpu.executeNextOpcode()
        XCTAssert(bus.ioRead(0x07) == 0x59)
        XCTAssert(cpu.regs.main.hl == 0x0FFF)
        XCTAssert(cpu.regs.main.b == 0x0F)
        
        XCTAssert(clock.getCycles() == 16)

    }
    func test_ldir() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0xB0])
        bus.write(0x1111, data: [0x88, 0x36, 0xA5])
        bus.write(0x2222, data: [0x66, 0x59, 0xC5])
        cpu.regs.main.a = 0x11
        cpu.regs.main.hl = 0x1111
        cpu.regs.main.de = 0x2222
        cpu.regs.main.bc = 0x0003
        cpu.executeNextOpcode()
        cpu.executeNextOpcode()
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.hl == 0x1114)
        XCTAssert(cpu.regs.main.de == 0x2225)
        XCTAssert(cpu.regs.main.bc == 0)
        XCTAssert(bus.read(0x1111) == 0x88)
        XCTAssert(bus.read(0x1112) == 0x36)
        XCTAssert(bus.read(0x1113) == 0xA5)
        XCTAssert(bus.read(0x2222) == 0x88)
        XCTAssert(bus.read(0x2223) == 0x36)
        XCTAssert(bus.read(0x2224) == 0xA5)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_3 == 0)
        XCTAssert(cpu.regs.main.f & FLAG_5 != 0)
        XCTAssert(cpu.regs.pc == 0x0002)
        
        XCTAssert(clock.getCycles() == 21 * 2 + 16)
    }
    func test_cpir() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0xB1])
        bus.write(0x1111, data: [0x52, 0x00, 0xF3])
        bus.write(0x2222, data: [0x66, 0x59, 0xC5])
        cpu.regs.main.a = 0xF3
        cpu.regs.main.hl = 0x1111
        cpu.regs.main.bc = 0x0007
        cpu.executeNextOpcode()
        cpu.executeNextOpcode()
        cpu.executeNextOpcode()
        XCTAssertEqual(cpu.regs.main.hl, 0x1114)
        XCTAssert(cpu.regs.main.bc == 0x0004)
        XCTAssert(cpu.regs.main.f & FLAG_PV != 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z != 0)
        XCTAssert(cpu.regs.pc == 0x0002)
        
        XCTAssert(clock.getCycles() == 21 * 2 + 16)
    }
    func test_inir() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0xB2])
        bus.write(0x1000, data: [0x00, 0x00, 0x00, 0x00])
        cpu.regs.main.b = 0x03
        cpu.regs.main.c = 0x07
        cpu.regs.main.hl = 0x1000
        bus.ioWrite(0x0007, value: 0x7B)
        cpu.executeNextOpcode()
        bus.ioWrite(0x0007, value: 0x22)
        cpu.executeNextOpcode()
        bus.ioWrite(0x0007, value: 0x5C)
        cpu.executeNextOpcode()
        XCTAssert(bus.read(0x1000) == 0x7B)
        XCTAssert(bus.read(0x1001) == 0x22)
        XCTAssert(bus.read(0x1002) == 0x5C)
        XCTAssert(bus.read(0x1003) == 0x00)
        XCTAssert(cpu.regs.main.hl == 0x1003)
        XCTAssert(cpu.regs.main.b == 0x00)
        XCTAssert(cpu.regs.main.f & FLAG_Z != 0)
        XCTAssert(cpu.regs.main.f & FLAG_N != 0)
        XCTAssert(cpu.regs.pc == 0x0002)
        
        XCTAssert(clock.getCycles() == 21 * 2 + 16)
    }
    func test_otir() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0xB3])
        bus.write(0x1000, data: [0x51, 0xA9, 0x03])
        cpu.regs.main.b = 0x03
        cpu.regs.main.c = 0x07
        cpu.regs.main.hl = 0x1000
        cpu.executeNextOpcode()
        XCTAssert(bus.ioRead(0x07) == 0x51)
        cpu.executeNextOpcode()
        XCTAssert(bus.ioRead(0x07) == 0xA9)
        cpu.executeNextOpcode()
        XCTAssert(bus.ioRead(0x07) == 0x03)
        XCTAssert(cpu.regs.main.hl == 0x1003)
        XCTAssert(cpu.regs.main.b == 0x00)
        XCTAssert(cpu.regs.main.f & FLAG_Z != 0)
        XCTAssert(cpu.regs.main.f & FLAG_N != 0)
        XCTAssert(cpu.regs.pc == 0x0002)
        
        XCTAssert(clock.getCycles() == 21 * 2 + 16)
    }
    func test_lddr() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0xB8])
        bus.write(0x1112, data: [0x88, 0x36, 0xA5])
        bus.write(0x2223, data: [0x66, 0x59, 0xC5])
        cpu.regs.main.a = 0x11
        cpu.regs.main.hl = 0x1114
        cpu.regs.main.de = 0x2225
        cpu.regs.main.bc = 0x0003
        cpu.executeNextOpcode()
        cpu.executeNextOpcode()
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.hl == 0x1111)
        XCTAssert(cpu.regs.main.de == 0x2222)
        XCTAssert(cpu.regs.main.bc == 0)
        XCTAssert(bus.read(0x1112) == 0x88)
        XCTAssert(bus.read(0x1113) == 0x36)
        XCTAssert(bus.read(0x1114) == 0xA5)
        XCTAssert(bus.read(0x2223) == 0x88)
        XCTAssert(bus.read(0x2224) == 0x36)
        XCTAssert(bus.read(0x2225) == 0xA5)
        XCTAssert(cpu.regs.main.f & FLAG_H == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_3 != 0)
        XCTAssert(cpu.regs.main.f & FLAG_5 == 0)
        XCTAssert(cpu.regs.pc == 0x0002)
        
        XCTAssert(clock.getCycles() == 21 * 2 + 16)
    }
    func test_cpdr() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0xB9])
        bus.write(0x1116, data: [0xF3, 0x00, 0x52])
        bus.write(0x2222, data: [0x66, 0x59, 0xC5])
        cpu.regs.main.a = 0xF3
        cpu.regs.main.hl = 0x1118
        cpu.regs.main.bc = 0x0007
        cpu.executeNextOpcode()
        cpu.executeNextOpcode()
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.hl == 0x1115)
        XCTAssert(cpu.regs.main.bc == 0x0004)
        XCTAssert(cpu.regs.main.f & FLAG_PV != 0)
        XCTAssert(cpu.regs.main.f & FLAG_Z != 0)
        XCTAssert(cpu.regs.pc == 0x0002)
        
        XCTAssert(clock.getCycles() == 21 * 2 + 16)

    }
    func test_indr() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0xBA])
        bus.write(0x0FFD, data: [0x00, 0x00, 0x00, 0x00])
        cpu.regs.main.b = 0x03
        cpu.regs.main.c = 0x07
        cpu.regs.main.hl = 0x1000
        bus.ioWrite(0x0007, value: 0x7B)
        cpu.executeNextOpcode()
        bus.ioWrite(0x0007, value: 0xDD)
        cpu.executeNextOpcode()
        bus.ioWrite(0x0007, value: 0x8A)
        cpu.executeNextOpcode()
        XCTAssert(bus.read(0x1000) == 0x7B)
        XCTAssert(bus.read(0x0FFF) == 0xDD)
        XCTAssert(bus.read(0x0FFE) == 0x8A)
        XCTAssert(bus.read(0x0FFD) == 0x00)
        XCTAssert(cpu.regs.main.hl == 0x0FFD)
        XCTAssert(cpu.regs.main.b == 0x00)
        XCTAssert(cpu.regs.main.f & FLAG_Z != 0)
        XCTAssert(cpu.regs.main.f & FLAG_N != 0)
        XCTAssert(cpu.regs.pc == 0x0002)
        
        XCTAssert(clock.getCycles() == 21 * 2 + 16)

    }
    func test_otdr() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xED, 0xBB])
        bus.write(0x0FFE, data: [0x51, 0xA9, 0xBB])
        cpu.regs.main.b = 0x03
        cpu.regs.main.c = 0x07
        cpu.regs.main.hl = 0x1000
        cpu.executeNextOpcode()
        XCTAssert(bus.ioRead(0x07) == 0xBB)
        cpu.executeNextOpcode()
        XCTAssert(bus.ioRead(0x07) == 0xA9)
        cpu.executeNextOpcode()
        XCTAssert(bus.ioRead(0x07) == 0x51)
        XCTAssert(cpu.regs.main.hl == 0x0FFD)
        XCTAssert(cpu.regs.main.b == 0x00)
        XCTAssert(cpu.regs.main.f & FLAG_Z != 0)
        XCTAssert(cpu.regs.main.f & FLAG_N != 0)
        XCTAssert(cpu.regs.pc == 0x0002)
        
        XCTAssert(clock.getCycles() == 21 * 2 + 16)
    }
    
    func test_add_ix_bc() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xDD, 0xDD, 0x09])
        cpu.regs.ix = 0x22
        cpu.regs.main.hl = 0x44
        cpu.regs.main.bc = 0xAA
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.hl == 0x44)
        XCTAssert(cpu.regs.ix == 0xCC)
        XCTAssert(cpu.regs.pc == 0x0003)
        
        XCTAssert(clock.getCycles() == 23)
    }
    
    func test_add_iy_bc() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xDD, 0xFD, 0x09])
        cpu.regs.iy = 0x22
        cpu.regs.main.hl = 0x44
        cpu.regs.main.bc = 0xAA
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.hl == 0x44)
        XCTAssert(cpu.regs.iy == 0xCC)
        XCTAssert(cpu.regs.pc == 0x0003)
        
        XCTAssert(clock.getCycles() == 23)
    }
    
    func test_inc_ixdi() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xDD, 0x34, 0x09])
        bus.write(0x1009, data: [0x0F])
        cpu.regs.ix = 0x1000
        cpu.executeNextOpcode()
        XCTAssert(cpu.bus.read(0x1009) == 0x10)
        
        XCTAssert(clock.getCycles() == 23, String.init(format: "cycles: %d", clock.getCycles()))
    }
    
    func test_jp_ixi() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xDD, 0xE9])
        cpu.regs.main.hl = 0x4000
        cpu.regs.ix = 0x5000
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.pc == 0x5000)
        
        XCTAssert(clock.getCycles() == 8)
    }
    
    func test_ld_ixh_b() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xDD, 0x60])
        cpu.regs.main.b = 0x44
        cpu.regs.main.hl = 0x2211
        cpu.regs.ix = 0x6677
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.hl == 0x2211)
        XCTAssert(cpu.regs.ix == 0x4477)
        
        XCTAssert(clock.getCycles() == 8)
    }
    
    func test_ld_iyh_b() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xFD, 0x60])
        cpu.regs.main.b = 0x44
        cpu.regs.main.hl = 0x2211
        cpu.regs.iy = 0x6677
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.hl == 0x2211)
        XCTAssert(cpu.regs.iy == 0x4477)
        
        XCTAssert(clock.getCycles() == 8)
    }
    
    func test_ld_ixd_n() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xDD, 0x36, 0xFF, 0x22])
        bus.write(0x1000, data: [0xBB])
        cpu.regs.main.hl = 0x2000
        cpu.regs.ix = 0x1001
        cpu.executeNextOpcode()
        XCTAssert(bus.read(0x1000) == 0x22)
        
        XCTAssert(clock.getCycles() == 19)
    }
    
    func test_rlc_r_ixd() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xDD, 0xCB, 0x01, 0x00])
        bus.write(0x1001, data: [0b10001000])
        cpu.regs.main.hl = 0x2000
        cpu.regs.ix = 0x1000
        cpu.executeNextOpcode()
        XCTAssert(bus.read(0x1001) == 0b00010001)
        XCTAssert(cpu.regs.main.b == 0b00010001)
        XCTAssert(cpu.regs.main.f & FLAG_C != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV != 0)
        XCTAssert(cpu.regs.pc == 0x0004)
        
        XCTAssert(clock.getCycles() == 23)
    }
    
    func test_rlc_ixd() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xDD, 0xCB, 0x01, 0x06])
        bus.write(0x1001, data: [0b10001000])
        cpu.regs.main.b = 0xDD
        cpu.regs.ix = 0x1000
        cpu.executeNextOpcode()
        XCTAssert(bus.read(0x1001) == 0b00010001)
        XCTAssert(cpu.regs.main.b == 0xDD)
        XCTAssert(cpu.regs.main.f & FLAG_C != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV != 0)
        XCTAssert(cpu.regs.pc == 0x0004)
        
        XCTAssert(clock.getCycles() == 23)
    }
    
    func test_bit_ixd() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xDD, 0xCB, 0x01, 0x46])
        cpu.regs.ix = 0xA000
        bus.write(cpu.regs.ix + 1, data: [0b00010000])
        cpu.regs.main.f = 0
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.f & FLAG_Z != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV != 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_3 == 0)
        XCTAssert(cpu.regs.main.f & FLAG_5 != 0)
        XCTAssert(cpu.regs.pc == 0x0004)
        
        XCTAssert(clock.getCycles() == 20)
    }
    
    func test_bit_iyd() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xFD, 0xCB, 0x01, 0x46])
        cpu.regs.ix = 0xB000
        cpu.regs.iy = 0xA000
        bus.write(cpu.regs.iy + 1, data: [0b00010000])
        cpu.regs.main.f = 0
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.f & FLAG_Z != 0)
        XCTAssert(cpu.regs.main.f & FLAG_S == 0)
        XCTAssert(cpu.regs.main.f & FLAG_PV != 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
        XCTAssert(cpu.regs.main.f & FLAG_3 == 0)
        XCTAssert(cpu.regs.main.f & FLAG_5 != 0)
        XCTAssert(cpu.regs.pc == 0x0004)
        
        XCTAssert(clock.getCycles() == 20)
    }
    
    func test_res_set() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xCB, 0xAD, 0xCB, 0xED])
        cpu.regs.main.l = 0x21
        cpu.executeNextOpcode()
        XCTAssertEqual(cpu.regs.main.l, 0x01)
        
        cpu.executeNextOpcode()
        XCTAssertEqual(cpu.regs.main.l, 0x21)
        
        XCTAssertEqual(clock.getCycles(), 2 * 8)
        
    }
    func test_res_set_ixd() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xDD, 0xCB, 0x01, 0x86, 0xFD, 0xDD, 0xCB, 0x01, 0xC7])
        bus.write(0x1001, data: [0b00000001])
        cpu.regs.ix = 0x1000
        cpu.executeNextOpcode()
        XCTAssert(bus.read(0x1001) == 0)
        
        cpu.regs.main.a = 0xDD
        cpu.executeNextOpcode()
        XCTAssert(bus.read(0x1001) == 0x01)
        XCTAssert(cpu.regs.main.a == 0x01)
        
        XCTAssert(clock.getCycles() == 23 + 23 + 8)

    }
    
    func test_xor() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xAF])
        cpu.executeNextOpcode()
        XCTAssertEqual(cpu.regs.main.a, 0)
        XCTAssertEqual(cpu.regs.main.f, 0x44)
        
        XCTAssertEqual(clock.getCycles(), 4)
    }
    
    func test_cp() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xBC])
        cpu.regs.main.h = 0xF7
        cpu.executeNextOpcode()
        XCTAssertEqual(cpu.regs.main.f & FLAG_3, 0)
        XCTAssertNotEqual(cpu.regs.main.f & FLAG_5, 0)
        
        XCTAssertEqual(clock.getCycles(), 4)
    }
    
    func test_ld_l_iyi() {
        cpu.reset()
        
        bus.write(0x0000, data: [0xFD, 0x6E, 0x00])
        bus.write(0x4000, data: [0xDD])
        cpu.regs.main.hl = 0x3000
        cpu.regs.iy = 0x4000
        cpu.executeNextOpcode()
        XCTAssertEqual(cpu.regs.main.hl, 0x30DD)
        XCTAssertEqual(cpu.regs.iy, 0x4000)
        XCTAssertEqual(cpu.regs.pc, 0x0003)
        
        XCTAssertEqual(clock.getCycles(), 19)
    }
}
