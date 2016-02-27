//
//  Minotaure.swift
//  battle monsters
//
//  Created by Kersuzan on 24/10/2015.
//  Copyright © 2015 Kersuzan. All rights reserved.
//

import Foundation

class Minotaure: Ennemy {
    
    let IMMUNE_MAX = 15

    override var loot: [String] {
        return ["Tough Hide", "Minotaure Teeth", "Rare Trident"]
    }
    
    override var type: String {
        return "Minotaure"
    }
    
    override var image: String {
        return "enem1"
    }
    
    override func attemptAttack(attackPwr: Int) -> Bool {
        if(attackPwr > IMMUNE_MAX) {
            return super.attemptAttack(attackPwr)
        } else {
            return false
        }
    }
    
}