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
    let bus = TestBus(clock: Clock())
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
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
    
    func testCpuRegs() {
        let cpu = Cpu(bus: bus)
     
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

    func testBus() {
        let cpu = Cpu(bus: bus)
        
        // test bus operation and cpu accessibility
        bus.write(0x0000, value: 0x11)
        XCTAssert(cpu.bus.read(0x0000) == 0x11)
    }
    
    func testCpu() {
        let cpu = Cpu(bus: bus)
        
        // test cpu reset on instance creation
        XCTAssert(cpu.regs.sp == 0xFFFF)
        XCTAssert(cpu.regs.pc == 0)
        XCTAssert(cpu.clock.getCycles() == 0)
        
        // test memory operation delays
        _ = cpu.bus.read(0x0000)
        XCTAssert(cpu.clock.getCycles() == 3)
        cpu.bus.write(0x0000, value: 0x11)
        XCTAssert(cpu.clock.getCycles() == 7)
    }
}
