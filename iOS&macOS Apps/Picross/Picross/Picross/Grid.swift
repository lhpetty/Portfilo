//
//  Grid.swift
//  Picross
//
//  Created by student on 4/11/18.
//  Copyright © 2018 student. All rights reserved.
//

//scene size 

//two seperate enums one if block has been flipped and other being if black or white
//cross, black, white nodes
//subclass of sksprite node, that holds the positions of the porbities, assign the nodes their position 

/*
 vertical sknodes:
 6
 4 4
 5 5
 6 6
 6 6
 6 6
 5 5
 3 3
 1 8 1
 1 1 1 1
 1 1 1 1 1 1
 2 1 1 1 1 2
 3 3
 1 2 1
 1 1
 10
 2 2 2 2
 1 3 3 1
 1 4 4 1
 */
/*
 horizontal sknodes:
 0 0 8 2 2 1 3 5 5 1 1 5 5 3 1 2 2 8 0 0
       2 1 2 2 1 2 1 1 2 1 2 2 1 2
       5 6 5 1 6 1 1 1 1 6 1 5 6 5
           6 6 4 1 1 4 6 6
*/
import Foundation
import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

class Grid: SKScene
{
    var controller: ViewController!
    //var gridTable: [[SKSpriteNode] = []
    var contentCreated = false
    var count = 0
    
    //possible states for a block on the grid
    enum blockState
    {
        case toBeBlack
        case toBeCross
    }
    
    //creates the content for the grid
    override func didMove(to view: SKView) {
        let cameraNode = SKCameraNode()
        
        cameraNode.position = CGPoint(x: (scene?.size.width)! / 2, y: (scene?.size.height)! / 2)
        scene?.addChild(cameraNode)
        scene?.camera = cameraNode
        let zoomIn = SKAction.scale(by: 0.85, duration: 1)
        cameraNode.run(zoomIn)
        if contentCreated == false
            
        {
            backgroundColor = UIColor.white
            createGrid()
            createLabels()
            contentCreated = true
           // print("\(contentCreated)")
        }
        else
        {
            //print("\(contentCreated)")
        }
    }
    
    //creates table
    func createGrid()->(table: [[SKSpriteNode]], position: [[CGPoint]])
    {
        let gridTexture = SKTexture(imageNamed: "whiteNodeFinal.png")
        let grid1 = SKSpriteNode(texture: gridTexture)
        //var gridTable: [[SKSpriteNode]] = [[SKSpriteNode]]()
        //var gridTable = [[SKSpriteNode]](repeating: [SKSpriteNode](repeating: grid1, count: 20), count: 20)
        var gridTable =  [[SKSpriteNode]](repeating: [SKSpriteNode](repeating: grid1, count: 20), count: 20)
        var gridPositions = [[CGPoint]](repeating: [CGPoint](repeating: CGPoint(x: 0, y: 0), count: 20), count: 20)
        
        for i in 0...19
        {
            for j in 0...19
            {
                let gridTexture = SKTexture(imageNamed: "whiteNodeFinal.png")
                let grid = SKSpriteNode(texture: gridTexture)
                grid.size = CGSize(width: 15.0, height: 15.0)
                grid.position = CGPoint(x: i * 15 + 80, y: j * 15 + 150)
                
                
                gridPositions[i][j] = grid.position
                grid.name = "grid\(i)"
                
                //gridTable = [[SKSpriteNode]](repeating: [SKSpriteNode](repeating: grid, count: 20), count: 20)
                //gridTable[i][j] = grid
                //grid.removeFromParent()
                addChild(grid)
                //grid.zPosition = 5.0
                gridTable[i][j] = grid
                //grid.removeFromParent();
                //addChild(gridTable[i][j])
                //print("\(gridPositions[i][j])")
                
                
                
            }
        }
        return (gridTable, gridPositions)
    }
    
