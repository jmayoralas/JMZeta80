//
//  Opcode.swift
//  JMZeta80
//
//  Created by Jose Luis Fernandez-Mayoralas on 3/10/18.
//  Copyright © 2018 Jose Luis Fernandez-Mayoralas. All rights reserved.
//

import Foundation

// opcode struct for opcode decode operations
struct Opcode {
    var value: UInt8 = 0
    
    var x: Int {
        get {
            return Int((self.value & 0b11000000) >> 6)
        }
    }
    var y: Int {
        get {
            return Int((self.value & 0b00111000) >> 3)
        }
    }
    var z: Int {
        get {
            return Int(self.value & 0b00000111)
        }
    }
    var p: Int {
        get {
            return self.y >> 1
        }
    }
    var q: Int {
        get {
            return self.y % 2
        }
    }
}
