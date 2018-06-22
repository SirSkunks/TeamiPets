//
//  GameViewController.swift
//  TeamiPets
//
//  Created by Josh Dankerl on 2018-06-12.
//  Copyright © 2018 VGMOBA. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    let scene = SKScene(fileNamed: "GameScene") as? GameScene
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if (scene != nil) {
                // Set the scale mode to scale to fit the window
                scene?.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }

    }
    
    @IBAction func feed(_ sender: Any) {
        print("Time to Feed!")
        scene?.hungerFill.increaseBar(increaseBy: 0.05)
        scene?.happyFill.increaseBar(increaseBy: 0.01)
        scene?.cleanFill.decreaseBar(decreaseBy: 0.03)
        scene?.sleepFill.decreaseBar(decreaseBy: 0.03)
    }
    @IBAction func toys(_ sender: Any) {
        print("Choose a toy!")
    }
    @IBAction func store(_ sender: Any) {
        print("Let's buy something!")
    }
    @IBAction func sleep(_ sender: Any) {
        print("Time to Sleep!")
        scene?.sleepFill.increaseBar(increaseBy: 1.0)
        scene?.happyFill.increaseBar(increaseBy: 0.05)
    }
    @IBAction func clean(_ sender: Any) {
        print("Time to Clean!")
        scene?.happyFill.increaseBar(increaseBy: 0.05)
        scene?.cleanFill.increaseBar(increaseBy: 1.0)
    }
    @IBAction func play(_ sender: Any) {
        print("Time to Play!")
        scene?.happyFill.increaseBar(increaseBy: 0.05)
        scene?.cleanFill.decreaseBar(decreaseBy: 0.05)
        scene?.sleepFill.decreaseBar(decreaseBy: 0.05)
        scene?.hungerFill.decreaseBar(decreaseBy: 0.05)
    }
    override var shouldAutorotate: Bool {
        return false
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
