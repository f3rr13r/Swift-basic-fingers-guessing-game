//
//  ViewController.swift
//  How Many Fingers
//
//  Created by Harry Ferrier on 8/3/16.
//  Copyright © 2016 CASTOVISION LIMITED. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var userGuessTextField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    
    
    // guess function called when the 'button' is pressed
    @IBAction func guess(_ sender: AnyObject) {
        
        
        // Create a randomNumber between 0 and 5
        let numberOfFingers: Int = Int(arc4random_uniform(UInt32(6)))
        
        
        
        // If the user has entered a value into the userGuessTextField AND the value of the userGuessTextField, as an Integer value, is less than 6...
        if userGuessTextField.text != "" && Int(userGuessTextField.text!)! < 6 {
        
            // Convert that value to an integer
            var userGuess: Int = Int(userGuessTextField.text!)!
            
            // If the number that the user in putted is the same as the random number.
            if userGuess == numberOfFingers {
            
                // Display the image which has the same name as the userGuess value.
                imageView.image = UIImage(named: "\(userGuess)")
                
                // Display the resultLabel and...
                resultLabel.isHidden = false
                
                // Change it's content to inform the user that he or she was correct.
                resultLabel.text = "Correct! It was a \(userGuess)!"
                
                // Then clear the userGuessTextField
                userGuessTextField.text = ""
            
                
            // Else if the user Guess and the random number values do not match..
            } else {
            
                // display the image which is named with the same value as the random number.
                imageView.image = UIImage(named: "\(numberOfFingers)")
                
                // Display the resultLabel and..
                resultLabel.isHidden = false
                
                // Change it's contents to inform the user that he or she was incorrect, and what the number actually was.
                resultLabel.text = "Wrong! It was a \(numberOfFingers)!"
                
                // Then clear the userGuessTextField
                userGuessTextField.text = ""
                
            }
            
        
        // Else if the userGuessTextField is not empty AND/BUT the value of the userGuessTextField, converted to an Integer, is greater than 5...
        } else if userGuessTextField.text != "" && Int(userGuessTextField.text!)! > 5 {
            
            // Display the resultLabel and..
            resultLabel.isHidden = false
            
            // Change it's contents to inform the user that he or she was incorrect, and what the number actually was.
            resultLabel.text = "Enter a number between 0 and 5"
            
            // Then clear the userGuessTextField
            userGuessTextField.text = ""
          
          
        
        // If the userGuessTextField was empty when the guessButton was pressed
        } else {
            
            // Display the resultLabel and...
            resultLabel.isHidden = false
            
            // Change it's contents to tell the user that he or she needs to enter a number.
            resultLabel.text = "Please enter a number."
            
            
        }
    }
    
    
    
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Set a UITapGestureRecognizer which calls a dismiss keyboard function.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        
        // Add the GestureRecognizer to the view.
        view.addGestureRecognizer(tap)
        
        // Hide the results label.
        resultLabel.isHidden = true
        
        // Round of corner edges for cleaner look.
        button.layer.cornerRadius = 5.0
        
        
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

