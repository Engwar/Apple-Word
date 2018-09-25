//
//  ViewController.swift
//  Apple Word
//
//  Created by Igor Shelginskiy on 21.09.2018.
//  Copyright © 2018 Igor Shelginskiy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //list of words for guessing
    var listOfWords = ["вишня", "апельсин", "груша", "нектарин", "слива",]
    
    // max of number of attempts
    let incorrectMovesAllowed = 7
    
    //amounts of wins and loses
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    var currentGame: Game!
    
    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet weak var correctWordLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //start of new round of game
        newRound()
    }
    
    //start of new round of game
    func newRound() {
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed, guessedLetters: [])
            enableLetterButton(true)
            updateUI()
        } else {
            enableLetterButton(false)
        }
    }
    
    // access/denied buttons
    func enableLetterButton(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
    
    //update of interface
    func updateUI() {
        //update pictures
        let imageName = "Tree \(currentGame.incorrectMovesRemaining)"
        let image = UIImage(named: imageName)
        treeImageView.image = image
        
        //update guessed word - second variant lesson 21 : time 1:20:00
        
        correctWordLabel.text = currentGame.formattedWord
        
        //update score
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        let letterString = sender.title(for: .normal)!
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
    // check for game ending
    func updateGameState() {
        if currentGame.incorrectMovesRemaining < 1 {
            totalLosses += 1
        } else if currentGame.word == currentGame.formattedWord {
            totalWins += 1
        } else {
             updateUI()
        }
       
    }

}

