//
//  ButtonView.swift
//  TickTackToes
//
//  Created by Kyle Brooks Robinson on 5/8/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

class ButtonView: UIView {
    
        override func didMoveToWindow() {
            
            backgroundColor = UIColor.redColor()
            
            frame.size.width = 100
            frame.size.height = 100
            
            self.layer.cornerRadius = self.frame.size.width / 2
            
            
        }
        
}
