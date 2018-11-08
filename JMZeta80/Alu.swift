//
//  Alu.swift
//  JMZeta80
//
//  Created by Jose Luis Fernandez-Mayoralas on 11/10/18.
//  Copyright © 2018 Jose Luis Fernandez-Mayoralas. All rights reserved.
//

import Foundation

class Alu {
    static func inc(_ a: UInt8, flags: inout UInt8) -> UInt8 {
        var op_a = a
        
        // preserver carry flag
        let carry_flag = flags & FLAG_C
        
        _add(&op_a, 1, carry: 0, flags: &flags)
        
        // restore carry flag
        flags = flags & ~FLAG_C | carry_flag
        
        return op_a
    }
    
    static func dec(_ a: UInt8, flags: inout UInt8) -> UInt8 {
        var op_a = a
        
        // preserver carry flag
        let carry_flag = flags & FLAG_C
        
        _sub(&op_a, 1, carry: 0, flags: &flags)
        
        // restore carry flag
        flags = flags & ~FLAG_C | carry_flag
        
        return op_a
    }
    
    static func add(_ a: UInt8, _ b: UInt8, flags: inout UInt8) -> UInt8 {
        var op_a = a
        _add(&op_a, b, carry: 0, flags: &flags)
        return op_a
    }
    
    static func add(_ a: UInt16, _ b: UInt16, flags: inout UInt8) -> UInt16 {
        let f_backup = flags
        
        let l_add = add(a.low, b.low, flags: &flags)
        let h_add = adc(a.high, b.high, flags: &flags)
        
        flags = flags & ~FLAG_S | f_backup & FLAG_S
        flags = flags & ~FLAG_Z | f_backup & FLAG_Z
        flags = flags & ~FLAG_PV | f_backup & FLAG_PV
        
        return UInt16(h_add) << 8 | UInt16(l_add)
    }
    
    static func adc(_ a: UInt8, _ b: UInt8, flags: inout UInt8) -> UInt8 {
        var op_a = a
        _add(&op_a, b, carry: flags & FLAG_C, flags: &flags)
        return op_a
    }
    
