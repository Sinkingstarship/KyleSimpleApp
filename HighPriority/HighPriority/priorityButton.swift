//
//  priorityButton.swift
//  HighPriority
//
//  Created by Kyle Brooks Robinson on 5/11/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

@IBDesignable class priorityButton: UIButton {
    var selectedButton: Bool = false
    
    override func drawRect(rect: CGRect) {
        var context = UIGraphicsGetCurrentContext()
        
        
        priorityColors[tag].set()
        
        var colorCircle = CGRectInset(rect, 1, 1)
        CGContextFillEllipseInRect(context, colorCircle)
        
//        if selectedButton = true {
//        
//        var selectCircle = CGRectInset(rect, 5, 5)
//        CGContextSetLineWidth(context, 1)
//        CGContextStrokeEllipseInRect(context, insetRect)
        
            
       // }

        
        
    }


}
