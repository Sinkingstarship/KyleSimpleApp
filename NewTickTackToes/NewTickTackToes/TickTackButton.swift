//
//  TickTackButton.swift
//  NewTickTackToes
//
//  Created by Kyle Brooks Robinson on 5/8/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

enum Player {
    case One
    case Two
}

//The below prefix to class is really important!
@IBDesignable class outerTickTackCircle: UILabel {
    
    @IBInspectable var row: Int = 0
    @IBInspectable var col: Int = 0
    
    
    //The rect argument below is the bounds.
    override func drawRect(rect: CGRect) {
        
        var context = UIGraphicsGetCurrentContext()
        
        UIColor.cyanColor().set()
        // Outer thin circle, not filled in
        var insetRect = CGRectInset(rect, 1, 1)
        CGContextSetLineWidth(context, 1)
        CGContextStrokeEllipseInRect(context, insetRect)
        
        }
    

}

@IBDesignable class TickTackButton: UIButton {
    
    @IBInspectable var row: Int = 0
    @IBInspectable var col: Int = 0
    
    var player: Player?
    
    
    //The rect argument below is the bounds.
    override func drawRect(rect: CGRect) {
        
        var context = UIGraphicsGetCurrentContext()
        
        
        if let playerUnwrapped = player {
            
            // Inner small circle, filled in
            UIColor.orangeColor().set()
            
            if playerUnwrapped == Player.Two {
                
                UIColor.greenColor().set()
            }
            
            var smallCircleRect = CGRectInset(rect, 1, 1)
            CGContextFillEllipseInRect(context, smallCircleRect)
            
        }
    }
    
    
}
