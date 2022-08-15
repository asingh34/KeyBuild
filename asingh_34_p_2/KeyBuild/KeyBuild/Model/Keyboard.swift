//
//  Keyboard.swift
//  KeyBuild
//
//  Created by Anant Singh on 7/14/21.
//

import Foundation

class Keyboard{
        var name: String
        var color: String
        var price: Int
        var qty: Int
        var size: SizeType
        
        init(name: String, color: String, price: Int, qty: Int, size: SizeType) {
            
            self.name = name
            self.color = color
            self.price = price
            self.qty = qty
            self.size = size
        }
}
