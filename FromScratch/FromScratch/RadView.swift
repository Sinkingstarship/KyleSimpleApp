//
//  RadView.swift
//  FromScratch
//
//  Created by Kyle Brooks Robinson on 5/7/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

class RadView: UIView {
    
    
    func randomColor() -> UIColor{
        
        var randomRed:CGFloat = CGFloat(drand48())
        var randomGreen:CGFloat = CGFloat(drand48())
        var randomBlue:CGFloat = CGFloat(drand48())
        var randomAlpha:CGFloat = CGFloat(drand48())
        return UIColor(red: randomRed, green: randomGreen, blue: randomBlue, alpha: randomAlpha)
        
    }
    
    override func didMoveToWindow() {
        
        var myRandomColor = self.randomColor()
        

        backgroundColor = myRandomColor
        
        var randomNum = arc4random_uniform(100)
        var randomNum2 = arc4random_uniform(100)
        frame.size.width = CGFloat(randomNum)
        frame.size.height = CGFloat(randomNum)
        
        
        var threeShapes = self.layer.cornerRadius
        
        // threeShapes = self.frame.size.width / (arc4random_uniform(5) + 1)
        
        
        // Square:
        // self.layer.cornerRadius = 1
        
        // Rounded Square:
        //self.layer.cornerRadius = self.frame.size.width / 5
        
        
        //Circle:
        // self.layer.cornerRadius = self.frame.size.width / 2
        
        
    }

}

