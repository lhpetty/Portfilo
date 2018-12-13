//
//  VictoryScreen.swift
//  LaserCat
//
//  Created by student on 12/3/18.
//  Copyright © 2018 student. All rights reserved.
//

import Foundation
import Cocoa
import SpriteKit

class VictoryScreen: SKScene
{
    var game: laserCats!
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor.blue
        
        let textNode = SKLabelNode(fontNamed: "Futura")
        textNode.text = "Victory!"
        textNode.fontSize = 70
        textNode.position = CGPoint(x: size.width / 2.0, y:  size.height / 2.0)
        textNode.fontColor = SKColor.black
        textNode.name = "victory"
        addChild(textNode)
        
        let playButton = SKLabelNode(fontNamed: "Futura")
        playButton.text = "Click to Play Again!"
        playButton.fontSize = 70
        playButton.position = CGPoint(x: size.width / 2.0, y:  size.height / 2.0 - 100.0)
        playButton.fontColor = SKColor.black
        playButton.name = "retry"
        addChild(playButton)
        
    }
    
    override func mouseDown(with event: NSEvent) {
        let game = laserCats(size: size.self)
        let transition = SKTransition.flipVertical(withDuration: 1.0)
        self.view?.presentScene(game, transition: transition)
        
    }
}
