//
//  ViewController.swift
//  RandomNumberGame
//
//  Created by Maarten Brijker on 30/03/16.
//  Copyright © 2016 Maarten_Brijker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var randomNumber: Int = Int(arc4random_uniform(1000) + 1)

    // initiate all links
    @IBOutlet weak var higherOrLowerLabel: UILabel!
    @IBOutlet weak var numberSubmittedLabel: UILabel!
    @IBOutlet weak var submitTextField: UITextField!
    @IBOutlet weak var youWonLabel: UILabel!
    @IBOutlet var backGround: UIView!
    @IBOutlet weak var lookingForLabel: UILabel!
    
    // This codes runs every time when taps Guess Button.
    @IBAction func guessButton(sender: AnyObject) {
        
        // Get number submitted.
        let userInput = submitTextField.text! as NSString
        let numberSubmitted: Int = Int(userInput.intValue)
        
        // Default string.
        var higherOrLower: String = "higher than"
        
        // Is solution higher or lower?
        if randomNumber == numberSubmitted {
            higherOrLower = "equal to"
        }
        else if randomNumber > numberSubmitted {
            higherOrLower = "higher than"
        }
        else {
            higherOrLower = "lower than"
        }
        
        // Inform user.
        higherOrLowerLabel.text = higherOrLower
        numberSubmittedLabel.text = "\(numberSubmitted)"
        
        // If user won hide all on screen and display user's victory.
        if higherOrLower == "equal to" {
            youWonLabel.text = "You Won!"
            youWonLabel.textColor = UIColor.whiteColor()
            higherOrLowerLabel.hidden = true
            numberSubmittedLabel.hidden = true
            lookingForLabel.hidden = true
            submitTextField.hidden = true
            self.view.backgroundColor = UIColor.blackColor()
        }
        
        // Clear text field each time user guesses.
        submitTextField.text = nil

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}