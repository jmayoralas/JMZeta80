//
//  DataBus.swift
//  JMZeta80
//
//  Created by Jose Luis Fernandez-Mayoralas on 3/10/18.
//  Copyright © 2018 Jose Luis Fernandez-Mayoralas. All rights reserved.
//

import Foundation

// Especialized bus class that takes into account Z80 delays when bus line are accessed
// reads takes 3 tstates
// writes takes 4 tstates
class DataBus {
    let _bus: AccessibleBus
    let _clock: SystemClock
    var _last_data: UInt8 = 0xFF
    
    init(bus: AccessibleBus, clock: SystemClock) {
        _bus = bus
        _clock = clock
    }
    
    func read(_ address: UInt16) -> UInt8 {
        _clock.add(cycles: 3)
        _last_data = _bus.read(address)
        return _last_data
    }
    
    func write(_ address: UInt16, value: UInt8) {
        _clock.add(cycles: 3)
        writeNoDelay(address, value: value)
    }
    
    func writeNoDelay(_ address: UInt16, value: UInt8) {
        _bus.write(address, value: value)
        _last_data = value
    }
    
    func ioRead(_ address: UInt16) -> UInt8 {
        _last_data = _bus.ioRead(address)
        return _last_data
    }
    
    func ioWrite(_ address: UInt16, value: UInt8) {
        _bus.ioWrite(address, value: value)
        _last_data = value
    }
    
    func getLastData() -> UInt8 {
        return _last_data
    }
    
    // High impedance read
    func read() -> UInt8 {
        return 0xFF
    }
}
