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
    let bus = TestBus()
    let clock = Clock()
    var cpu: Cpu!
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
    }

    func testBus() {
        cpu.reset()
        
        // test bus operation and cpu accessibility
        bus.write(0x0000, value: 0x11)
        XCTAssert(cpu.bus.read(0x0000) == 0x11)
        XCTAssert(cpu.bus.ioRead(0xFE) == 0xFF)
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
        
        bus.write(0x0000, data: [0x09, 0x09, 0x09])
        
        cpu.regs.main.hl = 0x4242
        cpu.regs.main.bc = 0x1111
        cpu.regs.main.f = 0xFF
        cpu.executeNextOpcode()
        XCTAssert(cpu.regs.main.hl == 0x5353)
        XCTAssert(cpu.regs.main.f & FLAG_C == 0)
        XCTAssert(cpu.regs.main.f & FLAG_N == 0)
        XCTAssert(cpu.regs.main.f & FLAG_H != 0)
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
        
        XCTAssert(clock.getCycles() == 11 + 11 + 11)
    }
}
