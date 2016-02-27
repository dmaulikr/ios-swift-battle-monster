//
//  Character.swift
//  battle monsters
//
//  Created by Kersuzan on 24/10/2015.
//  Copyright © 2015 Kersuzan. All rights reserved.
//

import Foundation

class Character {
    
    // Base class for a character
    private var _hp: Int = 100
    private var _attackPwr: Int = 10
    
    var hp: Int {
        get {
            return self._hp
        }
    }
    
    var attackPwr: Int {
        get {
            return self._attackPwr
        }
    }
    
    var isAlive: Bool {
        get {
            return self._hp > 0
        }
    }
    
    init(hp: Int, attackPwr: Int) {
        self._hp = hp
        self._attackPwr = attackPwr
    }
    
    func attemptAttack(attackPwr: Int) -> Bool {
        self._hp -= attackPwr
        
        return true
    }
    
    
    
}