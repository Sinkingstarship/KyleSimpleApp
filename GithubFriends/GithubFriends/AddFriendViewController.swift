//
//  AddFriendViewController.swift
//  GithubFriends
//
//  Created by Kyle Brooks Robinson on 5/13/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

class AddFriendViewController: UIViewController {

    @IBAction func cancelButton(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    @IBOutlet weak var friendNameField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addFriend(sender: AnyObject) {
        
        let endpoint = "https://api.github.com/users/\(friendNameField.text)"
        
        
        println(endpoint)
        
        if let friendInfo = GitHubRequest.getInfoWithEndpoint(endpoint) as? [String:AnyObject] {
            
            
            
            println(friendInfo)
            
          //  friends.insert(friendInfo, atIndex: 0)
           // tableView.reloadData()

    
    }
        
        
        
        friendNameField.text = ""
        
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
