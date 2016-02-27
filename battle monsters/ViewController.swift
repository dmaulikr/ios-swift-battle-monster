//
//  ViewController.swift
//  battle monsters
//
//  Created by Kersuzan on 24/10/2015.
//  Copyright © 2015 Kersuzan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var getChestSound: AVAudioPlayer!
    var attackSound: AVAudioPlayer!
    
    @IBOutlet var EnnemyHPLabel: UILabel!
    
    @IBOutlet var playerHPLabel: UILabel!
    
    @IBOutlet var messageLabel: UILabel!
    
    @IBOutlet var ennemyImage: UIImageView!
    
    var player: Player!
    var ennemy: Ennemy!
    var chestMessage: String?
    var canAttack: Bool = false
    
    @IBOutlet var attackButton: UIButton!
    @IBOutlet var chestImage: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manageSounds()
        
        // Create a player
        player = Player(name: "Anthony", hp: 100, attackPwr: 16)
        
        messageLabel.text = "Hi \(player.name)"
        
        generateEnnemy()
        
        playerHPLabel.text = "\(player.hp) HP"

    }
    
    func manageSounds() {
        let pathForChestSound = NSBundle.mainBundle().pathForResource("getItem", ofType: "wav")
        let chestSoundUrl = NSURL(fileURLWithPath: pathForChestSound!)
        
        do {
            try getChestSound = AVAudioPlayer(contentsOfURL: chestSoundUrl)
            getChestSound.prepareToPlay()
        } catch let error as NSError {
            print(error.debugDescription)
        }
        
        let pathForAttackSound = NSBundle.mainBundle().pathForResource("attack", ofType: "wav")
        let attackSoundUrl = NSURL(fileURLWithPath: pathForAttackSound!)
        
        do {
            try attackSound = AVAudioPlayer(contentsOfURL: attackSoundUrl)
            attackSound.prepareToPlay()
        } catch let error as NSError {
            print(error.debugDescription)
        }

    }
    
    func generateEnnemy() {
        let random = Int(arc4random_uniform(2))
        
        if random == 0 {
            ennemy = Minotaure(hp: 200, attackPwr: 40)
        } else {
            ennemy = DevilWizard(hp: 80, attackPwr: 10)
        }
        
        ennemyImage.image = UIImage(named: ennemy.image)
        ennemyImage.hidden = false
        EnnemyHPLabel.text = "\(ennemy.hp) HP"
        
        canAttack = true
        attackButton.hidden = false
        messageLabel.text = "A \(ennemy.type) appears, kill him boy!"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func attackPressed(sender: UIButton) {
       
        if canAttack {
            
            playSound(attackSound)
            
            if(ennemy.attemptAttack(player.attackPwr)) {
                messageLabel.text = "Attacked \(ennemy.type) for \(player.attackPwr) HP"
                EnnemyHPLabel.text = "\(ennemy.hp) HP"
            } else {
                messageLabel.text = "Attack was unsuccessful!"
            }
            
            
            if let loot = ennemy.dropLoot() {
                player.addItemToInventory(loot)
                chestMessage = "\(player.name) found \(loot)"
                chestImage.hidden = false
            }
            
            if !ennemy.isAlive {
                EnnemyHPLabel.text = ""
                messageLabel.text = "Killed \(ennemy.type)"
                ennemyImage.hidden = true
                canAttack = false
                attackButton.hidden = true
            }

        }
    }
    
    func playSound(sound: AVAudioPlayer) {
        if sound.playing {
            sound.stop()
        }
        sound.play()
    }
    
    @IBAction func ChestTapped(sender: UIButton) {
        playSound(getChestSound)
        chestImage.hidden = true
        messageLabel.text = chestMessage
        NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "generateEnnemy", userInfo: nil, repeats: false)
    }

}

