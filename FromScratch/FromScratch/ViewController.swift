//
//  ViewController.swift
//  FromScratch
//
//  Created by Kyle Brooks Robinson on 5/7/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var box = RadView(frame: CGRectMake(100, 100, 80, 100))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        for touch in touches as! Set<UITouch> {
            
            let location = touch.locationInView(view)
            println("x = \(location.x) and y = \(location.y)")
            
            var box = RadView()
            // The order of operations is very important.  The following two things work differently if you mix them.
            view.addSubview(box)
            box.center = location
            
            box.fadeOut()
            box.rotateRandomDegrees()
        }
    }
    
        
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    

}

