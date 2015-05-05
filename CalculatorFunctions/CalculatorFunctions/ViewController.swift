//
//  ViewController.swift
//  CalculatorFunctions
//
//  Created by Kyle Brooks Robinson on 5/5/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var firstPress = ""
    var secondPress = ""
    var currentOperation = ""

    @IBOutlet weak var outputLabel: UILabel!
    
    
    @IBAction func buttonPress(sender: UIButton) {
        println("You just pressed the \(sender.currentTitle!).")
        
        let words = sender.currentTitle!
        
        if currentOperation.isEmpty {
            firstPress += words
        } else {
            secondPress += words
        }
    
    
    
    }
//
//    @IBAction func evilerButtonPress(sender: UIButton) {
//        println("You just pressed the \(sender.currentTitle!).")
//    }
//    
//    @IBAction func evilestButtonPress(sender: UIButton) {
//        println("You just pressed the \(sender.currentTitle!).")
//    }
    
//    @IBAction func operatorPress(sender: UIButton) {
//        let operation = sender.currentTitle!
//        
//        if operation != "Return" {
//            currentOperation = operation
//        
//        } else {
//            
//            switch operation {
//                
//            case "Loves":
//                let value = "\(firstPress) loves \(secondPress)"
//                outputLabel.text = value
//            case "Hates":
//                let value = "\(firstPress) hates \(secondPress)"
//                outputLabel.text = value
//            default:
//                println("Default")
//            }
//            
//        }
    
      
        
        
        
    }
    
    


// case "+":

// let value = firstNumber.toInt()! + secondNumber.toInt()!
// println("\(firstNumber) \(currentOperation) \(secondNumber) = \(value)"

