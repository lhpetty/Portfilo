//
//  TitleScreen.swift
//  LaserCat
//
//  Created by student on 11/29/18.
//  Copyright © 2018 student. All rights reserved.
//

import Foundation
import Cocoa
import SpriteKit

class TitleScreen: SKScene
{
    var game: laserCats!
    override func didMove(to view: SKView) {
        
        backgroundColor = SKColor.white
        
        let textNode = SKLabelNode(fontNamed: "Futura")
        textNode.text = "Laser Cat!"
        textNode.fontSize = 70
        textNode.position = CGPoint(x: size.width / 2.0, y:  size.height / 2.0)
        textNode.fontColor = SKColor.black
        textNode.name = "intro"
        addChild(textNode)
        
        let playButton = SKLabelNode(fontNamed: "Futura")
        playButton.text = "Click to Play!"
        playButton.fontSize = 70
        playButton.position = CGPoint(x: size.width / 2.0, y:  size.height / 2.0 - 100.0)
        playButton.fontColor = SKColor.black
        playButton.name = "play"
        addChild(playButton)
        
        
    }
    
    override func mouseDown(with event: NSEvent) {
        let game = laserCats(size: size.self)
        let transition = SKTransition.flipVertical(withDuration: 1.0)
        self.view?.presentScene(game, transition: transition)
        
    }
}