    //creates the labels for the grid, both the veritcal and the horizontal labels
    func createLabels()
    {
        let verticalX = 60
        let verticalY = 430
        
        let labelSize = CGFloat(size.width / 40.0)
        let labelVeriticalRow1 = SKLabelNode(fontNamed: "Futura-CondensedExtraBold")
        labelVeriticalRow1.text = "6"
        labelVeriticalRow1.fontSize = labelSize
        labelVeriticalRow1.position = CGPoint(x: verticalX, y: verticalY)
        labelVeriticalRow1.fontColor = UIColor.black
        addChild(labelVeriticalRow1)
        
      
        let labelVeriticalRow2 = SKLabelNode(fontNamed: "Futura-CondensedExtraBold")
        labelVeriticalRow2.text = "4 4"
        labelVeriticalRow2.fontSize = labelSize
        labelVeriticalRow2.position = CGPoint(x: verticalX - 2, y: verticalY - 15)
        labelVeriticalRow2.fontColor = UIColor.black
        addChild(labelVeriticalRow2)
        
        
        let labelVeriticalRow3 = SKLabelNode(fontNamed: "Futura-CondensedExtraBold")
        labelVeriticalRow3.text = "5 5"
        labelVeriticalRow3.fontSize = labelSize
        labelVeriticalRow3.position = CGPoint(x: verticalX - 2, y: verticalY - 30)
        labelVeriticalRow3.fontColor = UIColor.black
        addChild(labelVeriticalRow3)
        
        
        let labelVeriticalRow4 = SKLabelNode(fontNamed: "Futura-CondensedExtraBold")
        labelVeriticalRow4.text = "6 6"
        labelVeriticalRow4.fontSize = labelSize
        labelVeriticalRow4.position = CGPoint(x: verticalX - 2, y: verticalY - 45)
        labelVeriticalRow4.fontColor = UIColor.black
        addChild(labelVeriticalRow4)
        
        let labelVeriticalRow5 = SKLabelNode(fontNamed: "Futura-CondensedExtraBold")
        labelVeriticalRow5.text = "6 6"
        labelVeriticalRow5.fontSize = labelSize
        labelVeriticalRow5.position = CGPoint(x: verticalX - 2, y: verticalY - 60)
        labelVeriticalRow5.fontColor = UIColor.black
        addChild(labelVeriticalRow5)
        
        let labelVeriticalRow6 = SKLabelNode(fontNamed: "Futura-CondensedExtraBold")
        labelVeriticalRow6.text = "6 6"
        labelVeriticalRow6.fontSize = labelSize
        labelVeriticalRow6.position = CGPoint(x: verticalX - 2, y: verticalY - 75)
        labelVeriticalRow6.fontColor = UIColor.black
        addChild(labelVeriticalRow6)
        
        let labelVeriticalRow7 = SKLabelNode(fontNamed: "Futura-CondensedExtraBold")
        labelVeriticalRow7.text = "5 5"
        labelVeriticalRow7.fontSize = labelSize
        labelVeriticalRow7.position = CGPoint(x: verticalX - 2, y: verticalY - 90)
        labelVeriticalRow7.fontColor = UIColor.black
        addChild(labelVeriticalRow7)
        
        let labelVeriticalRow8 = SKLabelNode(fontNamed: "Futura-CondensedExtraBold")
        labelVeriticalRow8.text = "3 3"
        labelVeriticalRow8.fontSize = labelSize
        labelVeriticalRow8.position = CGPoint(x: verticalX - 2, y: verticalY - 105)
        labelVeriticalRow8.fontColor = UIColor.black
        addChild(labelVeriticalRow8)
        
        let labelVeriticalRow9 = SKLabelNode(fontNamed: "Futura-CondensedExtraBold")
        labelVeriticalRow9.text = "1 8 1"
        labelVeriticalRow9.fontSize = labelSize
        labelVeriticalRow9.position = CGPoint(x: verticalX - 4, y: verticalY - 120)
        labelVeriticalRow9.fontColor = UIColor.black
        addChild(labelVeriticalRow9)
        
        let labelVeriticalRow10 = SKLabelNode(fontNamed: "Futura-CondensedExtraBold")
        labelVeriticalRow10.text = "1 1 1 1"
        labelVeriticalRow10.fontSize = labelSize
        labelVeriticalRow10.position = CGPoint(x: verticalX - 6, y: verticalY - 135)
        labelVeriticalRow10.fontColor = UIColor.black
        addChild(labelVeriticalRow10)
        
        let labelVeriticalRow11 = SKLabelNode(fontNamed:"Futura-CondensedExtraBold")
        labelVeriticalRow11.text = "1 1 1 1 1 1"
        labelVeriticalRow11.fontSize = labelSize
        labelVeriticalRow11.position = CGPoint(x: verticalX - 17, y: verticalY - 150)
        labelVeriticalRow11.fontColor = UIColor.black
        addChild(labelVeriticalRow11)
        
        let labelVeriticalRow12 = SKLabelNode(fontNamed: "Futura-CondensedExtraBold")
        labelVeriticalRow12.text = "2 1 1 1 1 2"
        labelVeriticalRow12.fontSize = labelSize
        labelVeriticalRow12.position = CGPoint(x: verticalX - 17, y: verticalY - 165)
        labelVeriticalRow12.fontColor = UIColor.black
        addChild(labelVeriticalRow12)
        
        let labelVeriticalRow13 = SKLabelNode(fontNamed: "Futura-CondensedExtraBold")
        labelVeriticalRow13.text = "3 3"
        labelVeriticalRow13.fontSize = labelSize
        labelVeriticalRow13.position = CGPoint(x: verticalX - 2, y: verticalY - 180)
        labelVeriticalRow13.fontColor = UIColor.black
        addChild(labelVeriticalRow13)
        
        let labelVeriticalRow14 = SKLabelNode(fontNamed: "Futura-CondensedExtraBold")
        labelVeriticalRow14.text = "1 2 1"
        labelVeriticalRow14.fontSize = labelSize
        labelVeriticalRow14.position = CGPoint(x: verticalX - 4, y: verticalY - 195)
        labelVeriticalRow14.fontColor = UIColor.black
        addChild(labelVeriticalRow14)
        
        let labelVeriticalRow15 = SKLabelNode(fontNamed: "Futura-CondensedExtraBold")
        labelVeriticalRow15.text = "1 1"
        labelVeriticalRow15.fontSize = labelSize
        labelVeriticalRow15.position = CGPoint(x: verticalX - 2, y: verticalY - 210)
        labelVeriticalRow15.fontColor = UIColor.black
        addChild(labelVeriticalRow15)
        
        let labelVeriticalRow16 = SKLabelNode(fontNamed: "Futura-CondensedExtraBold")
        labelVeriticalRow16.text = "10"
        labelVeriticalRow16.fontSize = labelSize
        labelVeriticalRow16.position = CGPoint(x: verticalX, y: verticalY - 225)
        labelVeriticalRow16.fontColor = UIColor.black
        addChild(labelVeriticalRow16)
        
        let labelVeriticalRow17 = SKLabelNode(fontNamed: "Futura-CondensedExtraBold")
        labelVeriticalRow17.text = "2 2 2 2"
        labelVeriticalRow17.fontSize = labelSize
        labelVeriticalRow17.position = CGPoint(x: verticalX - 10, y: verticalY - 240)
        labelVeriticalRow17.fontColor = UIColor.black
        addChild(labelVeriticalRow17)
        
        let labelVeriticalRow18 = SKLabelNode(fontNamed: "Futura-CondensedExtraBold")
        labelVeriticalRow18.text = "1 3 3 1"
        labelVeriticalRow18.fontSize = labelSize
        labelVeriticalRow18.position = CGPoint(x: verticalX - 10, y: verticalY - 255)
        labelVeriticalRow18.fontColor = UIColor.black
        addChild(labelVeriticalRow18)
        
        let labelVeriticalRow19 = SKLabelNode(fontNamed: "Futura-CondensedExtraBold")
        labelVeriticalRow19.text = "1 3 3 1"
        labelVeriticalRow19.fontSize = labelSize
        labelVeriticalRow19.position = CGPoint(x: verticalX - 10, y: verticalY - 270)
        labelVeriticalRow19.fontColor = UIColor.black
        addChild(labelVeriticalRow19)
        
        let labelVeriticalRow20 = SKLabelNode(fontNamed: "Futura-CondensedExtraBold")
        labelVeriticalRow20.text = "1 4 4 1"
        labelVeriticalRow20.fontSize = labelSize
        labelVeriticalRow20.position = CGPoint(x: verticalX - 10, y: verticalY - 285)
        labelVeriticalRow20.fontColor = UIColor.black
        addChild(labelVeriticalRow20)
        
        let labelHorizontialRow1 = SKLabelNode(fontNamed: "Futura-CondensedExtraBold")
        labelHorizontialRow1.text = "8   2   2   1   3   5   5   1   1   5   5   3   1  2  2  8"
        labelHorizontialRow1.fontSize = labelSize
        labelHorizontialRow1.position = CGPoint(x: 223, y: 450)
        labelHorizontialRow1.fontColor = UIColor.black
        addChild(labelHorizontialRow1)
        
        let labelHorizontialRow2 = SKLabelNode(fontNamed: "Futura-CondensedExtraBold")
        labelHorizontialRow2.text = "   2   1   2   2   1   2   1   1   2   1   2   2  1  2  "
        labelHorizontialRow2.fontSize = labelSize
        labelHorizontialRow2.position = CGPoint(x: 225, y: 460)
        labelHorizontialRow2.fontColor = UIColor.black
        addChild(labelHorizontialRow2)
        
        let labelHorizontialRow3 = SKLabelNode(fontNamed: "Futura-CondensedExtraBold")
        labelHorizontialRow3.text = "   5   6   5   1   6   1   1   1   1   6   1   5  6  5  "
        labelHorizontialRow3.fontSize = labelSize
        labelHorizontialRow3.position = CGPoint(x: 225, y: 470)
        labelHorizontialRow3.fontColor = UIColor.black
        addChild(labelHorizontialRow3)
        
        let labelHorizontialRow4 = SKLabelNode(fontNamed: "Futura-CondensedExtraBold")
        labelHorizontialRow4.text = "          6   6         4   1   1   4        6   6      "
        labelHorizontialRow4.fontSize = labelSize
        labelHorizontialRow4.position = CGPoint(x: 227, y: 480)
        labelHorizontialRow4.fontColor = UIColor.black
        addChild(labelHorizontialRow4)
    }
    
  
    //enables the user to interact with the puzzle
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
       
        
        let blackNodeTexture = SKTexture(imageNamed: "blackNodeFinal2.png")
        
     
        let gridValues = createGrid()
        var gridTable: [[SKSpriteNode]] = gridValues.table
        var gridPositions: [[CGPoint]] = gridValues.position
        // print("\(gridPositions[19][19])")
        print("\(gridTable[19][19].position)")
    
