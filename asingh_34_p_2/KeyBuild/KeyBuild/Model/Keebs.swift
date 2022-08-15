//
//  Keeb.swift
//  KeyBuild
//
//  Created by Anant Singh on 7/14/21.
//

import Foundation

class Keebs{
    
    var keebs = [Keyboard]()
    
    func addKeeb(name: String, color: String, price: Int, qty: Int, size: SizeType) {
        keebs.append(Keyboard(name: name, color: color, price: price, qty: qty, size: size))
    }
    
    func keebs(for sizeType: SizeType) -> [Keyboard] {
        return keebs.filter { $0.size == sizeType }
    }
    
}
    
    
    
    
    

