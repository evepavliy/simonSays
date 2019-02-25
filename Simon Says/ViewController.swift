//
//  ViewController.swift
//  Simon Says
//
//  Created by Ievgeniia Pavliuchyk on 20/02/2019.
//  Copyright © 2019 Ievgeniia Pavliuchyk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var simonLabel: UILabel!
    @IBOutlet weak var startGameLabel: UIButton!
    
    var timer  = Timer()
    var simonTimer = Timer()
    
    var timeInt = 20
    var scoreInt = 0
    var modeInt = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        simonLabel.layer.cornerRadius = 10
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestures(sender:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestures(sender:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestures(sender:)))
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swipeGestures(sender:)))
        swipeDown .direction = UISwipeGestureRecognizer.Direction.down
        self.view.addGestureRecognizer(swipeDown)
        
    }

    @IBAction func startGameAction(_ sender: Any) {
        
        if timeInt == 20 {
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true )
            
            self.simonSays()
            
            modeInt = 1
            
            startGameLabel.isEnabled = false
            startGameLabel.alpha = 0.25
            
        }
        
    
    }
    
    @objc func updateTimer() {
        
        timeInt -= 1
        timeLabel.text = String("Time : \(timeInt)")
        
        if timeInt == 0 {
            
            timer.invalidate()
            simonTimer.invalidate()
            
            simonLabel.text = "Game Over"
            
            modeInt = 0
            
            startGameLabel.isEnabled = true
            startGameLabel.alpha = 1
            
            
            
        }
    }
    
    @objc func simonSays() {
        
        let array = [ "Simon says swipe right",
                          "Simon says swipe left",
                          "Simon says swipe up",
                          "Simon says swipe down",
                          "Swipe right",
                          "Swipe left",
                          "Swipe up",
                          "Swipe down"
                        ]
        
        // count items in array and pick a random number
        let randomWord = Int(arc4random_uniform(UInt32(array.count)))
        simonLabel.text = String(array[randomWord])
        
        
        simonTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(simonSays), userInfo: nil, repeats: false)
        
    }
    
    @objc func swipeGestures(sender : UISwipeGestureRecognizer) {
        
        if modeInt == 1 {
            
            if sender.direction == UISwipeGestureRecognizer.Direction.right {
                simonTimer.invalidate() // so user won't lose point while swiping and labels got updated
                
                if simonLabel.text == "Simon says swipe right" {
                    
                    scoreInt += 1
                    scoreLabel.text = String("Score : \(scoreInt)")
                    
                    self.simonSays()
                    
                } else {
                    
                    scoreInt -= 1
                    scoreLabel.text = String("Score : \(scoreInt)")
                    
                    self.simonSays()
                    
                }
                
                
            }
            
            
            if sender.direction == UISwipeGestureRecognizer.Direction.left {
                simonTimer.invalidate() // so user won't lose point while swiping and labels got updated
                
                if simonLabel.text == "Simon says swipe left" {
                    
                    scoreInt += 1
                    scoreLabel.text = String("Score : \(scoreInt)")
                    
                    self.simonSays()
                    
                } else {
                    
                    scoreInt -= 1
                    scoreLabel.text = String("Score : \(scoreInt)")
                    
                    self.simonSays()
                    
                }
                
            }
                
                
                if sender.direction == UISwipeGestureRecognizer.Direction.up {
                    simonTimer.invalidate() // so user won't lose point while swiping and labels got updated
                    
                    if simonLabel.text == "Simon says swipe up" {
                        
                        scoreInt += 1
                        scoreLabel.text = String("Score : \(scoreInt)")
                        
                        self.simonSays()
                        
                    } else {
                        
                        scoreInt -= 1
                        scoreLabel.text = String("Score : \(scoreInt)")
                        
                        self.simonSays()
                        
                    }
                    
                }
                    
                    
                    if sender.direction == UISwipeGestureRecognizer.Direction.down {
                        simonTimer.invalidate() // so user won't lose point while swiping and labels got updated
                        
                        if simonLabel.text == "Simon says swipe down" {
                            
                            scoreInt += 1
                            scoreLabel.text = String("Score : \(scoreInt)")
                            
                            self.simonSays()
                            
                        } else {
                            
                            scoreInt -= 1
                            scoreLabel.text = String("Score : \(scoreInt)")
                            
                            self.simonSays()
                            
                        }
                
            }
        
            
        }
        
        
    }
    
}

