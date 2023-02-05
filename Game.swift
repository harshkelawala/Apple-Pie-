//
//  Game.swift
//  Applie pie (Homework)
//
//  Created by Abhay Pramod on 07/01/23.
//

import Foundation

struct Game{
    var word : String
    var incorrectMovesLeft : Int
    var guessedLetters : [Character]
    
    mutating func playerGuessed(letter : Character){
        guessedLetters.append(letter)
        
        if !word.contains(letter){
            incorrectMovesLeft -= 1
        }
    }
    
    var formattedWord : String{
        var guessedWord = ""
        for letter in word{
            if guessedLetters.contains(letter){
                guessedWord += "\(letter)"
            }
            else{
                guessedWord += "_"
            }
        }
        
        return guessedWord
    }

}

