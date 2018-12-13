//
//  ViewController.swift
//  Picross
//
//  Created by student on 4/11/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit
import SpriteKit

class ViewController: UIViewController
{
    var grid: Grid!
  
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a ni
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let spriteView = view as! SKView
        
        let sz = CGSize(width: view.frame.width, height: view.frame.height)
        
        grid = Grid(size: sz)
        grid.controller = self
        
        spriteView.presentScene(grid)
    }


}

