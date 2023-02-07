//
//  VatNumberKit_NetherlandsChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import Foundation

extension VatNumberKit {
    
    struct NetherlandsChecksumValidator {
        
        static func validate(vatNumber: VatNumber) -> Bool {
            // Number needs to be 12 characters long
            guard vatNumber.number.count == 12 else { return false }
            
            // The 10th character needs to be a B
            guard vatNumber.number[9] == "B" else { return false }
            
            return validateCommercial(vatNumber: vatNumber.number) || validateSoleProprietor(vatNumber: vatNumber.number)
        }
        
        private static func validateCommercial(vatNumber: String) -> Bool {
            // The weighted sum is calculated on the first 8 digits
            let firstEightDigits = String(vatNumber.prefix(8))
            
            guard firstEightDigits.count == 8 else { return false }
            
            // The check digit is the digit on the 8 position
            guard let checkDigit = Int(String(vatNumber[8])) else { return false }
            
            // Calculate the weighted sum
            let weightedSum = ChecksumHelper.calculateWeightedSum(vatNumber: firstEightDigits, weights: [9, 8, 7, 6, 5, 4, 3, 2])
            
            let remainder = weightedSum % 11
            let checkValue = remainder > 9 ? 0 : remainder
            
            return checkDigit == checkValue
        }
        
        private static func validateSoleProprietor(vatNumber: String) -> Bool {
            let characterLookup = [
                "0" : "0",
                "1" : "1",
                "2" : "2",
                "3" : "3",
                "4" : "4",
                "5" : "5",
                "6" : "6",
                "7" : "7",
                "8" : "8",
                "9" : "9",
                "A" : "10",
                "B" : "11",
                "C" : "12",
                "D" : "13",
                "E" : "14",
                "F" : "15",
                "G" : "16",
                "H" : "17",
                "I" : "18",
                "J" : "19",
                "K" : "20",
                "L" : "21",
                "M" : "22",
                "N" : "23",
                "O" : "24",
                "P" : "25",
                "Q" : "26",
                "R" : "27",
                "S" : "28",
                "T" : "29",
                "U" : "30",
                "V" : "31",
                "W" : "32",
                "X" : "33",
                "Y" : "34",
                "Z" : "35",
                "+" : "36",
                "*" : "37",
            ]
            
            // Take every character in the original VAT number and map it to a corresponding string value.
            let newNumber = vatNumber.reduce("2321", { partialResult, character in
                guard let convertedValue = characterLookup[String(character)] else { return partialResult }
                
                var updatedValue = partialResult
                updatedValue += convertedValue
                
                return updatedValue
            })
            
            // Convert this string number to an integer and calculate the modulo
            guard let number = Int(newNumber) else { return false }
            
            return (number % 97) == 1
        }
        
    }
    
}
