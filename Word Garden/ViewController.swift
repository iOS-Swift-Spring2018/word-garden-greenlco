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
    var wordToGuess = "CODE"
    var letterGuessed = ""
    let maxNumberOfWrongGuesses = 8
    var wrongGuessesRemaining = 8
    var guessCount = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        formatUserGuessLabel()
        guessedLetterButton.isEnabled = false
        guessedLetterField.isHidden = true
    }
    
    func updateUIAfterGuess() {
        guessedLetterField.resignFirstResponder()
        guessedLetterField.text = ""
    }
    
    func formatUserGuessLabel() {
        var revealedWord = ""
        letterGuessed += guessedLetterField.text!
        
        for letter in wordToGuess {
            if letterGuessed.contains(letter) {
                revealedWord = revealedWord + " \(letter)"
            } else {
                revealedWord += " _"
            }
        }
        revealedWord.removeFirst()
        userGuessLabel.text = revealedWord
    }
    
    func guessALetter() {
        formatUserGuessLabel()
        guessCount += 1
        //decrements the wrongGuessesRemaining and shows the next flower image with one less
        //pedal
        let currentLetterGuessed = guessedLetterField.text!
        if !wordToGuess.contains(currentLetterGuessed) {
            wrongGuessesRemaining = wrongGuessesRemaining - 1
            flowerImageView.image = UIImage(named: "flower\(wrongGuessesRemaining)")
        }
        let revealedWord = userGuessLabel.text!
        //Stop game if wrongGuessesRemains = 0
        if wrongGuessesRemaining == 0 {
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessedLetterButton.isEnabled = false
            guessedCountLabel.text = "So sorry, you're all out of guesses. Try again?"
        } else if !revealedWord.contains("_") {
            //You win
            playAgainButton.isHidden = false
            guessedLetterField.isEnabled = false
            guessedLetterButton.isEnabled = false
            guessedCountLabel.text = "You've got it! It took you \(guessCount) guesses to guess the word!"
        } else {
            //Update our guess count
            let guess = ( guessCount == 1 ? "guess" : "guesses")
            guessedCountLabel.text = "You've made \(guessCount) \(guess)"
        
            
        }
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
        guessALetter()
        updateUIAfterGuess()
    }
    

    @IBAction func guessedLetterButtonPressed(_ sender: UIButton) {
        guessALetter()
        updateUIAfterGuess()
    }
    
    
    @IBAction func playAgainButtonPressed(_ sender: UIButton) {
        playAgainButton.isHidden = true
        guessedLetterField.isEnabled = true
        guessedLetterButton.isEnabled = false
        flowerImageView.image = UIImage(named: "flower8")
        wrongGuessesRemaining = maxNumberOfWrongGuesses
        letterGuessed = ""
        formatUserGuessLabel()
        guessedCountLabel.text = "You've Made 0 Guesses"
        guessCount = 0
    }
    
}

