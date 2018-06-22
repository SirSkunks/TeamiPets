//
//  BarNode.swift
//  TeamiPets
//
//  Created by Josh Dankerl on 2018-06-21.
//  Copyright © 2018 VGMOBA. All rights reserved.
//

import SpriteKit

class BarNode: SKSpriteNode, EventListenerNode {
    
    
    func didMoveToScene(){
        print("Bars added to scene")
    }
    
    func decreaseBar(decreaseBy amount: CGFloat) {
        xScale -= amount
        if xScale <= 0 {
            xScale = 0
        }
    }
    
    func increaseBar(increaseBy amount: CGFloat){
        xScale += amount
        if xScale >= 1{
            xScale = 1
        }
    }
}


