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
    private var _io_buffer = Array<UInt8>(repeating: 0xFF, count: 0x100)
 
    func clear() {
        for i in 0...0xFFFF {
            _data[i] = 0
        }
    }
    
    func read(_ address: UInt16) -> UInt8 {
        return _data[Int(address)]
    }
    
    func write(_ address: UInt16, value: UInt8) {
        _data[Int(address)] = value
    }
    
    func ioRead(_ address: UInt16) -> UInt8 {
        return _io_buffer[Int(address & 0x00FF)]
        
    }
    
    func ioWrite(_ address: UInt16, value: UInt8) {
        _io_buffer[Int(address & 0x00FF)] = value
    }
    
    func write(_ address: UInt16, data: [UInt8]) {
        var l_address = address
        for byte in data {
            write(l_address, value: byte)
            l_address &+= 1
        }
    }
}
