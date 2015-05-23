//
//  VenueDetailViewController.swift
//  MyWorld
//
//  Created by Kyle Brooks Robinson on 5/22/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

class VenueDetailViewController: UIViewController {

    @IBOutlet weak var usersCircle: UIButton!
    @IBOutlet weak var checkingCircle: UIButton!
    @IBOutlet weak var tipsCircle: UIButton!
    @IBOutlet weak var iconView: UIView!
    
    
    
    var venueInfo: [String:AnyObject]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        usersCircle.layer.cornerRadius = 35
        checkingCircle.layer.cornerRadius = 35
        tipsCircle.layer.cornerRadius = 35
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
