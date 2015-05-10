//
//  ViewController.swift
//  NewTickTackToes
//
//  Created by Kyle Brooks Robinson on 5/8/15.
//  Copyright (c) 2015 Kyle Brooks Robinson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var b1: TickTackButton!
    @IBOutlet weak var b2: TickTackButton!
    @IBOutlet weak var b3: TickTackButton!
    @IBOutlet weak var b4: TickTackButton!
    @IBOutlet weak var b5: TickTackButton!
    @IBOutlet weak var b6: TickTackButton!
    @IBOutlet weak var b7: TickTackButton!
    @IBOutlet weak var b8: TickTackButton!
    @IBOutlet weak var b9: TickTackButton!
    @IBOutlet weak var resetButtonOutlet: UIButton!
    
    
    var spaces: [[ Player? ]] = [
      
        [nil,nil,nil],
        [nil,nil,nil],
        [nil,nil,nil]

    ]
    
    var onePScore = 0
    var twoPScore = 0
    
    var isReset = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resetButtonOutlet.hidden = true
        

        
        //ASK:  Why's this need to be an Outlet?
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var playerScore1: UILabel!
    
    @IBOutlet weak var playerScore2: UILabel!
    
    @IBAction func resetButton(sender: UIButton) {
        
        endGame()
        onePScore = 0
        twoPScore = 0
        playerScore1.text = "0"
        playerScore2.text = "0"
        
        
    }
    
    @IBOutlet weak var playerTurnLabel: UILabel!
    
    
    @IBOutlet weak var playerWinLabel: UILabel!
    
    var currentPlayer: Player = .One


    @IBAction func buttonPressed(sender: TickTackButton) {
        
        if sender.player != nil { return }
        
        sender.player = currentPlayer
        sender.setNeedsDisplay()
        
        spaces [sender.row][sender.col] = currentPlayer
        
        println(spaces)

        checkForWinner()
        
        if currentPlayer == .One {
            currentPlayer == .Two
            playerTurnLabel.text = "Player Two's Turn"
        } else {
            currentPlayer = .One
            playerTurnLabel.text = "Player One's Turn"
        }
        //The below is another way to phrase the above code.
//        currentPlayer = (currentPlayer == .One) ? .Two : .One
        
//        if currentPlayer = Player.One {
//            playerTurnLabel.text = "Player One's Turn"
//        } else {
//            playerTurnLabel.text = "Player Two's Turn"
//        }
    }
    
    func endGame() {
        
        b1.player = nil
        b1.setNeedsDisplay()
        b2.player = nil
        b2.setNeedsDisplay()
        b3.player = nil
        b3.setNeedsDisplay()
        b4.player = nil
        b4.setNeedsDisplay()
        b5.player = nil
        b5.setNeedsDisplay()
        b6.player = nil
        b6.setNeedsDisplay()
        b7.player = nil
        b7.setNeedsDisplay()
        b8.player = nil
        b8.setNeedsDisplay()
        b9.player = nil
        b9.setNeedsDisplay()
        
        resetButtonOutlet.hidden = false
    }
    
        
    
    
    func checkForWinner() {

        var possibilities = [
            
            [0,0,0,1,0,2],
            [1,0,1,1,1,2],
            [2,0,2,1,2,2],
            [0,0,1,0,2,0],
            [0,1,1,1,2,1],
            [0,2,1,2,2,2],
            [0,0,1,1,2,2],
            [2,0,1,1,0,2],
            
        ]
        
        for possibility in possibilities {
            
            let firstSpot = spaces[possibility[0]][possibility[1]]
            let secondSpot = spaces[possibility[2]][possibility[3]]
            let thirdSpot = spaces[possibility[4]][possibility[5]]
            
            if firstSpot == secondSpot && secondSpot == thirdSpot {
                
                if let winner = firstSpot {
                
                println("Player \(winner.hashValue + 1) Wins.")
                    
                    if (winner.hashValue + 1) == 1 {
                        onePScore + 1
                        playerScore1.text = String(onePScore)

                    } else if (winner.hashValue + 1) == 2 {
                        twoPScore + 1
                        playerScore2.text = String(twoPScore)
                    }

                endGame()
                //NOTE:  This is where things get risky.  I'm trying to write the stalemate conditions below. In case of emergency, delete 'else.'
                }
                
//                else if spaces != nil && firstSpot != nil {
//                    
//                    playerWinLabel.text = "Stalemate!"
//                    endGame()
//                    
//                    
//                }
            
                }
            
            }
        
        
    
    
    }
    
    
    
    
}

