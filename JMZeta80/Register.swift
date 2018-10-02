//
//  Register.swift
//  JMZeta80
//
//  Created by Jose Luis Fernandez-Mayoralas on 2/10/18.
//  Copyright © 2018 Jose Luis Fernandez-Mayoralas. All rights reserved.
//

import Foundation

struct Register {
    var high: UInt8
    var low: UInt8
    var value: UInt16 {
        get {
            return UInt16(self.high) << 8 + UInt16(self.low)
        }
        set {
            self.high = UInt8(newValue >> 8)
            self.low = UInt8(newValue & 0x00FF)
        }
    }
    
    init() {
        self.high = 0x00
        self.low = 0x00
    }
}

struct RegisterBank {
    private var _af = Register()
    private var _bc = Register()
    private var _de = Register()
    private var _hl = Register()
    
    // MARK: 16 bit accessors
    var af: UInt16 {
        get {
            return _af.value
        } set {
            _af.value = newValue
        }
    }
    
    var bc: UInt16 {
        get {
            return _bc.value
        } set {
            _bc.value = newValue
        }
    }
    
    var de: UInt16 {
        get {
            return _de.value
        } set {
            _de.value = newValue
        }
    }
    
    var hl: UInt16 {
        get {
            return _hl.value
        } set {
            _hl.value = newValue
        }
    }

    // MARK: 8 bit accessors
    var a: UInt8 {
        get {
            return _af.high
        } set {
            _af.high = newValue
        }
    }
    var f: UInt8 {
        get {
            return _af.low
        } set {
            _af.low = newValue
        }
    }
    
    var b: UInt8 {
        get {
            return _bc.high
        } set {
            _bc.high = newValue
        }
    }
    var c: UInt8 {
        get {
            return _bc.low
        } set {
            _bc.low = newValue
        }
    }
    
    var d: UInt8 {
        get {
            return _de.high
        } set {
            _de.high = newValue
        }
    }
    var e: UInt8 {
        get {
            return _de.low
        } set {
            _de.low = newValue
        }
    }
    
    var h: UInt8 {
        get {
            return _hl.high
        } set {
            _hl.high = newValue
        }
    }
    var l: UInt8 {
        get {
            return _hl.low
        } set {
            _hl.low = newValue
        }
    }
}

