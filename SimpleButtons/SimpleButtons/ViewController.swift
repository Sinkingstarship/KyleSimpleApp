//
//  ViewController.swift
//  SimpleButtons
//
//  Created by Kyle Brooks Robinson on 5/4/15.
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
    
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    var firstPress = ""
    var secondPress = ""
    var currentOperation = ""

    
    @IBOutlet weak var calcResult: UILabel!

    
    
 
        
    
    @IBAction func numberButtonPress(sender: UIButton) {
        println("You just pressed the \(sender.currentTitle!) button.")
        
        let runningNumber = sender.currentTitle!
        
        if currentOperation.isEmpty {
            firstPress += runningNumber
            calcResult.text = firstPress
        } else {
            secondPress += runningNumber
            calcResult.text = secondPress
            }
        
        }
    
    
    @IBAction func operationButtonPress(sender: UIButton) {
        println("You just pressed the \(sender.currentTitle!) button.")
        
        currentOperation = sender.currentTitle!
    
    }
        
    
    @IBAction func equalPress(sender: UIButton) {
        println("You just pressed the \(sender.currentTitle!) button.")
        
        
//        let dFirstPress = Double(firstPress.toInt()!)
//        let dSecondPress = Double(secondPress.toInt()!)
        
        let dFirstPress = firstPress.doubleValue()
        let dSecondPress = secondPress.doubleValue()
        
        switch currentOperation {
        case "+":
            let value = dFirstPress + dSecondPress
            calcResult.text = "\(value)"
        case "−":
            let value = dFirstPress - dSecondPress
            calcResult.text = "\(value)"
        case "×":
            let value = dFirstPress * dSecondPress
            calcResult.text = "\(value)"
        case "÷":
            let value = dFirstPress / dSecondPress
            calcResult.text = "\(value)"
        case "%":
            let value = dFirstPress % dSecondPress
        default:
            calcResult.text = "0"
            
        }
        
    }
    
    
    @IBAction func clearPress(sender: UIButton) {
        println("You just pressed the \(sender.currentTitle!) button.")
        calcResult.text = "0"
        firstPress = ""
        secondPress = ""
        currentOperation = ""
    
    }
    
    @IBAction func switchingPress(sender: UIButton) {
//        var switchValue = (calcResult.text!.doubleValue()! * -1)
        
        if currentOperation.isEmpty {
            firstPress = "\(firstPress.doubleValue() * -1)"
            calcResult.text = firstPress

        } else {
            secondPress = "\(secondPress.doubleValue() * -1)"
            calcResult.text = secondPress

        }
        
            
            
    }
    
    
    @IBAction func decimalPress(sender: UIButton) {
        println("You just pressed the \(sender.currentTitle!) button.")

        if currentOperation.isEmpty {
            firstPress += "."
            calcResult.text = firstPress

        } else {
            secondPress += "."
            calcResult.text = secondPress

        }
    }
        
       
}
    
    
        