    static func adc(_ a: UInt16, _ b: UInt16, flags: inout UInt8) -> UInt16 {
        let l_add = adc(a.low, b.low, flags: &flags)
        let h_add = adc(a.high, b.high, flags: &flags)
        
        return UInt16(h_add) << 8 | UInt16(l_add)
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
    
    static func sbc(_ a: UInt16, _ b: UInt16, flags: inout UInt8) -> UInt16 {
        let l_add = sbc(a.low, b.low, flags: &flags)
        let h_add = sbc(a.high, b.high, flags: &flags)

        return UInt16(h_add) << 8 | UInt16(l_add)
    }
    
    static func cp(_ a: UInt8, _ b: UInt8, flags: inout UInt8) {
        var dummy = a
        _sub(&dummy, b, carry: 0, flags: &flags)
        
        flags = flags & ~FLAG_3 | b & FLAG_3
        flags = flags & ~FLAG_5 | b & FLAG_5
    }
    
    static func and(_ a: UInt8, _ b: UInt8, flags: inout UInt8) -> UInt8 {
        var op_a = a
        op_a &= b
        
        flags.set(bit: FLAG_H)
        flags.reset(bit: FLAG_N)
        flags.reset(bit: FLAG_C)
        flags = flags & ~FLAG_S | op_a & FLAG_S
        if op_a == 0 { flags.set(bit: FLAG_Z) } else { flags.reset(bit: FLAG_Z) }
        if op_a.parity == 0 { flags.set(bit: FLAG_PV) } else { flags.reset(bit: FLAG_PV) }
        
        flags = flags & ~FLAG_3 | op_a & FLAG_3
        flags = flags & ~FLAG_5 | op_a & FLAG_5
        
        return op_a
    }
    
    static func or(_ a: UInt8, _ b: UInt8, flags: inout UInt8) -> UInt8 {
        var op_a = a
        op_a |= b
        
        flags.reset(bit: FLAG_H)
        flags.reset(bit: FLAG_N)
        flags.reset(bit: FLAG_C)
        flags = flags & ~FLAG_S | op_a & FLAG_S
        if op_a == 0 { flags.set(bit: FLAG_Z) } else { flags.reset(bit: FLAG_Z) }
        if op_a.parity == 0 { flags.set(bit: FLAG_PV) } else { flags.reset(bit: FLAG_PV) }
        
        flags = flags & ~FLAG_3 | op_a & FLAG_3
        flags = flags & ~FLAG_5 | op_a & FLAG_5
        
        return op_a
    }
    
    static func xor(_ a: UInt8, _ b: UInt8, flags: inout UInt8) -> UInt8 {
        var op_a = a
        op_a ^= b
        
        flags.reset(bit: FLAG_H)
        flags.reset(bit: FLAG_N)
        flags.reset(bit: FLAG_C)
        flags = flags & ~FLAG_S | op_a & FLAG_S
        if op_a == 0 { flags.set(bit: FLAG_Z) } else { flags.reset(bit: FLAG_Z) }
        if op_a.parity == 0 { flags.set(bit: FLAG_PV) } else { flags.reset(bit: FLAG_PV) }
        
        flags = flags & ~FLAG_3 | op_a & FLAG_3
        flags = flags & ~FLAG_5 | op_a & FLAG_5
        
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

        flags = flags & ~FLAG_3 | result & FLAG_3
        flags = flags & ~FLAG_5 | result & FLAG_5
        
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

        flags = flags & ~FLAG_3 | result & FLAG_3
        flags = flags & ~FLAG_5 | result & FLAG_5
        
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

        flags = flags & ~FLAG_3 | result & FLAG_3
        flags = flags & ~FLAG_5 | result & FLAG_5
        
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

        flags = flags & ~FLAG_3 | result & FLAG_3
        flags = flags & ~FLAG_5 | result & FLAG_5
        
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

        flags = flags & ~FLAG_3 | result & FLAG_3
        flags = flags & ~FLAG_5 | result & FLAG_5
        
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

        flags = flags & ~FLAG_3 | result & FLAG_3
        flags = flags & ~FLAG_5 | result & FLAG_5
        
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

        flags = flags & ~FLAG_3 | result & FLAG_3
        flags = flags & ~FLAG_5 | result & FLAG_5
        
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

        flags = flags & ~FLAG_3 | result & FLAG_3
        flags = flags & ~FLAG_5 | result & FLAG_5
        
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
        
        flags = flags & ~FLAG_3 | op & FLAG_3
        flags = flags & ~FLAG_5 | op & FLAG_5
    }
    
    static func set(_ n: Int, _ op: UInt8, flags: inout UInt8) -> UInt8 {
        return op | UInt8(1 << n)
    }
    
    static func res(_ n: Int, _ op: UInt8, flags: inout UInt8) -> UInt8 {
        return op & ~UInt8(1 << n)
    }

    private static func _add(_ a: inout UInt8, _ b: UInt8, carry: UInt8, flags: inout UInt8) {
        let old_a = a
        
        let result = UInt16(a) &+ UInt16(b) &+ UInt16(carry)
        a = UInt8(result.low)
        
        flags = flags & ~FLAG_C | result.high & FLAG_C

        
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
        
        flags = flags & ~FLAG_3 | a & FLAG_3
        flags = flags & ~FLAG_5 | a & FLAG_5
    }
    
    private static func _sub(_ a: inout UInt8, _ b: UInt8, carry: UInt8, flags: inout UInt8) {
        let old_a = a
        
        let result = UInt16(a) &- UInt16(b) &- UInt16(carry)
        a = UInt8(result.low)
        
        flags = flags & ~FLAG_C | result.high & FLAG_C
        
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
        
        
        
        flags = flags & ~FLAG_3 | a & FLAG_3
        flags = flags & ~FLAG_5 | a & FLAG_5
    }
}
