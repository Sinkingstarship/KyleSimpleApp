//
//  ViewController.swift
//  Favorites
//
//  Created by Kyle Brooks Robinson on 5/28/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var myFavorites: [PFObject] = []

    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var favoriteTextField: UITextField!
    @IBOutlet weak var favoritesTableView: UITableView!
    @IBAction func addFavorite(sender: AnyObject) {
        
        let newFavorite = PFObject(className: "Favorite")
        
        newFavorite["name"] = favoriteTextField.text
        newFavorite["user"] = PFUser.currentUser()
        
        newFavorite.saveInBackground()
        
        favoriteTextField.text = ""
        
        myFavorites.append(newFavorite)
        
       
        
        favoritesTableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       
        
        
        
        favoritesTableView.delegate = self
        favoritesTableView.dataSource = self
        
        purpleButton.layer.cornerRadius = 5
        
        
        let query = PFQuery(className: "Favorite")
        
        query.orderByDescending("createdAt")
        
        
        if let user = PFUser.currentUser() {
            
            query.whereKey("user", equalTo:user)
            
        }
        
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            self.myFavorites = objects as! [PFObject]
            self.favoritesTableView.reloadData()
        }
        
        
        
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return myFavorites.count
        
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("favoriteCell", forIndexPath: indexPath) as! UITableViewCell
        
        cell.textLabel?.text = myFavorites[indexPath.row]["name"] as? String
        
        return cell
    
    

    }

}
