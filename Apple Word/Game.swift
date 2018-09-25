//
//  Game.swift
//  Apple Word
//
//  Created by Igor Shelginskiy on 24.09.2018.
//  Copyright © 2018 Igor Shelginskiy. All rights reserved.
//

import Foundation

struct Game {
    // guessed word
    var word: String
    
    // amount of attempts
    var incorrectMovesRemaining: Int
    
    //list of tapped letters
    var guessedLetters: [Character]
    
    //show letters guessed
    var formattedWord: String {
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
    
    //processing tapped letter
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
      
        //check contains letter in word
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
    
    
}
