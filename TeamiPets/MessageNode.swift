//
//  MessageNode.swift
//  TeamiPets
//
//  Created by Josh Dankerl on 2018-06-22.
//  Copyright © 2018 VGMOBA. All rights reserved.
//

import SpriteKit

class MessageNode: SKLabelNode {
    convenience init(message: String){
        self.init(fontNamed: "AvenirNext-Regular")
        
        text = message
        fontSize = 150.0
        fontColor = SKColor.black
        zPosition = 100
        
        let front = SKLabelNode(fontNamed: "AvenirNext-Regular")
        front.text = message
        front.fontSize = 150.0
        front.fontColor = SKColor.white
        front.position = CGPoint(x: -2, y: -2)
        addChild(front)
    }
}
