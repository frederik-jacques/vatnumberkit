//
//  VatNumberKit_SwedenChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import Foundation

extension VatNumberKit {
    
    struct SwedenChecksumValidator {
        
        static func validate(vatNumber: VatNumber) -> Bool {
            // Number needs to be 12 characters long
            guard vatNumber.number.count == 12 else { return false }
            
            // Last 2 digits should be greater than 0 and smaller than 95
            guard let lastTwoDigits = Int(String(vatNumber.number.suffix(2))), lastTwoDigits > 0, lastTwoDigits < 95 else { return false }
            
            // Last digit is the check digit
            guard let checkDigit = Int(String(vatNumber.number[9])) else { return false }
            
            // Remove the first and last character
            let numberToValidate = String(vatNumber.number.dropLast(3))
            
            // Calculate the cross sum
            let crossSum = numberToValidate.reversed().enumerated().reduce(0) { partialResult, element in
                var updatedResult = partialResult
                
                guard let digit = Int(String(element.element)) else { return updatedResult }
                
                let isEven = element.offset % 2 == 0
                let valueToCrossSum = digit * (isEven ? 2 : 1)
                
                let crossSum = "\(valueToCrossSum)".compactMap { $0.wholeNumberValue }.reduce(0, +)
                updatedResult += crossSum
                
                return updatedResult
            }
            
            let checkValue = (crossSum % 10 == 0) ? 0 : 10 - (crossSum % 10)
            
            return checkDigit == checkValue
        }
        
    }
    
}
