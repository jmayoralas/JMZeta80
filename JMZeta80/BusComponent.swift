//
//  BusComponent.swift
//  JMZeta80
//
//  Created by Jose Luis Fernandez-Mayoralas on 2/10/18.
//  Copyright © 2018 Jose Luis Fernandez-Mayoralas. All rights reserved.
//

import Foundation

// protocol every 8 bit bus component must adopt
public protocol Bus {
    func read(_ address: UInt16) -> UInt8
    func write(_ address: UInt16, value: UInt8)
    func getClock() -> SystemClock
}
