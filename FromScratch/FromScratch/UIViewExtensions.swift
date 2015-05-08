//
//  UIViewExtensions.swift
//  FromScratch
//
//  Created by Kyle Brooks Robinson on 5/7/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
  
    
    func fadeIn() {
        // Move our fade out code from earlier
        UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.alpha = 1.0 // Instead of a specific instance of, say, birdTypeLabel, we simply set [thisInstance] (ie, self)'s alpha
            }, completion: nil)
    }
    
    func fadeOut() {
        UIView.animateWithDuration(1.0, delay: 1.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.alpha = 0.0
            }, completion: nil)
    }
    
    func rotateRandomDegrees(duration: CFTimeInterval = 1.0, completionDelegate: AnyObject? = nil) {
        let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
        rotateAnimation.fromValue = 0.0
        rotateAnimation.toValue = CGFloat(drand48())
        rotateAnimation.duration = duration
        
        if let delegate: AnyObject = completionDelegate {
            rotateAnimation.delegate = delegate
        }
        self.layer.addAnimation(rotateAnimation, forKey: nil)
    }
    
//    func randomShape() {
//        let myCircle = self.frame.size.width / 2
//        let myRoundedSquare = self.frame.size.width / 3
//        let mySquare 
//        
//        
//        
//        
//    }
}