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
    var totalWins = 0
    var totalLosses = 0
    
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
        let newWord = listOfWords.removeFirst()
        
        currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMovesAllowed )
    }
    
    //update of interface
    func updateUI() {
        //update pictures
        let imageName = "Tree \(currentGame.incorrectMovesRemaining)"
        let image = UIImage(named: imageName)
        treeImageView.image = image
        
        //update score
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
    }

}

