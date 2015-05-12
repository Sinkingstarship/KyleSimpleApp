//
//  priorityButton.swift
//  HighPriority
//
//  Created by Kyle Brooks Robinson on 5/11/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

@IBDesignable class priorityButton: UIButton {
    
    var selectedButton: Bool = false {
        
        didSet {
            
            setNeedsDisplay()
            
        }
        
    }
    
    override func drawRect(rect: CGRect) {
        
        var context = UIGraphicsGetCurrentContext()
        
        priorityColors[tag].set()
        
        var colorCircle = CGRectInset(rect, 1, 1)
        CGContextFillEllipseInRect(context, colorCircle)
        
    
        if selectedButton == true {
        
            var selectCircle = CGRectInset(rect, 10, 10)
            UIColor.whiteColor().set()
            CGContextSetLineWidth(context, 3)
            CGContextStrokeEllipseInRect(context, selectCircle)
            
            
        }

        
    }


}

@IBDesignable class slideButton: UIButton {
    
    override func drawRect(rect: CGRect) {
        var context = UIGraphicsGetCurrentContext()
        
        var selectCircle = CGRectInset(rect, 1, 1)
        UIColor.whiteColor().set()
        CGContextSetLineWidth(context, 1)
        CGContextStrokeEllipseInRect(context, selectCircle)
        
    }
    
}







