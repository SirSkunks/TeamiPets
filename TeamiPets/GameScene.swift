//
//  GameScene.swift
//  TeamiPets
//
//  Created by Josh Dankerl on 2018-06-12.
//  Copyright © 2018 VGMOBA. All rights reserved.
//

import SpriteKit
import GameplayKit

protocol EventListenerNode {
    func didMoveToScene()
}

class GameScene: SKScene {
    var hungerFill : BarNode!
    var happyFill : BarNode!
    var cleanFill : BarNode!
    var sleepFill : BarNode!
    var lastUpdateTime: TimeInterval = 0
    var deltaTime: TimeInterval = 0
    
    override func didMove(to view: SKView) {
        self.isPaused = true
        self.isPaused = false
        
        enumerateChildNodes(withName: "//*", using: {node, _ in
            if let eventListenerNode = node as? EventListenerNode {
                eventListenerNode.didMoveToScene()
            }
        })
        
        if let hungerBar = childNode(withName: "hungerBar") as? SKReferenceNode {
            hungerFill = hungerBar.childNode(withName: ".//barFill") as! BarNode
            hungerFill.texture = SKTexture(imageNamed: "full")
        }
        
        if let happyBar = childNode(withName: "happyBar") as? SKReferenceNode {
            happyFill = happyBar.childNode(withName: ".//barFill") as! BarNode
            happyFill.texture = SKTexture(imageNamed: "happy")
        }

        if let cleanBar = childNode(withName: "cleanBar") as? SKReferenceNode {
            cleanFill = cleanBar.childNode(withName: ".//barFill") as! BarNode
            cleanFill.texture = SKTexture(imageNamed: "spotless")
        }
        if let sleepBar = childNode(withName: "sleepBar") as? SKReferenceNode {
            sleepFill = sleepBar.childNode(withName: ".//barFill") as! BarNode
            sleepFill.texture = SKTexture(imageNamed: "awake")
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if lastUpdateTime > 0 {
            deltaTime = currentTime - lastUpdateTime
        }
        else{
            deltaTime = 0
        }
        lastUpdateTime = currentTime
        hungerFill.decreaseBar(decreaseBy: 0.0005)
        happyFill.decreaseBar(decreaseBy: 0.0005)
        sleepFill.decreaseBar(decreaseBy: 0.0005)
        cleanFill.decreaseBar(decreaseBy: 0.0001)
        //messagePopUp()
    }
    
//    func teamiMessage(text: String) {
//        let message = MessageNode(message: text)
//        message.position = CGPoint(x: frame.midX, y: frame.midY)
//        addChild(message)
//    }
//    
//    func messagePopUp() {
//        if hungerFill.xScale <= 0.5 && hungerFill.xScale > 0 {
//            teamiMessage(text: "I'm hungry")
//        }
//        else if hungerFill.xScale == 0 {
//            teamiMessage(text: "I'm starving!")
//        }
//    }
}
