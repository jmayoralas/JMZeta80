//
//  OpcodeTableXX.swift
//  JMZeta80
//
//  Created by Jose Luis Fernandez-Mayoralas on 4/10/18.
//  Copyright © 2018 Jose Luis Fernandez-Mayoralas. All rights reserved.
//

import Foundation

extension Cpu {
	func initOpcodeTableXX(_ opcodes: inout OpcodeTable) {
		opcodes[0x00] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x01] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x02] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x03] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x04] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x05] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x06] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x07] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x08] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x09] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x0A] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x0B] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x0C] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x0D] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x0E] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x0F] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x10] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x11] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x12] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x13] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x14] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x15] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x16] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x17] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x18] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x19] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x1A] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x1B] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x1C] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x1D] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x1E] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x1F] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x20] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x21] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x22] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x23] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x24] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x25] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x26] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x27] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x28] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x29] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x2A] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x2B] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x2C] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x2D] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x2E] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x2F] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x30] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x31] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x32] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x33] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x34] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x35] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x36] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x37] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x38] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x39] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x3A] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x3B] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x3C] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x3D] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x3E] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x3F] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x40] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x41] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x42] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x43] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x44] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x45] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x46] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x47] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x48] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x49] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x4A] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x4B] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x4C] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x4D] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x4E] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x4F] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x50] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x51] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x52] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x53] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x54] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x55] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x56] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x57] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x58] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x59] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x5A] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x5B] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x5C] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x5D] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x5E] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x5F] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x60] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x61] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x62] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x63] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x64] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x65] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x66] = {
			// ld h,(xx+d)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc)
			self.regs.pc &+= 1
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 5)
			self.regs.main.h = self.bus.read(address)
			self.id_opcode_table = table_NONE
		}
		opcodes[0x67] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x68] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x69] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x6A] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x6B] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x6C] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x6D] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x6E] = {
			// ld l,(xx+d)
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc)
			self.regs.pc &+= 1
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 5)
			self.regs.main.l = self.bus.read(address)
			self.id_opcode_table = table_NONE
		}
		opcodes[0x6F] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x70] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x71] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x72] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x73] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x74] = {
			// ld (xx+d),h
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc)
			self.regs.pc &+= 1
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 5)
			self.bus.write(address, value: self.regs.main.h)
			self.id_opcode_table = table_NONE
		}
		opcodes[0x75] = {
			// ld (xx+d),l
			var address = self.swap_hl == SwapHL.ix ? self.regs.ix : self.regs.iy
			let displ = self.bus.read(self.regs.pc)
			self.regs.pc &+= 1
			address = self.addRelative(displacement: displ, toAddress: address)
			self.clock.add(cycles: 5)
			self.bus.write(address, value: self.regs.main.l)
			self.id_opcode_table = table_NONE
		}
		opcodes[0x76] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x77] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x78] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x79] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x7A] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x7B] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x7C] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x7D] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x7E] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x7F] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x80] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x81] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x82] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x83] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x84] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x85] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x86] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x87] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x88] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x89] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x8A] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x8B] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x8C] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x8D] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x8E] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x8F] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x90] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x91] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x92] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x93] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x94] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x95] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x96] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x97] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x98] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x99] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x9A] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x9B] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x9C] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x9D] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x9E] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0x9F] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xA0] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xA1] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xA2] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xA3] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xA4] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xA5] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xA6] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xA7] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xA8] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xA9] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xAA] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xAB] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xAC] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xAD] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xAE] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xAF] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xB0] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xB1] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xB2] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xB3] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xB4] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xB5] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xB6] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xB7] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xB8] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xB9] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xBA] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xBB] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xBC] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xBD] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xBE] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xBF] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xC0] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xC1] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xC2] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xC3] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xC4] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xC5] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xC6] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xC7] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xC8] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xC9] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xCA] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xCB] = {
			self.id_opcode_table = table_XXCB
			self.regs.pc &+= 1
			self.fetchAndExec()
			self.id_opcode_table = table_NONE
		}
		opcodes[0xCC] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xCD] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xCE] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xCF] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xD0] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xD1] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xD2] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xD3] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xD4] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xD5] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xD6] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xD7] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xD8] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xD9] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xDA] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xDB] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xDC] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xDD] = {
			// NONI
			// ack new prefix
			self.swap_hl = SwapHL.ix
		}
		opcodes[0xDE] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xDF] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xE0] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xE1] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xE2] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xE3] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xE4] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xE5] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xE6] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xE7] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xE8] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xE9] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xEA] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xEB] = {
			// ex de,hl
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			self.id_opcode_table = table_NONE
		}
		opcodes[0xEC] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xED] = {
			// NONI
			self.clock.add(cycles: 4)
			self.interrupt_status.pending_execution = true
			// ack new prefix
			self.id_opcode_table = table_ED
			self.fetchAndExec()
			self.id_opcode_table = table_NONE
		}
		opcodes[0xEE] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xEF] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xF0] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xF1] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xF2] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xF3] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xF4] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xF5] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xF6] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xF7] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xF8] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xF9] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xFA] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xFB] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xFC] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xFD] = {
			// NONI
			// ack new prefix
			self.swap_hl = SwapHL.iy
		}
		opcodes[0xFE] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
		opcodes[0xFF] = {
			self.regs.xx = self.regs.main.hl
			
			switch self.swap_hl {
			case .ix: self.regs.main.hl = self.regs.ix
			case .iy: self.regs.main.hl = self.regs.iy
			}
			
			self.opcodes[table_NONE][Int(self.regs.ir)]()
			
			switch self.swap_hl {
			case .ix: self.regs.ix = self.regs.main.hl
			case .iy: self.regs.iy = self.regs.main.hl
			}
			
			self.regs.main.hl = self.regs.xx
			self.id_opcode_table = table_NONE
		}
	}
}
