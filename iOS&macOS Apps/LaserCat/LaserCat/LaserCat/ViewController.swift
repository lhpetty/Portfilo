//
//  ViewController.swift
//  LaserCat
//
//  Created by student on 11/29/18.
//  Copyright © 2018 student. All rights reserved.
//

import Cocoa
import SpriteKit

class ViewController: NSViewController {
    
    var Start = TitleScreen()
    var theGame = laserCats()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let Start = TitleScreen(size: view.bounds.size)
        let theGame = laserCats(size: view.bounds.size)
        
        let skView = view as! SKView
        
        skView.presentScene(Start)
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    
}
