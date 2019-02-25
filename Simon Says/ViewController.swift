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
        
    }

    @IBAction func startGameAction(_ sender: Any) {
        
        if timeInt == 20 {
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true )
            
        }
        
    
    }
    
    @objc func updateTimer() {
        
        timeInt -= 1
        timeLabel.text = String("Time : \(timeInt)")
        
        if timeInt == 0 {
            
            timer.invalidate()
            
            
        }
    }
    
    func simonSays() {
        
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
    }
    
}

