//
//  VatNumberKit_ItalyChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import Foundation

extension VatNumberKit {
    
    struct ItalyChecksumValidator {
        
        static func validate(vatNumber: VatNumber) -> Bool {
            // Convert all the characters to an array of integers
            let onlyNumbers = vatNumber.number.compactMap({ $0.wholeNumberValue })
            
            // Number needs to be 11 digits long
            guard onlyNumbers.count == 11  else { return false }
            
            // Last digit is the check digit
            guard let checkDigit = Int(String(vatNumber.number.suffix(1))) else { return false }
            
            // For the calculation, we need to take all the digits, but without the last one (the checkdigit)
            let numbers = Array(onlyNumbers.dropLast(1))
            
            // Next, we multiply the even numbers with 1 and the odds with 2
            let multipliedNumbers = numbers.enumerated().map { element in
                let isEven = (element.offset + 1) % 2 == 0
                return element.element * (isEven ? 2 : 1)
            }
            
            // Now we take the multiplied numbers, and calculate the cross sum
            let crossSum = multipliedNumbers.reduce(0, +)
            
            // Calculate the check value
            var checkValue = 10 - crossSum % 10
            if checkValue > 9 {
                checkValue = 0
            }
            
            return checkValue == checkDigit
        }
        
    }
    
}
