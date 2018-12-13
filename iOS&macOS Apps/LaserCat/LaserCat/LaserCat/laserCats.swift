//
//  laserCats.swift
//  LaserCat
//
//  Created by student on 11/29/18.
//  Copyright © 2018 student. All rights reserved.
//

import Cocoa
import SpriteKit

class laserCats: SKScene, SKPhysicsContactDelegate
{
    var selectedNode: SKNode? = nil
    var textNode: SKLabelNode? = nil
    var score: Double = 0.0
    var currentScore: Double = 0.0
    var multiplier: Double = 1.0
    var lives: Int = 5
    
    override func didMove(to view: SKView)
    {
       
        let backgroundImage = SKTexture(imageNamed: "Space.jpg")
        let image = SKSpriteNode(texture: backgroundImage)
        image.position = CGPoint(x: size.width / 2.0, y: (size.height / 2.0))
        self.addChild(image)
        let music = SKAudioNode(fileNamed: "Tekken 7 OST Arctic Snowfall - Final Round.mp3")
        music.autoplayLooped = true
        self.addChild(music)
        physicsWorld.contactDelegate = self
        createLivesLabel()
        createHero()
        createScoreLabel()
        createMultiplierLabel()
    }
    
    func createScoreLabel()
    {
       
        let scoreNode = SKLabelNode(fontNamed: "Futura")
        scoreNode.text = "\(score)"
        scoreNode.fontSize = 30
        scoreNode.position = CGPoint(x: 0.0, y:  680.0)
        scoreNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        scoreNode.fontColor = SKColor.white
        scoreNode.name = "score"
        addChild(scoreNode)
    }
    
    func createLivesLabel()
    {
        let liveNode = SKLabelNode(fontNamed: "Futura")
        liveNode.text = "Lives: \(lives)"
        liveNode.fontSize = 30
        liveNode.position = CGPoint(x: 0.0, y:  620.0)
        liveNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        liveNode.fontColor = SKColor.white
        liveNode.name = "Lives"
        addChild(liveNode)
    }
    
    func createMultiplierLabel()
    {
        let numFormatter = NumberFormatter()
        numFormatter.maximumFractionDigits = 2
        let multiplierNode = SKLabelNode(fontNamed: "Futura")
        var multiplierString = numFormatter.string(for: multiplier)
        multiplierNode.text = "\(multiplierString!)x"
        multiplierNode.fontSize = 30
        multiplierNode.position = CGPoint(x: 0.0, y:  650.0)
        multiplierNode.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        multiplierNode.fontColor = SKColor.white
        multiplierNode.name = "multiplier"
        addChild(multiplierNode)
    }
    
    func updateScore()->Double
    {
        if let scoreLabel  = self.childNode(withName: "score") as? SKLabelNode
        {
            scoreLabel.text = "\(score)"
        }
        return score
    }
    
    func updateMultiplier()->Double
    {
        if let multiplierLabel  = self.childNode(withName: "multiplier") as? SKLabelNode
        {
            let numFormatter = NumberFormatter()
            numFormatter.maximumFractionDigits = 2
            var multiplierString = numFormatter.string(for: multiplier)
            multiplierLabel.text = "\(multiplierString!)x"
        }
        return multiplier
    }
    
    
    func updateLives()->Int
    {
        if let livesLabel  = self.childNode(withName: "Lives") as? SKLabelNode
        {
            livesLabel.text = "Lives: \(lives)"
        }
        return lives
    }
    
    func createHero()
    {
        let cat = SKTexture(imageNamed: "CatHero.png")
        let hero = SKSpriteNode(texture: cat)
        hero.position = CGPoint(x: frame.midX, y: frame.midY)
        hero.size = CGSize(width: 150, height: 150)
        hero.zRotation = 0.0
        hero.name = "Hero"
        let body = SKPhysicsBody(texture: cat, size: hero.size)
        body.isDynamic = false
        body.contactTestBitMask = 1
        body.usesPreciseCollisionDetection = true
        hero.physicsBody = body
        addChild(hero)
    }
    
    override func keyDown(with event: NSEvent)
    {
        if let hero = childNode(withName: "Hero")
        {
            if event.keyCode == 124
            {
                //right arrow
                hero.run(SKAction.moveBy(x: 30.0, y: 0, duration: 0.1))
            }
            else if event.keyCode == 123
            {
                hero.run(SKAction.moveBy(x: -30.0, y: 0, duration: 0.1))
                
            }
                
            else if event.keyCode == 126
            {
                hero.run(SKAction.moveBy(x: 0, y: 30, duration: 0.1))
                
            }
                
            else if event.keyCode == 125
            {
                hero.run(SKAction.moveBy(x: 0, y: -30, duration: 0.1))
                
            }
 
            else if event.keyCode == 13
            {
                createProjectile(point: hero.position, key: 13)
            }
            else if event.keyCode == 0
            {
                createProjectile(point: hero.position, key: 0)
            }
            else if event.keyCode == 1
            {
                createProjectile(point: hero.position, key: 1)
            }
            else if event.keyCode == 2
            {
                createProjectile(point: hero.position, key: 2)
            }
            
        }
    }
    
