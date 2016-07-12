//
//  ViewController.swift
//  TicTacticsPro
//
//  Created by keivn c on 7/11/16.
//  Copyright © 2016 me. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1
    // 1 == O's, 2 == X's
    
    var gameState = [ 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombo = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [1,4,8], [2,4,6]]
    
    var gameActive = true
    
    @IBOutlet weak var button: UIButton!
    
    @IBOutlet weak var gameOver: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    
    @IBAction func playAgain(sender: AnyObject) {
        
        gameState = [ 0, 0, 0, 0, 0, 0, 0, 0, 0]
        activePlayer = 1
        gameActive = true
        gameOver.hidden = true
        gameOver.center = CGPointMake(gameOver.center.x - 500, gameOver.center.y)
        playAgainButton.hidden = true
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 500, playAgainButton.center.y)
        
        var buttonToClear: UIButton
        
        for i in 0 ..< 9 {
            buttonToClear = view.viewWithTag(i) as! UIButton
            buttonToClear.setImage(nil, forState: .Normal)
        }
    }
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        if (gameState[sender.tag] == 0 && gameActive == true) {
            
            gameState[sender.tag] = activePlayer
            
            if activePlayer == 1 {
                
                sender.setImage(UIImage(named: "nought.png"), forState: .Normal)
                
                activePlayer = 2
                
            } else {
                
                sender.setImage(UIImage(named: "cross.png"), forState: .Normal)
                
                activePlayer = 1
            }
            
            for combo in winningCombo {
                
                if (gameState[combo[0]] != 0 && gameState[combo[0]] == gameState[combo[1]] && gameState[combo[1]] == gameState[combo[2]]) {
                    
                    gameActive = false
                    
                    if gameState[combo[0]] == 1 {
                        
                        gameOver.text = "O's win!"
                        
                    } else {
                        
                        gameOver.text = "X's win!"
                    }
                    
                    endGame()
                }
            }
            
            if gameActive == true {
            
                gameActive = false
                
                for buttonState in gameState {
                    if buttonState == 0 {
                        gameActive = true
                    }
                }
                
                if gameActive == false {
                    gameOver.text = "It's a draw!"
                    endGame()
                }
            }
        }
    }
    
    
    func endGame() {
        gameOver.hidden = false
        playAgainButton.hidden = false
        
        UIView.animateWithDuration(0.5, animations: {
            self.gameOver.center = CGPointMake(self.gameOver.center.x + 500, self.gameOver.center.y)
            self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 500, self.playAgainButton.center.y)
        })
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gameOver.hidden = true
        gameOver.center = CGPointMake(gameOver.center.x - 500, gameOver.center.y)
        
        playAgainButton.hidden = true
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 500, playAgainButton.center.y)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

