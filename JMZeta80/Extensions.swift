//
//  Extensions.swift
//  JMZeta80
//
//  Created by Jose Luis Fernandez-Mayoralas on 5/10/18.
//  Copyright © 2018 Jose Luis Fernandez-Mayoralas. All rights reserved.
//

import Foundation

extension UInt16 {
    var high: UInt8 {
        return UInt8(self >> 8)
    }
    
    var low: UInt8 {
        return UInt8(self & 0x00FF)
    }
}

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
    
    var parity: Int {
        var value = self & 1
        value += self >> 1 & 1
        value += self >> 2 & 1
        value += self >> 3 & 1
        value += self >> 4 & 1
        value += self >> 5 & 1
        value += self >> 6 & 1
        value += self >> 7 & 1
        
        return Int(value) & 1
    }
    
    var high: UInt8 {
        return self & 0b11110000
    }
    
    var low: UInt8 {
        return self & 0b00001111
    }
}

let FLAG_S: UInt8  = 0b10000000
let FLAG_Z: UInt8  = 0b01000000
let FLAG_5: UInt8  = 0b00100000
let FLAG_H: UInt8  = 0b00010000
let FLAG_3: UInt8  = 0b00001000
let FLAG_PV: UInt8 = 0b00000100
let FLAG_N: UInt8  = 0b00000010
let FLAG_C: UInt8  = 0b00000001