    func createProjectile(point: CGPoint, key: Int)
    {
        let projectile = SKShapeNode(rectOf: CGSize(width: 50.0, height: 20.0), cornerRadius: 10)
        projectile.fillColor = SKColor.red
        projectile.name = "projectile"
        projectile.position = point
        let body = SKPhysicsBody(rectangleOf:CGSize(width: 50.0, height: 20.0))
        body.contactTestBitMask = 1
        
        if(key == 13)
        {
            body.velocity = CGVector(dx: 0.0, dy: 500.0)
        }
        else if(key == 0)
        {
            body.velocity = CGVector(dx: -500.0, dy: 0.0)
        }
        else if(key == 1)
        {
            body.velocity = CGVector(dx: 0.0, dy: -500.0)
        }
        else if(key == 2)
        {
            body.velocity = CGVector(dx: 500.0, dy: 0.0)
        }
        
        // body.usesPreciseCollisionDetection = true
        body.affectedByGravity = false
        body.isDynamic = true
        projectile.physicsBody = body
        addChild(projectile)
    }
    
    func createRat(point: CGPoint)
    {
        let rat = SKTexture(imageNamed: "Rat.png")
        let ratObject = SKSpriteNode(texture: rat)
        ratObject.position = point
        ratObject.name = "Rat"
        let body = SKPhysicsBody(rectangleOf: ratObject.size)
        body.contactTestBitMask = 1
        body.velocity = CGVector(dx: 500.0, dy: 200.0)
        body.affectedByGravity = false
        body.isDynamic = true
        ratObject.physicsBody = body
        addChild(ratObject)
    }
    
    func createMouse(point: CGPoint)
    {
        let mice = SKTexture(imageNamed: "Mice.png")
        let miceObject = SKSpriteNode(texture: mice)
        miceObject.position = point
        miceObject.name = "Mice"
        let body = SKPhysicsBody(rectangleOf: miceObject.size)
        body.contactTestBitMask = 1
        body.velocity = CGVector(dx: -500.0, dy: 200.0)
        body.affectedByGravity = false
        body.isDynamic = true
        miceObject.physicsBody = body
        addChild(miceObject)
    }
    
    
    override func update(_ currentTime: TimeInterval)
    {
        let rand = Double.random(in: 0.0...1.0)
        if rand < 0.05
        {
            let randomX = CGFloat.random(in: 0.0...frame.width)
            
            let randomY = CGFloat.random(in: 0.0...frame.height)
            
            let point = CGPoint(x: randomX, y: randomY)
            createRat(point: point)
            
        }
        
        if rand < 0.06
        {
            let randomX = CGFloat.random(in: 0.0...frame.width)
            
            let randomY = CGFloat.random(in: 0.0...frame.height)
            
            let point = CGPoint(x: randomX, y: randomY)

            createMouse(point: point)
        }
        
        
    }
    
    
    func didBegin(_ contact: SKPhysicsContact)
    {
        guard let nodeA = contact.bodyA.node, let nodeB = contact.bodyB.node else
        {
            return
        }
        
        guard let nameA = nodeA.name, let nameB = nodeB.name else
        {
            return
        }
        
        if nameA == "projectile" && nameB == "Rat"
        {
            nodeB.removeFromParent()
            nodeA.removeFromParent()
            multiplier += 0.3
            score += 10 * multiplier
        }
            
        else if nameA == "Hero" && nameB == "Rat"
        {
            nodeB.removeFromParent()
            lives -= 1
            
        }
            
        else if nameA == "Hero" && nameB == "Mice"
        {
            nodeB.removeFromParent()
            lives -= 1
        }
            
        else if nameA == "projectile" && nameB == "Mice"
        {
            nodeA.removeFromParent()
            nodeB.removeFromParent()
            multiplier += 0.5
            score += 20 * multiplier
        }
        
      
        updateLives()
        updateMultiplier()
        updateScore()
        
        
        if score >= 1500
        {
            let toVictoryScreen = VictoryScreen(size: size.self)
            let transition = SKTransition.flipVertical(withDuration: 1.0)
            self.view?.presentScene(toVictoryScreen, transition: transition)
        }
        
        else if lives == 0
        {
            let gameOver = GameOver(size: size.self)
            let transition = SKTransition.flipVertical(withDuration: 1.0)
            self.view?.presentScene(gameOver, transition: transition)
        }
    }
}
