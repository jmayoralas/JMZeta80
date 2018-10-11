//
//  Alu.swift
//  JMZeta80
//
//  Created by Jose Luis Fernandez-Mayoralas on 11/10/18.
//  Copyright © 2018 Jose Luis Fernandez-Mayoralas. All rights reserved.
//

import Foundation

class Alu {
    static func add(_ a: UInt8, _ b: UInt8, flags: inout UInt8) -> UInt8 {
        var op_a = a
        _add(&op_a, b, carry: 0, flags: &flags)
        return op_a
    }
    
    static func adc(_ a: UInt8, _ b: UInt8, flags: inout UInt8) -> UInt8 {
        var op_a = a
        _add(&op_a, b, carry: flags & FLAG_C, flags: &flags)
        return op_a
    }
    
    static func sub(_ a: UInt8, _ b: UInt8, flags: inout UInt8) -> UInt8 {
        var op_a = a
        _sub(&op_a, b, carry: 0, flags: &flags)
        return op_a
    }
    
    static func sbc(_ a: UInt8, _ b: UInt8, flags: inout UInt8) -> UInt8 {
        var op_a = a
        _sub(&op_a, b, carry: flags & FLAG_C, flags: &flags)
        return op_a
    }
    
    static func cp(_ a: UInt8, _ b: UInt8, flags: inout UInt8) {
        var dummy = a
        _sub(&dummy, b, carry: 0, flags: &flags)
    }
    
    static func and(_ a: UInt8, _ b: UInt8, flags: inout UInt8) -> UInt8 {
        var op_a = a
        op_a &= b
        
        flags.set(bit: FLAG_H)
        flags.reset(bit: FLAG_N)
        flags.reset(bit: FLAG_C)
        flags = flags & ~FLAG_S | a & FLAG_S
        if op_a == 0 { flags.set(bit: FLAG_Z) } else { flags.reset(bit: FLAG_Z) }
        if op_a.parity == 0 { flags.set(bit: FLAG_PV) } else { flags.reset(bit: FLAG_PV) }
        
        return op_a
    }
    
    static func or(_ a: UInt8, _ b: UInt8, flags: inout UInt8) -> UInt8 {
        var op_a = a
        op_a |= b
        
        flags.reset(bit: FLAG_H)
        flags.reset(bit: FLAG_N)
        flags.reset(bit: FLAG_C)
        flags = flags & ~FLAG_S | a & FLAG_S
        if op_a == 0 { flags.set(bit: FLAG_Z) } else { flags.reset(bit: FLAG_Z) }
        if op_a.parity == 0 { flags.set(bit: FLAG_PV) } else { flags.reset(bit: FLAG_PV) }
        
        return op_a
    }
    
    static func xor(_ a: UInt8, _ b: UInt8, flags: inout UInt8) -> UInt8 {
        var op_a = a
        op_a ^= b
        
        flags.reset(bit: FLAG_H)
        flags.reset(bit: FLAG_N)
        flags.reset(bit: FLAG_C)
        flags = flags & ~FLAG_S | a & FLAG_S
        if op_a == 0 { flags.set(bit: FLAG_Z) } else { flags.reset(bit: FLAG_Z) }
        if op_a.parity == 0 { flags.set(bit: FLAG_PV) } else { flags.reset(bit: FLAG_PV) }
        
        return op_a
    }

    private static func _add(_ a: inout UInt8, _ b: UInt8, carry: UInt8, flags: inout UInt8) {
        let old_a = a
        
        a &+= b &+ carry
        
        // flags
        if old_a & FLAG_S == b & FLAG_S && a & FLAG_S != old_a & FLAG_S {
            flags.set(bit: FLAG_PV)
        } else {
            flags.reset(bit: FLAG_PV)
        }
        flags.reset(bit: FLAG_N)
        flags = flags & ~FLAG_S | a & FLAG_S
        if a == 0 { flags.set(bit: FLAG_Z) } else { flags.reset(bit: FLAG_Z) }
        if a.low < old_a.low || ((a.low == old_a.low) && (a.high > old_a.high)) {
            flags.set(bit: FLAG_H)
        } else {
            flags.reset(bit: FLAG_H)
        }
        if a < old_a {
            flags.set(bit: FLAG_C)
        } else {
            flags.reset(bit: FLAG_C)
        }
    }
    
    private static func _sub(_ a: inout UInt8, _ b: UInt8, carry: UInt8, flags: inout UInt8) {
        let old_a = a
        
        a &-= b &- carry
        
        // flags
        if old_a & FLAG_S != b & FLAG_S && a & FLAG_S == b & FLAG_S {
            flags.set(bit: FLAG_PV)
        } else {
            flags.reset(bit: FLAG_PV)
        }
        flags.set(bit: FLAG_N)
        flags = flags & ~FLAG_S | a & FLAG_S
        if a == 0 { flags.set(bit: FLAG_Z) } else { flags.reset(bit: FLAG_Z) }
        if a.low > old_a.low || ((a.low == old_a.low) && (a.high < old_a.high)) {
            flags.set(bit: FLAG_H)
        } else {
            flags.reset(bit: FLAG_H)
        }
        if a > old_a {
            flags.set(bit: FLAG_C)
        } else {
            flags.reset(bit: FLAG_C)
        }
    }
}
