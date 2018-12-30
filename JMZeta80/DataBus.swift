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
final class DataBus {
    let _bus: AccessibleBus
    let _clock: SystemClock
    var _last_data: UInt8 = 0xFF
    
    init(bus: AccessibleBus, clock: SystemClock) {
        _bus = bus
        _clock = clock
    }
    
    final func read(_ address: UInt16) -> UInt8 {
        _last_data = _bus.read(address)
        _clock.add(cycles: 3)

        return _last_data
    }
    
    final func write(_ address: UInt16, value: UInt8) {
        writeNoDelay(address, value: value)
        _clock.add(cycles: 3)
    }
    
    final func writeNoDelay(_ address: UInt16, value: UInt8) {
        _bus.write(address, value: value)
        _last_data = value
    }
    
    final func ioRead(_ address: UInt16) -> UInt8 {
        _last_data = _bus.ioRead(address)
        return _last_data
    }
    
    final func ioWrite(_ address: UInt16, value: UInt8) {
        _bus.ioWrite(address, value: value)
        _last_data = value
    }
    
    final func getLastData() -> UInt8 {
        return _last_data
    }
    
    // High impedance read
    final func read() -> UInt8 {
        return 0xFF
    }
}
