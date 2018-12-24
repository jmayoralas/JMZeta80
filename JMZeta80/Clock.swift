//
//  Clock.swift
//  JMZeta80
//
//  Created by Jose Luis Fernandez-Mayoralas on 2/10/18.
//  Copyright © 2018 Jose Luis Fernandez-Mayoralas. All rights reserved.
//

import Foundation

public protocol SystemClock {
    func add(cycles: Int) // uncontended increments
    func add(address: UInt16, cycles: Int) // contended increments
    func getCycles() -> Int
    func reset()
}
