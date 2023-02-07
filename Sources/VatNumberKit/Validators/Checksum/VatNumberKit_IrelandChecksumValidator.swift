//
//  VatNumberKit_IrelandChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 06/02/2023.
//

import Foundation

extension VatNumberKit {
    
    struct IrelandChecksumValidator {
        
        static func validate(vatNumber: VatNumber) -> Bool {
            guard vatNumber.number.count == 8 || vatNumber.number.count == 9 else { return false }
            
            // IE has a new style of VAT numbers since 2013.
            // The old style: 8 digits where the second character is a letter.
            // The new style: 8 digits where the last character is a letter.
            // First we'll convert the old style to the new style.
            guard let convertedVatNumber = IrishVatNumberConverter.convert(vatNumber: vatNumber) else {
                return false
            }
            
            // Take every digit and multiply it
            var total: Int = (2...8).reversed().reduce(0) { partialResult, index in
                let characterIndex = 8 - index
                let character = String(convertedVatNumber.number[characterIndex])
                let integer = Int(character) ?? 0
                
                return partialResult + (integer * index)
            }
            
            // If the VAT number has 2 trailing alphabetical characters,
            // we need to add them to the calculation.
            let lastTwoCharacters = String(vatNumber.number.suffix(2))
            
            if lastTwoCharacters.range(of: "[A-Z]{2}", options: .regularExpression) != nil {
                // If the last character is an H, we need to add 72 to the total
                // If it is an A, add 9 to the total
                let addition = String(lastTwoCharacters.suffix(1)) == "H" ? 72 : 9
                total += addition
            }
            
            // Take modulo 23 of the total
            let remainder = total % 23
            
            // Calculate the ASCII value which will serve as the check value.
            // If the remainder is 0, we should take the ASCII value of the letter W (which is 87)
            let checkAsciiValue: Int = (remainder == 0) ? 87 : remainder + 64
            
            // Now get the 8th character of the VAT number and take the ASCII value
            guard let eightCharacterAsciiValue = convertedVatNumber.number[7].asciiValue else { return false }
            
            // If both are equal, it's a valid number
            return checkAsciiValue == eightCharacterAsciiValue
        }
        
    }
    
}
