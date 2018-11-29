//
//  Opcode.swift
//  JMZeta80
//
//  Created by Jose Luis Fernandez-Mayoralas on 3/10/18.
//  Copyright © 2018 Jose Luis Fernandez-Mayoralas. All rights reserved.
//

import Foundation

typealias Opcode = UInt8

// opcode struct for opcode decode operations
extension Opcode {
    var x: Int { return Int((self & 0b11000000) >> 6) }
    var y: Int { return Int((self & 0b00111000) >> 3) }
    var z: Int { return Int(self & 0b00000111) }
    var p: Int { return self.y >> 1 }
    var q: Int { return self.y % 2 }
}
