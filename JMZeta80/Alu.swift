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
    
    static func rlc(_ op: UInt8, flags: inout UInt8) -> UInt8 {
        let bit_7 = (op & 0x80) >> 7
        
        var result = op << 1
        
        flags.reset(bit: FLAG_C)
        flags |= bit_7
        result |= bit_7
        flags.reset(bit: FLAG_H)
        flags.reset(bit: FLAG_N)
        flags = flags & ~FLAG_S | result & FLAG_S
        if result == 0 { flags.set(bit: FLAG_Z) } else { flags.reset(bit: FLAG_Z) }
        if result.parity == 0 { flags.set(bit: FLAG_PV) } else { flags.reset(bit: FLAG_PV) }

        return result
    }
    
    static func rrc(_ op: UInt8, flags: inout UInt8) -> UInt8 {
        let bit_0 = op & 0x01
        
        var result = op >> 1
        
        flags.reset(bit: FLAG_C)
        flags |= bit_0
        result |= bit_0 << 7
        flags.reset(bit: FLAG_H)
        flags.reset(bit: FLAG_N)
        flags = flags & ~FLAG_S | result & FLAG_S
        if result == 0 { flags.set(bit: FLAG_Z) } else { flags.reset(bit: FLAG_Z) }
        if result.parity == 0 { flags.set(bit: FLAG_PV) } else { flags.reset(bit: FLAG_PV) }

        return result
    }
    
    static func rl(_ op: UInt8, flags: inout UInt8) -> UInt8 {
        let bit_7 = (op & 0x80) >> 7
        
        var result = op << 1
        
        result |= flags & FLAG_C
        flags.reset(bit: FLAG_C)
        flags |= bit_7
        flags.reset(bit: FLAG_H)
        flags.reset(bit: FLAG_N)
        flags = flags & ~FLAG_S | result & FLAG_S
        if result == 0 { flags.set(bit: FLAG_Z) } else { flags.reset(bit: FLAG_Z) }
        if result.parity == 0 { flags.set(bit: FLAG_PV) } else { flags.reset(bit: FLAG_PV) }

        
        return result
    }
    
    static func rr(_ op: UInt8, flags: inout UInt8) -> UInt8 {
        var result = op >> 1
        
        result |= (flags & FLAG_C) << 7
        flags = flags & ~FLAG_C | op & FLAG_C
        flags.reset(bit: FLAG_H)
        flags.reset(bit: FLAG_N)
        flags = flags & ~FLAG_S | result & FLAG_S
        if result == 0 { flags.set(bit: FLAG_Z) } else { flags.reset(bit: FLAG_Z) }
        if result.parity == 0 { flags.set(bit: FLAG_PV) } else { flags.reset(bit: FLAG_PV) }

        
        return result
    }
    
    static func sla(_ op: UInt8, flags: inout UInt8) -> UInt8 {
        let bit_7 = (op & 0x80) >> 7
        
        let result = op << 1
        
        flags.reset(bit: FLAG_C)
        flags |= bit_7
        flags.reset(bit: FLAG_H)
        flags.reset(bit: FLAG_N)
        flags = flags & ~FLAG_S | result & FLAG_S
        if result == 0 { flags.set(bit: FLAG_Z) } else { flags.reset(bit: FLAG_Z) }
        if result.parity == 0 { flags.set(bit: FLAG_PV) } else { flags.reset(bit: FLAG_PV) }

        return result
    }
    
    static func sra(_ op: UInt8, flags: inout UInt8) -> UInt8 {
        let bit_7 = (op & 0x80) >> 7
        
        var result = op >> 1
        
        flags = flags & ~FLAG_C | op & FLAG_C
        result |= bit_7 << 7
        flags.reset(bit: FLAG_H)
        flags.reset(bit: FLAG_N)
        flags = flags & ~FLAG_S | result & FLAG_S
        if result == 0 { flags.set(bit: FLAG_Z) } else { flags.reset(bit: FLAG_Z) }
        if result.parity == 0 { flags.set(bit: FLAG_PV) } else { flags.reset(bit: FLAG_PV) }

        return result
    }
    
    static func sll(_ op: UInt8, flags: inout UInt8) -> UInt8 {
        let bit_7 = (op & 0x80) >> 7
        
        var result = op << 1
        
        flags.reset(bit: FLAG_C)
        flags |= bit_7
        result |= 1
        flags.reset(bit: FLAG_H)
        flags.reset(bit: FLAG_N)
        flags = flags & ~FLAG_S | result & FLAG_S
        if result == 0 { flags.set(bit: FLAG_Z) } else { flags.reset(bit: FLAG_Z) }
        if result.parity == 0 { flags.set(bit: FLAG_PV) } else { flags.reset(bit: FLAG_PV) }

        return result
    }
    
    static func srl(_ op: UInt8, flags: inout UInt8) -> UInt8 {
        let result = op >> 1
        
        flags = flags & ~FLAG_C | op & FLAG_C
        flags.reset(bit: FLAG_H)
        flags.reset(bit: FLAG_N)
        flags = flags & ~FLAG_S | result & FLAG_S
        if result == 0 { flags.set(bit: FLAG_Z) } else { flags.reset(bit: FLAG_Z) }
        if result.parity == 0 { flags.set(bit: FLAG_PV) } else { flags.reset(bit: FLAG_PV) }

        return result
    }
    
    static func bit(_ n: Int, _ op: UInt8, flags: inout UInt8) {
        flags.set(bit: FLAG_H)
        flags.reset(bit: FLAG_N)
        flags = flags & ~FLAG_Z | ((~((op >> n) & 0x01) & 0x01) << Z)
        if flags & FLAG_Z != 0 { flags.set(bit: FLAG_PV) } else { flags.reset(bit: FLAG_PV) }
        if n == 7 {
            flags = flags & ~FLAG_S | op & FLAG_S
        } else {
            flags.reset(bit: FLAG_S)
        }
    }
    
    static func set(_ n: Int, _ op: UInt8, flags: inout UInt8) -> UInt8 {
        return op | UInt8(1 << n)
    }
    
    static func res(_ n: Int, _ op: UInt8, flags: inout UInt8) -> UInt8 {
        return op & UInt8(0 << n)
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
        if (old_a.low &+ b.low &+ carry) & 0x10 > 0 { flags.set(bit: FLAG_H) } else { flags.reset(bit: FLAG_H) }
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
        if (old_a.low &- b.low &- carry) & 0x10 > 0 { flags.set(bit: FLAG_H) } else { flags.reset(bit: FLAG_H) }
        if a > old_a {
            flags.set(bit: FLAG_C)
        } else {
            flags.reset(bit: FLAG_C)
        }
    }
}
