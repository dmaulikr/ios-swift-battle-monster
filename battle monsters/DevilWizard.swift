//
//  DevilWizard.swift
//  battle monsters
//
//  Created by Kersuzan on 24/10/2015.
//  Copyright © 2015 Kersuzan. All rights reserved.
//

import Foundation

class DevilWizard: Ennemy {
    
    override var loot: [String] {
        return ["Magic Wand", "Dark Amulet", "Salted Pork"]
    }
    
    override var type: String {
        return "Devil Wizard"
    }
    
    override var image: String {
        return "enem2"
    }
}