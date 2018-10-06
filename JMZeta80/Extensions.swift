//
//  Extensions.swift
//  JMZeta80
//
//  Created by Jose Luis Fernandez-Mayoralas on 5/10/18.
//  Copyright © 2018 Jose Luis Fernandez-Mayoralas. All rights reserved.
//

import Foundation

extension UInt8 {
    var comp2: Int {
        let mask: UInt8 = 0x80
        return -Int(self & mask) + Int(self & ~mask)
    }
    
    mutating func reset(bit: UInt8) {
        self = self & ~bit
    }
    
    mutating func set(bit: UInt8) {
        self = self | bit
    }
    
    var oldComp2: Int {
        return self > 0x7F ? Int(Int(self) - 0xFF - 1) : Int(self)
    }
}

let FLAG_S: UInt8  = 0b10000000
let FLAG_Z: UInt8  = 0b01000000
let FLAG_H: UInt8  = 0b00010000
let FLAG_PV: UInt8 = 0b00000100
let FLAG_N: UInt8  = 0b00000010
let FLAG_C: UInt8  = 0b00000001
