//
//  Ennemy.swift
//  battle monsters
//
//  Created by Kersuzan on 24/10/2015.
//  Copyright © 2015 Kersuzan. All rights reserved.
//

import Foundation


class Ennemy : Character {
    
    var loot: [String] {
        return ["Rusty Dagger","Cracked Buckler"]
    }
    
    var type: String {
        return "Grunt"
    }
    
    var image: String {
        return "Enem1"
    }
    
    func dropLoot() -> String? {
        if !isAlive {
            let rand = Int(arc4random_uniform(UInt32(loot.count)))
            return loot[rand]
        } else {
            return nil
        }
    }
    
}