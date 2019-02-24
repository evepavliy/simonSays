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
    }
    
}

