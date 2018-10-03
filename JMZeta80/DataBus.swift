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
    let _bus: Bus
    let _clock: SystemClock
    
    init(bus: Bus, clock: SystemClock) {
        _bus = bus
        _clock = clock
    }
    
    func read(_ address: UInt16) -> UInt8 {
        _clock.add(cycles: 3)
        return _bus.read(address)
    }
    
    func write(_ address: UInt16, value: UInt8) {
        _clock.add(cycles: 4)
        _bus.write(address, value: value)
    }
}
