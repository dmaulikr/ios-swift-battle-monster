//
//  Player.swift
//  battle monsters
//
//  Created by Kersuzan on 24/10/2015.
//  Copyright © 2015 Kersuzan. All rights reserved.
//

import Foundation


class Player : Character {
    
    private var _name: String = "Player"
    
    private var _inventory: [String] = [String]()
    
    var name: String {
        get {
            return self._name
        }
    }
    
    var inventory: [String] {
        get {
            return self._inventory
        }
    }
    
    func addItemToInventory(item: String) {
        self._inventory.append(item)
    }
    
    convenience init(name: String, hp: Int, attackPwr: Int) {
        self.init(hp: hp, attackPwr: attackPwr)
        
        self._name = name
    }
    
    
}