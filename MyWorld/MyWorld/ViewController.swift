//
//  ViewController.swift
//  MyWorld
//
//  Created by Kyle Brooks Robinson on 5/21/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit
import MapKit

class MyAnnotation: MKPointAnnotation {
    
    var venueIndex: Int!

}

class ViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    
    @IBOutlet weak var myMapView: MKMapView!
    
    var lManager = CLLocationManager()
    
    var allVenues: [[String:AnyObject]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lManager.requestWhenInUseAuthorization()
        lManager.delegate = self
        
        myMapView.showsUserLocation = true
        myMapView.userTrackingMode = .Follow
        myMapView.delegate = self
        
        lManager.startUpdatingLocation()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        if let location = locations.first as? CLLocation {
            
            println("latitude \(location.coordinate.latitude) longitude \(location.coordinate.longitude)")
            
            requestVenuesWithLocation(location, completion: { (venues) -> () in
                
              //  println(venues)
                self.allVenues = venues as! [[String:AnyObject]]
                
                for (index, venue) in enumerate(venues as! [[String:AnyObject]]) {
                    
                    if let locationInfo = venue["location"] as? [String:AnyObject] {
                        
                        if let lat = locationInfo["lat"] as? Double,
                            let lng = locationInfo["lng"] as? Double {
                                
                                let coordinate = CLLocationCoordinate2DMake(lat, lng)
                                
                                let annotation = MyAnnotation()
                                
                                annotation.title = venue["name"] as? String
                                annotation.venueIndex = index
                                annotation.coordinate = coordinate
                                
                                self.myMapView.addAnnotation(annotation)
                                
                        }
                        
                        //////// New code below
                        
                        if let address = venue["address"] as? [String:AnyObject] {
                            let country = venue["country"] as? [String:AnyObject]
                            let city = venue["city"] as? [String:AnyObject]
                            let state = venue["state"] as? [String:AnyObject]
                        }
                        
                        
                        
                    }
                    
                }
                
            })
            
            lManager.stopUpdatingLocation()
            
        }
        
        
    }
    
    func requestVenuesWithLocation(location: CLLocation, completion: (venues: [AnyObject]) -> ()) {
        
        let API_URL = "https://api.foursquare.com/v2/"
        let CLIENT_ID = "R5APQ5EWCJALFQN1IFMEA4FBZUNMRZBYJBCFDMHJ5RA3KQ5Q"
        let CLIENT_SECRET = "ZLR4ILCYIWUFW2LUQQZ3HZMIOKRXI3TKHCE2LHGN3SAGWYP4"
        
        let endpoint = API_URL + "venues/search?client_id=\(CLIENT_ID)&client_secret=\(CLIENT_SECRET)&ll=\(location.coordinate.latitude),\(location.coordinate.longitude)&v=20150101"
        
        println(endpoint)
        
        if let url = NSURL(string: endpoint) {
            
            let request = NSURLRequest(URL: url)
            
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue(), completionHandler: { (response, data, error) -> Void in
                
                // data is the information that is returned
                
                if let returnedInfo = NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers, error: nil) as? [String:AnyObject] {
                    
                  //  println(returnedInfo)
                    
                    if let responseInfo = returnedInfo["response"] as? [String:AnyObject] {
                        
                        if let venuesInfo = responseInfo["venues"] as? [AnyObject] {
                            
                            completion(venues: venuesInfo)
                            
                        }
                    }
                    
                }
                
            })
        }
        
    }
    
    
    func mapView(mapView: MKMapView!, viewForAnnotation annotation: MKAnnotation!) -> MKAnnotationView! {
        
        // This line protects the blue location dot from being overridden.
        if annotation is MKUserLocation { return nil }
        
        var annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "annotation")
        
        annotationView.pinColor = MKPinAnnotationColor.Green
        annotationView.canShowCallout = true
        
        var button = UIButton.buttonWithType(UIButtonType.DetailDisclosure) as! UIButton
        annotationView.rightCalloutAccessoryView = button
        
        button.tag = (annotation as! MyAnnotation).venueIndex
        
        button.addTarget(self, action: "showMoreInfo:", forControlEvents: UIControlEvents.TouchUpInside)
        
        return annotationView
        
        
    }
    
    func showMoreInfo(sender: UIButton) {
        
        var detailVC = storyboard?.instantiateViewControllerWithIdentifier("venueVC") as! VenueDetailViewController
        
        var venue = allVenues[sender.tag]
//        println(venue)
        
        detailVC.view.backgroundColor = UIColor.whiteColor()
        
        if let stats = venue["stats"] as? [String:AnyObject] {
            
            let checkInCount = stats["checkinsCount"] as! Int
            let usersCount = stats["usersCount"] as! Int
            let tipCount = stats["tipCount"] as! Int
            let name = venue["name"] as! String
            
            detailVC.checkingCircle.setTitle("\(checkInCount)", forState: UIControlState.Normal)
            detailVC.usersCircle.setTitle("\(usersCount)", forState: UIControlState.Normal)
            detailVC.tipsCircle.setTitle("\(tipCount)", forState: UIControlState.Normal)
            
        }
        
        if let categories = venue["categories"] as? [AnyObject] {
            
            let insideCategories = categories[0]
            let category = insideCategories["name"] as! String
            let icon = insideCategories["icon"] as? [String:AnyObject] {
                
                let prefix = icon["prefix"] as! String
                let suffix = icon["suffix"] as! String
                
                
                
            }
            detailVC.categoryLabel.text = category
            
        }
            
        
        
        
        if let location = venue["location"] as? [String:AnyObject] {

            let address = location["address"] as! String
            let city = location["city"] as! String
            let state = location["state"] as! String
            let name = venue["name"] as! String
            
            detailVC.addressLabel.text = "\(address), \(city) \(state)"
            detailVC.navigationItem.title = name
            
        }
        
        if let hereNow = venue["hereNow"] as? [String:AnyObject] {
            
            let summary = hereNow["summary"] as! String
            detailVC.hereNowLabel.text = summary
        }
        
        if let
        
        
        var box1 = UIView(frame: CGRectMake(30, 70, 8, 46))
        box1.backgroundColor = UIColor.grayColor()
        detailVC.view.addSubview(box1)
        
        var box2 = UIView(frame: CGRectMake(30, 130, 8, 230))
        box2.backgroundColor = UIColor.grayColor()
        detailVC.view.addSubview(box2)
        
        var box3 = UIView(frame: CGRectMake(30, 385, 8, 60))
        box3.backgroundColor = UIColor.grayColor()
        detailVC.view.addSubview(box3)
        

        
        navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    
    
    
    
}









