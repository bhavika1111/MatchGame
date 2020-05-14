//
//  CardModel.swift
//  Match App
//
//  Created by Bhavika Patel on 8/11/19.
//  Copyright © 2019 Bhavika Patel. All rights reserved.
//

import Foundation

class CardModel {

    func getCards() -> [Card] {
        
        // Declare an array to store numbers we've already generated
        var generatedNumbersArray = [Int]()
        
        // Declare an array to store the generated cards
        var generatedCardsArray = [Card]()
        
        // Randomly generate pairs of cards
        
        while generatedNumbersArray.count < 8 {

            // Get a random number
            let randomNumber = Int.random(in: 1...13)
            
            // Make it so we only have unique pairs of cards
            // Ensure that the random number isn't one we already have
            
            if generatedNumbersArray.contains(randomNumber) == false {
                // Log the number
                print(randomNumber)
                
                // Store the number into the generatedNumbersArray
                generatedNumbersArray.append(randomNumber)
                
                // Create first card object
                let cardOne = Card()
                cardOne.imageName = "card\(randomNumber)"
                generatedCardsArray.append(cardOne)
                
                // Create second card object
                let cardTwo = Card()
                cardTwo.imageName = "card\(randomNumber)"
                generatedCardsArray.append(cardTwo)
            }
        }
        
        // Randomize the array
        
        
        for i in 0...generatedCardsArray.count - 1 {
            // Find a random index to swap with
            let randomNumber = Int.random(in: 0...8)
            
            // Swap the two cards
            let temporaryStorage = generatedCardsArray[i]
            generatedCardsArray[i] = generatedCardsArray[randomNumber]
            generatedCardsArray[randomNumber] = temporaryStorage
        }
    
        // Return the array
        return generatedCardsArray
    }
}
