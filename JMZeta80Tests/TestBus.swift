//
//  TestBus.swift
//  JMZeta80Tests
//
//  Created by Jose Luis Fernandez-Mayoralas on 2/10/18.
//  Copyright © 2018 Jose Luis Fernandez-Mayoralas. All rights reserved.
//

import Foundation
import JMZeta80

class Clock : SystemClock {
    private var _cycles = 0
    
    func reset() {
        _cycles = 0
    }
    
    func add(cycles: Int) {
        _cycles += cycles
    }
    
    func getCycles() -> Int {
        return _cycles
    }
}

class TestBus: AccessibleBus {
    private var _data = Array<UInt8>(repeating: 0, count: 0x10000)
    
    func read(_ address: UInt16) -> UInt8 {
        return _data[Int(address)]
    }
    
    func write(_ address: UInt16, value: UInt8) {
        _data[Int(address)] = value
    }
    
    func ioRead(_ address: UInt16) -> UInt8 { return 0xFF }
    func ioWrite(_ address: UInt16, value: UInt8) {}
}