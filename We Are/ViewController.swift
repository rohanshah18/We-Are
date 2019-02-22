//
//  ViewController.swift
//  We Are
//
//  Created by John Hannan on 8/23/18.
//  Copyright © 2018 John Hannan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var weAreLabel: UILabel!
    @IBOutlet weak var pennStateLabel: UILabel!
    @IBOutlet weak var cheerButton: UIButton!
    
    enum CheerState {
        case cheering, resetting
    }
    
    var currentRound : Int = 0
    let numberOfRounds = 6
    let resetRound = 8
    var cheerState  = CheerState.cheering
    
    override func viewDidLoad() {
        super.viewDidLoad()
        weAreLabel.isHidden = true
        pennStateLabel.isHidden = true
    }

   
    @IBAction func doCheer(_ sender: UIButton) {
        if cheerState == .resetting {
            currentRound = 0
            cheerState = .cheering
            weAreLabel.isHidden = true
            pennStateLabel.isHidden = true
            weAreLabel.text = "We Are"
            pennStateLabel.text = "Penn State"
            cheerButton.setTitle("Cheer", for: .normal)
            return
        }
        
        let isEvenRound = currentRound % 2 == 0
        weAreLabel.isHidden = !isEvenRound
        pennStateLabel.isHidden = isEvenRound
        
        if currentRound == numberOfRounds {
            weAreLabel.text = "Thank You"
            pennStateLabel.text = "You're Welcome"
        }
        
        currentRound += 1
        
        if currentRound == resetRound {
            cheerState = .resetting
            cheerButton.setTitle("Reset", for: .normal)
        }

    }
    

}

