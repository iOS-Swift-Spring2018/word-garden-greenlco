//
//  ViewController.swift
//  Word Garden
//
//  Created by Connor Greenleaf on 2/4/18.
//  Copyright © 2018 Connor Greenleaf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var userGuessLabel: UILabel!
    @IBOutlet weak var guessedLetterField: UITextField!
    @IBOutlet weak var guessedLetterButton: UIButton!
    @IBOutlet weak var guessedCountLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var flowerImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guessedLetterButton.isEnabled = false
        guessedLetterField.isHidden = true
    }
    
    func updateUIAfterGuess() {
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }
    
    @IBAction func guessedLetterFieldChanged(_ sender: UITextField){
        if let letterGuessed = guessedLetterField.text?.last {
            guessedLetterField.text = "\(letterGuessed)"
            guessedLetterButton.isEnabled = true
        } else {
            // disable the button if I don't have a single character in the guessedLetterField
            guessedLetterButton.isEnabled = false
        }
    }
    
    @IBAction func doneKeyPressed(_ sender: UITextField) {
        updateUIAfterGuess()
    }
    

    @IBAction func guessedLetterButtonPressed(_ sender: UIButton) {
    }
    
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
    }
    
}

