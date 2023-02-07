//
//  VatNumberKit_CyprusChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 04/02/2023.
//

import Foundation

extension VatNumberKit {
    
    struct CyprusChecksumValidator {
        
        static func validate(vatNumber: VatNumber) -> Bool {
            guard vatNumber.number.count == 9 else { return false }
            
            // Number should not start with 12
            guard !vatNumber.number.hasPrefix("12") else { return false }
            
            // Get the ASCII value of the last character, this will serve as the control value
            guard let lastCharacterAsciiValue = vatNumber.number[8].asciiValue else { return false }
            
            var totalSum = 0
            
            for index in 0..<8 {
                guard let digit = Int(String(vatNumber.number[index])) else { continue }
                var value = digit
                
                if index % 2 == 0 {
                    if digit == 0 {
                        value = 1
                    }
                    else if digit == 1 {
                        value = 0
                    }
                    else if digit == 2 {
                        value = 5
                    }
                    else if digit == 3 {
                        value = 7
                    }
                    else if digit == 4 {
                        value = 9
                    }
                    else {
                        value = (digit * 2) + 3
                    }
                }
                
                totalSum += value
            }
            
            let remainder = totalSum % 26
            let calculatedAsciiValue = remainder + 65
            
            // If both are equal, it's a valid number
            return calculatedAsciiValue == lastCharacterAsciiValue
        }
        
    }
    
}
