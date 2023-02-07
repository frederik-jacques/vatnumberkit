//
//  File.swift
//  
//
//  Created by Frederik Jacques on 04/02/2023.
//

import Foundation

struct IrishVatNumberConverter {
    
    static func convert(vatNumber: VatNumberKit.VatNumber) -> VatNumberKit.VatNumber? {
        // Check if it is a pre-2013 VAT number
        // A pre 2013 VAT number has 8 characters, and the second character is a letter.
        guard vatNumber.number.count == 8, vatNumber.number[1].isLetter else {
            return vatNumber
        }
        
        // It is an old VAT number, convert it.
        // The rules are:
        // 1. Add a zero
        // 2. Take the 5 digits after the second character (the letter)
        // 3. Take the first digit and add it at the end
        // 4. Add the trailing letter
        
        // Example: IE8D79739I => IE0797398I
        let originalNumber = vatNumber.number
        
        let fiveDigits = String(originalNumber[2..<7])
        let firstDigit = String(originalNumber.prefix(1))
        let lastCharacter = String(originalNumber.suffix(1))
        
        let updatedNumber = "IE0" + fiveDigits + firstDigit + lastCharacter
        return VatNumberKit.VatNumber(rawVatNumber: updatedNumber)
    }
    
}
