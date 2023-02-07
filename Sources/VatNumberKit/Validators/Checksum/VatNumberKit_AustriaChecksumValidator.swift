//
//  VatNumberKit_AustriaChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 05/02/2023.
//

import Foundation

extension VatNumberKit {
 
    struct AustriaChecksumValidator {
        
        static func validate(vatNumber: VatNumber) -> Bool {
            // The first character is a U, we don't need this.
            let onlyNumbers = String(vatNumber.number.dropFirst())
            
            // The last digit is the check digit
            guard let checkDigit = Int(String(onlyNumbers.suffix(1))) else { return false }
            
            // Now we need to take all the characters, drop the last one (the checkdigit) and turn them into an array of integers
            let numbers = onlyNumbers.dropLast(1).compactMap { $0.wholeNumberValue }
            
            // Next, we multiply the even numbers with 1 and the odds with 2
            let multipliedNumbers = numbers.enumerated().map { element in
                let isEven = (element.offset + 1) % 2 == 0
                return element.element * (isEven ? 2 : 1)
            }
            
            // Now we take the multiplied numbers, and calculate the cross sum
            let crossSum = multipliedNumbers.reduce(0, +)
            
            let result = 96 - crossSum
            
            // Take the last digit of the result & check against the checkDigit
            guard let lastDigit = Int(String("\(result)".suffix(1))) else { return false }
            
            return lastDigit == checkDigit
        }
        
    }
    
}
