//
//  LoginViewController.swift
//  ParseLogin
//
//  Created by Kyle Brooks Robinson on 5/28/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit
import Parse
import Bolts

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBAction func loginButton(sender: AnyObject) {
        
        loginNow()
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginNow() {
        
        var userName = usernameField.text
        var password = passwordField.text
        
        PFUser.logInWithUsernameInBackground(userName, password: password) { (user: PFUser?, error: NSError?) -> Void in
            
            if user != nil {
                
    
                println("Successful login!")
                
            } else {
                
                println("Unsuccessful login :(")
                
            }
            
            
        }

        
        
        
        
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
