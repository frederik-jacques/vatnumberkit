//
//  VatNumberKit_GermanyChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import Foundation

extension VatNumberKit {
    
    struct GermanyChecksumValidator {
        
        static func validate(vatNumber: VatNumber) -> Bool {
            // Convert string to array of numbers
            let onlyNumbers = vatNumber.number.compactMap({ $0.wholeNumberValue })
            
            // Numbers needs to contain 9 digits
            guard onlyNumbers.count == 9 else { return false }
            
            // Last digit is the check digit
            guard let checkDigit = onlyNumbers.last else { return false }
            
            // Do some math on the first 8 digits
            let numbersForCalculation = Array(onlyNumbers.dropLast(1))
            var prod = 10
                        
            for number in numbersForCalculation {
                var checkValue = (number + prod) % 10
                
                if checkValue == 0 {
                    checkValue = 10
                }
                
                prod = (checkValue * 2) % 11
            }
            
            if prod == 1 {
                prod = 11
            }
            
            return 11 - prod == checkDigit
        }
        
    }
    
}
