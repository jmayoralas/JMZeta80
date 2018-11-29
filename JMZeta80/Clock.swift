//
//  Clock.swift
//  JMZeta80
//
//  Created by Jose Luis Fernandez-Mayoralas on 2/10/18.
//  Copyright © 2018 Jose Luis Fernandez-Mayoralas. All rights reserved.
//

import Foundation

public protocol SystemClock {
    func add(cycles: Int)
    func sub(cycles: Int)
    func getCycles() -> Int
    func reset()
}
