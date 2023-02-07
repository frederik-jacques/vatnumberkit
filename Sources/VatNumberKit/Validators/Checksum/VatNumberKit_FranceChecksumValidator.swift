//
//  VatNumberKit_FranceChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 06/02/2023.
//

import Foundation

extension VatNumberKit {
    
    struct FranceChecksumValidator {
        
        // The valid characters for the first two characters of the VAT number (O and I are missing)
        private static let validCharacters = "0123456789ABCDEFGHJKLMNPQRSTUVWXYZ"
        
        static func validate(vatNumber: VatNumber) -> Bool {
            // Length has to be 11
            guard vatNumber.number.count == 11 else { return false }
            
            // Check if the first & second character is in the list of the valid characters
            let firstCharacter = String(vatNumber.number[0])
            let secondCharacter = String(vatNumber.number[1])
            
            guard validCharacters.contains(firstCharacter), validCharacters.contains(secondCharacter) else {
                return false
            }
            
            // France has an old and a new type of VAT number
            // Old type: first 2 characters are digits
            if Int(firstCharacter) != nil && Int(secondCharacter) != nil {
                return validateOldVatNumberStyle(vatNumber: vatNumber.number)
            }
            // New type: first two characters are a digit and a letter (or vice versa)
            else {
                return validateNewVatNumberStyle(vatNumber: vatNumber.number)
            }
        }
        
        private static func validateOldVatNumberStyle(vatNumber: String) -> Bool {
            // The check digit is the first two digits of the number
            guard let checkDigit = Int(String(vatNumber.prefix(2))) else { return false }
            
            // Take the last 9 digits and append "12"
            guard let checksum = Int(String(vatNumber.suffix(9)) + "12") else { return false }
            
            // Calculate modulo 97
            let remainder = checksum % 97
            
            // If remainder equals the check digit, it's valid
            return remainder == checkDigit
        }
        
        private static func validateNewVatNumberStyle(vatNumber: String) -> Bool {
            // Setup the multiplier & subtractor value based if the first character is numeric.
            let firstCharacter = String(vatNumber[0])
            let secondCharacter = String(vatNumber[1])
            
            let isFirstCharacterADigit = Int(firstCharacter) != nil
                        
            let multiplier: Int = isFirstCharacterADigit ? 24 : 34
            let subtractor: Int = isFirstCharacterADigit ? 10 : 100
            
            let characterToNumberMapping = validCharacters
                .enumerated()
                .compactMap { element in
                    return [String(element.element): element.offset]
                }
                .flatMap { $0 }
            

            let lookupDictionary = Dictionary(characterToNumberMapping, uniquingKeysWith: +)
            
            // Lookup the first character in the dictionary, and get the numeric value for it
            guard   let firstCharAsDigit = lookupDictionary[firstCharacter],
                    let secondCharAsDigit = lookupDictionary[secondCharacter]
            else { return false }
            
            // Do some math
            let checksum = firstCharAsDigit * multiplier + secondCharAsDigit - subtractor
            
            // Take the last 9 digits
            guard let number = Int(String(vatNumber.suffix(9))) else { return false }
            
            // Do some more math
            let remainder = (number + (checksum / 11) + 1) % 11
            let checkDigit = checksum % 11
            
            // If remainder equals the check digit, it's valid
            return remainder == checkDigit
        }
        
    }
    
}