        let changeToBlack = SKAction.setTexture(blackNodeTexture)
        
        
        
        let crossNode = SKTexture(imageNamed: "crossNode.png")
        let changeToCross = SKAction.setTexture(crossNode)
    
        if let touch = touches.first
        {
            let location = touch.location(in: self)
            let list = nodes(at: location)
            print("\(location)")
            //print("\(list)")
            print("grid = \(gridTable[19][0].position)")
           
				if list[0].position == gridTable[19][0].position
				{
					gridTable[19][0].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[0][1].position
				{
					gridTable[0][1].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[0][2].position
				{
					gridTable[0][2].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[0][3].position
				{
					gridTable[0][3].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[0][4].position
				{
					gridTable[0][4].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[0][5].position
				{
					gridTable[0][5].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[0][6].position
				{
					gridTable[0][6].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[0][7].position
				{
					gridTable[0][7].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[0][8].position
				{
					gridTable[0][8].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[0][9].position
				{
					gridTable[0][9].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[0][10].position
				{
					gridTable[0][10].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[0][11].position
				{
					gridTable[0][11].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[0][12].position
				{
					gridTable[0][12].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[0][13].position
				{
					gridTable[0][13].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[0][14].position
				{
					gridTable[0][14].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[0][15].position
				{
					gridTable[0][15].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[0][16].position
				{
					gridTable[0][16].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[0][17].position
				{
					gridTable[0][17].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[0][18].position
				{
					gridTable[0][18].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[0][19].position
				{
					gridTable[0][19].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[1][0].position
				{
					gridTable[1][0].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[1][1].position
				{
					gridTable[1][1].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[1][2].position
				{
					gridTable[1][2].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[1][3].position
				{
					gridTable[1][3].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[1][4].position
				{
					gridTable[1][4].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[1][5].position
				{
					gridTable[1][5].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[1][6].position
				{
					gridTable[1][6].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[1][7].position
				{
					gridTable[1][7].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[1][8].position
				{
					gridTable[1][8].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[1][9].position
				{
					gridTable[1][9].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[1][10].position
				{
					gridTable[1][10].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[1][11].position
				{
					gridTable[1][11].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[1][12].position
				{
					gridTable[1][12].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[1][13].position
				{
					gridTable[1][13].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[1][14].position
				{
					gridTable[1][14].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[1][15].position
				{
					gridTable[1][15].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[1][16].position
				{
					gridTable[1][16].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[1][17].position
				{
					gridTable[1][17].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[1][18].position
				{
					gridTable[1][18].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[1][19].position
				{
					gridTable[1][19].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[2][0].position
				{
					gridTable[2][0].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[2][1].position
				{
					gridTable[2][1].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[2][2].position
				{
					gridTable[2][2].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[2][3].position
				{
					gridTable[2][3].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[2][4].position
				{
					gridTable[2][4].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[2][5].position
				{
					gridTable[2][5].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[2][6].position
				{
					gridTable[2][6].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[2][7].position
				{
					gridTable[2][7].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[2][8].position
				{
					gridTable[2][8].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[2][9].position
				{
					gridTable[2][9].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[2][10].position
				{
					gridTable[2][10].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[2][11].position
				{
					gridTable[2][11].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[2][12].position
				{
					gridTable[2][12].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[2][13].position
				{
					gridTable[2][13].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[2][14].position
				{
					gridTable[2][14].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[2][15].position
				{
					gridTable[2][15].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[2][16].position
				{
					gridTable[2][16].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[2][17].position
				{
					gridTable[2][17].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[2][18].position
				{
					gridTable[2][18].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[2][19].position
				{
					gridTable[2][19].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[3][0].position
				{
					gridTable[3][0].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[3][1].position
				{
					gridTable[3][1].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[3][2].position
				{
					gridTable[3][2].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[3][3].position
				{
					gridTable[3][3].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[3][4].position
				{
					gridTable[3][4].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[3][5].position
				{
					gridTable[3][5].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[3][6].position
				{
					gridTable[3][6].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[3][7].position
				{
					gridTable[3][7].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[3][8].position
				{
					gridTable[3][8].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[3][9].position
				{
					gridTable[3][9].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[3][10].position
				{
					gridTable[3][10].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[3][11].position
				{
					gridTable[3][11].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[3][12].position
				{
					gridTable[3][12].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[3][13].position
				{
					gridTable[3][13].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[3][14].position
				{
					gridTable[3][14].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[3][15].position
				{
					gridTable[3][15].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[3][16].position
				{
					gridTable[3][16].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[3][17].position
				{
					gridTable[3][17].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[3][18].position
				{
					gridTable[3][18].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[3][19].position
				{
					gridTable[3][19].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[4][0].position
				{
					gridTable[4][0].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[4][1].position
				{
					gridTable[4][1].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[4][2].position
				{
					gridTable[4][2].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[4][3].position
				{
					gridTable[4][3].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[4][4].position
				{
					gridTable[4][4].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[4][5].position
				{
					gridTable[4][5].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[4][6].position
				{
					gridTable[4][6].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[4][7].position
				{
					gridTable[4][7].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[4][8].position
				{
					gridTable[4][8].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[4][9].position
				{
					gridTable[4][9].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[4][10].position
				{
					gridTable[4][10].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[4][11].position
				{
					gridTable[4][11].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[4][12].position
				{
					gridTable[4][12].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[4][13].position
				{
					gridTable[4][13].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[4][14].position
				{
					gridTable[4][14].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[4][15].position
				{
					gridTable[4][15].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[4][16].position
				{
					gridTable[4][16].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[4][17].position
				{
					gridTable[4][17].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[4][18].position
				{
					gridTable[4][18].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[4][19].position
				{
					gridTable[4][19].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[5][0].position
				{
					gridTable[5][0].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[5][1].position
				{
					gridTable[5][1].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[5][2].position
				{
					gridTable[5][2].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[5][3].position
				{
					gridTable[5][3].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[5][4].position
				{
					gridTable[5][4].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[5][5].position
				{
					gridTable[5][5].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[5][6].position
				{
					gridTable[5][6].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[5][7].position
				{
					gridTable[5][7].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[5][8].position
				{
					gridTable[5][8].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[5][9].position
				{
					gridTable[5][9].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[5][10].position
				{
					gridTable[5][10].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[5][11].position
				{
					gridTable[5][11].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[5][12].position
				{
					gridTable[5][12].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[5][13].position
				{
					gridTable[5][13].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[5][14].position
				{
					gridTable[5][14].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[5][15].position
				{
					gridTable[5][15].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[5][16].position
				{
					gridTable[5][16].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[5][17].position
				{
					gridTable[5][17].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[5][18].position
				{
					gridTable[5][18].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[5][19].position
				{
					gridTable[5][19].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[6][0].position
				{
					gridTable[6][0].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[6][1].position
				{
					gridTable[6][1].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[6][2].position
				{
					gridTable[6][2].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[6][3].position
				{
					gridTable[6][3].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[6][4].position
				{
					gridTable[6][4].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[6][5].position
				{
					gridTable[6][5].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[6][6].position
				{
					gridTable[6][6].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[6][7].position
				{
					gridTable[6][7].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[6][8].position
				{
					gridTable[6][8].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[6][9].position
				{
					gridTable[6][9].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[6][10].position
				{
					gridTable[6][10].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[6][11].position
				{
					gridTable[6][11].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[6][12].position
				{
					gridTable[6][12].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[6][13].position
				{
					gridTable[6][13].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[6][14].position
				{
					gridTable[6][14].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[6][15].position
				{
					gridTable[6][15].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[6][16].position
				{
					gridTable[6][16].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[6][17].position
				{
					gridTable[6][17].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[6][18].position
				{
					gridTable[6][18].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[6][19].position
				{
					gridTable[6][19].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[7][0].position
				{
					gridTable[7][0].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[7][1].position
				{
					gridTable[7][1].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[7][2].position
				{
					gridTable[7][2].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[7][3].position
				{
					gridTable[7][3].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[7][4].position
				{
					gridTable[7][4].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[7][5].position
				{
					gridTable[7][5].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[7][6].position
				{
					gridTable[7][6].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[7][7].position
				{
					gridTable[7][7].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[7][8].position
				{
					gridTable[7][8].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[7][9].position
				{
					gridTable[7][9].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[7][10].position
				{
					gridTable[7][10].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[7][11].position
				{
					gridTable[7][11].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[7][12].position
				{
					gridTable[7][12].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[7][13].position
				{
					gridTable[7][13].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[7][14].position
				{
					gridTable[7][14].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[7][15].position
				{
					gridTable[7][15].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[7][16].position
				{
					gridTable[7][16].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[7][17].position
				{
					gridTable[7][17].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[7][18].position
				{
					gridTable[7][18].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[7][19].position
				{
					gridTable[7][19].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[8][0].position
				{
					gridTable[8][0].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[8][1].position
				{
					gridTable[8][1].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[8][2].position
				{
					gridTable[8][2].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[8][3].position
				{
					gridTable[8][3].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[8][4].position
				{
					gridTable[8][4].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[8][5].position
				{
					gridTable[8][5].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[8][6].position
				{
					gridTable[8][6].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[8][7].position
				{
					gridTable[8][7].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[8][8].position
				{
					gridTable[8][8].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[8][9].position
				{
					gridTable[8][9].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[8][10].position
				{
					gridTable[8][10].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[8][11].position
				{
					gridTable[8][11].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[8][12].position
				{
					gridTable[8][12].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[8][13].position
				{
					gridTable[8][13].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[8][14].position
				{
					gridTable[8][14].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[8][15].position
				{
					gridTable[8][15].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[8][16].position
				{
					gridTable[8][16].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[8][17].position
				{
					gridTable[8][17].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[8][18].position
				{
					gridTable[8][18].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[8][19].position
				{
					gridTable[8][19].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[9][0].position
				{
					gridTable[9][0].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[9][1].position
				{
					gridTable[9][1].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[9][2].position
				{
					gridTable[9][2].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[9][3].position
				{
					gridTable[9][3].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[9][4].position
				{
					gridTable[9][4].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[9][5].position
				{
					gridTable[9][5].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[9][6].position
				{
					gridTable[9][6].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[9][7].position
				{
					gridTable[9][7].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[9][8].position
				{
					gridTable[9][8].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[9][9].position
				{
					gridTable[9][9].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[9][10].position
				{
					gridTable[9][10].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[9][11].position
				{
					gridTable[9][11].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[9][12].position
				{
					gridTable[9][12].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[9][13].position
				{
					gridTable[9][13].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[9][14].position
				{
					gridTable[9][14].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[9][15].position
				{
					gridTable[9][15].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[9][16].position
				{
					gridTable[9][16].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[9][17].position
				{
					gridTable[9][17].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[9][18].position
				{
					gridTable[9][18].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[9][19].position
				{
					gridTable[9][19].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[10][0].position
				{
					gridTable[10][0].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[10][1].position
				{
					gridTable[10][1].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[10][2].position
				{
					gridTable[10][2].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[10][3].position
				{
					gridTable[10][3].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[10][4].position
				{
					gridTable[10][4].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[10][5].position
				{
					gridTable[10][5].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[10][6].position
				{
					gridTable[10][6].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[10][7].position
				{
					gridTable[10][7].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[10][8].position
				{
					gridTable[10][8].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[10][9].position
				{
					gridTable[10][9].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[10][10].position
				{
					gridTable[10][10].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[10][11].position
				{
					gridTable[10][11].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[10][12].position
				{
					gridTable[10][12].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[10][13].position
				{
					gridTable[10][13].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[10][14].position
				{
					gridTable[10][14].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[10][15].position
				{
					gridTable[10][15].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[10][16].position
				{
					gridTable[10][16].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[10][17].position
				{
					gridTable[10][17].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[10][18].position
				{
					gridTable[10][18].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[10][19].position
				{
					gridTable[10][19].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[11][0].position
				{
					gridTable[11][0].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[11][1].position
				{
					gridTable[11][1].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[11][2].position
				{
					gridTable[11][2].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[11][3].position
				{
					gridTable[11][3].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[11][4].position
				{
					gridTable[11][4].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[11][5].position
				{
					gridTable[11][5].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[11][6].position
				{
					gridTable[11][6].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[11][7].position
				{
					gridTable[11][7].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[11][8].position
				{
					gridTable[11][8].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[11][9].position
				{
					gridTable[11][9].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[11][10].position
				{
					gridTable[11][10].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[11][11].position
				{
					gridTable[11][11].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[11][12].position
				{
					gridTable[11][12].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[11][13].position
				{
					gridTable[11][13].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[11][14].position
				{
					gridTable[11][14].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[11][15].position
				{
					gridTable[11][15].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[11][16].position
				{
					gridTable[11][16].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[11][17].position
				{
					gridTable[11][17].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[11][18].position
				{
					gridTable[11][18].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[11][19].position
				{
					gridTable[11][19].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[12][0].position
				{
					gridTable[12][0].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[12][1].position
				{
					gridTable[12][1].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[12][2].position
				{
					gridTable[12][2].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[12][3].position
				{
					gridTable[12][3].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[12][4].position
				{
					gridTable[12][4].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[12][5].position
				{
					gridTable[12][5].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[12][6].position
				{
					gridTable[12][6].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[12][7].position
				{
					gridTable[12][7].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[12][8].position
				{
					gridTable[12][8].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[12][9].position
				{
					gridTable[12][9].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[12][10].position
				{
					gridTable[12][10].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[12][11].position
				{
					gridTable[12][11].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[12][12].position
				{
					gridTable[12][12].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[12][13].position
				{
					gridTable[12][13].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[12][14].position
				{
					gridTable[12][14].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[12][15].position
				{
					gridTable[12][15].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[12][16].position
				{
					gridTable[12][16].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[12][17].position
				{
					gridTable[12][17].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[12][18].position
				{
					gridTable[12][18].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[12][19].position
				{
					gridTable[12][19].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[13][0].position
				{
					gridTable[13][0].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[13][1].position
				{
					gridTable[13][1].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[13][2].position
				{
					gridTable[13][2].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[13][3].position
				{
					gridTable[13][3].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[13][4].position
				{
					gridTable[13][4].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[13][5].position
				{
					gridTable[13][5].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[13][6].position
				{
					gridTable[13][6].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[13][7].position
				{
					gridTable[13][7].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[13][8].position
				{
					gridTable[13][8].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[13][9].position
				{
					gridTable[13][9].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[13][10].position
				{
					gridTable[13][10].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[13][11].position
				{
					gridTable[13][11].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[13][12].position
				{
					gridTable[13][12].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[13][13].position
				{
					gridTable[13][13].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[13][14].position
				{
					gridTable[13][14].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[13][15].position
				{
					gridTable[13][15].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[13][16].position
				{
					gridTable[13][16].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[13][17].position
				{
					gridTable[13][17].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[13][18].position
				{
					gridTable[13][18].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[13][19].position
				{
					gridTable[13][19].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[14][0].position
				{
					gridTable[14][0].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[14][1].position
				{
					gridTable[14][1].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[14][2].position
				{
					gridTable[14][2].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[14][3].position
				{
					gridTable[14][3].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[14][4].position
				{
					gridTable[14][4].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[14][5].position
				{
					gridTable[14][5].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[14][6].position
				{
					gridTable[14][6].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[14][7].position
				{
					gridTable[14][7].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[14][8].position
				{
					gridTable[14][8].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[14][9].position
				{
					gridTable[14][9].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[14][10].position
				{
					gridTable[14][10].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[14][11].position
				{
					gridTable[14][11].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[14][12].position
				{
					gridTable[14][12].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[14][13].position
				{
					gridTable[14][13].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[14][14].position
				{
					gridTable[14][14].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[14][15].position
				{
					gridTable[14][15].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[14][16].position
				{
					gridTable[14][16].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[14][17].position
				{
					gridTable[14][17].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[14][18].position
				{
					gridTable[14][18].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[14][19].position
				{
					gridTable[14][19].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[15][0].position
				{
					gridTable[15][0].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[15][1].position
				{
					gridTable[15][1].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[15][2].position
				{
					gridTable[15][2].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[15][3].position
				{
					gridTable[15][3].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[15][4].position
				{
					gridTable[15][4].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[15][5].position
				{
					gridTable[15][5].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[15][6].position
				{
					gridTable[15][6].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[15][7].position
				{
					gridTable[15][7].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[15][8].position
				{
					gridTable[15][8].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[15][9].position
				{
					gridTable[15][9].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[15][10].position
				{
					gridTable[15][10].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[15][11].position
				{
					gridTable[15][11].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[15][12].position
				{
					gridTable[15][12].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[15][13].position
				{
					gridTable[15][13].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[15][14].position
				{
					gridTable[15][14].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[15][15].position
				{
					gridTable[15][15].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[15][16].position
				{
					gridTable[15][16].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[15][17].position
				{
					gridTable[15][17].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[15][18].position
				{
					gridTable[15][18].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[15][19].position
				{
					gridTable[15][19].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[16][0].position
				{
					gridTable[16][0].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[16][1].position
				{
					gridTable[16][1].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[16][2].position
				{
					gridTable[16][2].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[16][3].position
				{
					gridTable[16][3].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[16][4].position
				{
					gridTable[16][4].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[16][5].position
				{
					gridTable[16][5].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[16][6].position
				{
					gridTable[16][6].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[16][7].position
				{
					gridTable[16][7].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[16][8].position
				{
					gridTable[16][8].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[16][9].position
				{
					gridTable[16][9].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[16][10].position
				{
					gridTable[16][10].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[16][11].position
				{
					gridTable[16][11].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[16][12].position
				{
					gridTable[16][12].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[16][13].position
				{
					gridTable[16][13].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[16][14].position
				{
					gridTable[16][14].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[16][15].position
				{
					gridTable[16][15].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[16][16].position
				{
					gridTable[16][16].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[16][17].position
				{
					gridTable[16][17].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[16][18].position
				{
					gridTable[16][18].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[16][19].position
				{
					gridTable[16][19].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[17][0].position
				{
					gridTable[17][0].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[17][1].position
				{
					gridTable[17][1].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[17][2].position
				{
					gridTable[17][2].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[17][3].position
				{
					gridTable[17][3].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[17][4].position
				{
					gridTable[17][4].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[17][5].position
				{
					gridTable[17][5].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[17][6].position
				{
					gridTable[17][6].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[17][7].position
				{
					gridTable[17][7].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[17][8].position
				{
					gridTable[17][8].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[17][9].position
				{
					gridTable[17][9].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[17][10].position
				{
					gridTable[17][10].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[17][11].position
				{
					gridTable[17][11].run(changeToBlack)
					return
				}


				else if list[0].position == gridTable[17][12].position
				{
					gridTable[17][12].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[17][13].position
				{
					gridTable[17][13].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[17][14].position
				{
					gridTable[17][14].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[17][15].position
				{
					gridTable[17][15].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[17][16].position
				{
					gridTable[17][16].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[17][17].position
				{
					gridTable[17][17].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[17][18].position
				{
					gridTable[17][18].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[17][19].position
				{
					gridTable[17][19].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[18][0].position
				{
					gridTable[18][0].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[18][1].position
				{
					gridTable[18][1].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[18][2].position
				{
					gridTable[18][2].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[18][3].position
				{
					gridTable[18][3].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[18][4].position
				{
					gridTable[18][4].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[18][5].position
				{
					gridTable[18][5].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[18][6].position
				{
					gridTable[18][6].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[18][7].position
				{
					gridTable[18][7].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[18][8].position
				{
					gridTable[18][8].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[18][9].position
				{
					gridTable[18][9].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[18][10].position
				{
					gridTable[18][10].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[18][11].position
				{
					gridTable[18][11].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[18][12].position
				{
					gridTable[18][12].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[18][13].position
				{
					gridTable[18][13].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[18][14].position
				{
					gridTable[18][14].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[18][15].position
				{
					gridTable[18][15].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[18][16].position
				{
					gridTable[18][16].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[18][17].position
				{
					gridTable[18][17].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[18][18].position
				{
					gridTable[18][18].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[18][19].position
				{
					gridTable[18][19].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[19][0].position
				{
					gridTable[19][0].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[19][1].position
				{
					gridTable[19][1].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[19][2].position
				{
					gridTable[19][2].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[19][3].position
				{
					gridTable[19][3].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[19][4].position
				{
					gridTable[19][4].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[19][5].position
				{
					gridTable[19][5].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[19][6].position
				{
					gridTable[19][6].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[19][7].position
				{
					gridTable[19][7].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[19][8].position
				{
					gridTable[19][8].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[19][9].position
				{
					gridTable[19][9].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[19][10].position
				{
					gridTable[19][10].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[19][11].position
				{
					gridTable[19][11].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[19][12].position
				{
					gridTable[19][12].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[19][13].position
				{
					gridTable[19][13].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[19][14].position
				{
					gridTable[19][14].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[19][15].position
				{
					gridTable[19][15].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[19][16].position
				{
					gridTable[19][16].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[19][17].position
				{
					gridTable[19][17].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[19][18].position
				{
					gridTable[19][18].run(changeToCross)
					return
				}


				else if list[0].position == gridTable[19][19].position
				{
					gridTable[19][19].run(changeToCross)
					return
				}
            
            /*let gesture = UIPinchGestureRecognizer(target: self, action: <#T##Selector?#>)
            if UIPinchGestureRecognizer.state == .began || UIPinchGestureRecognizer.state == .changed
            {
                let cameraNode = SKCameraNode()
                
                cameraNode.position = CGPoint(x: (scene?.size.width)! / 2, y: (scene?.size.height)! / 2)
                scene?.addChild(cameraNode)
                scene?.camera = cameraNode
                let zoom = SKAction.scale(by: UIPinchGestureRecognizer.scale, duration: 1)
                cameraNode.run(zoom)
            }*/
                    
            }
            
        }
    }

