//
//  VatNumberKit_MaltaChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import Foundation

extension VatNumberKit {
    
    struct MaltaChecksumValidator {
        
        static func validate(vatNumber: VatNumber) -> Bool {
            // Number needs to be 8 characters long
            guard vatNumber.number.count == 8 else { return false }
            
            // If the first six digits have a value lower than 100000, it's also invalid
            guard let firstSixDigits = Int(String(vatNumber.number.prefix(6))), firstSixDigits > 100000 else { return false }
            
            // The last 2 digits serve as the check digit
            guard let checkDigit = Int(String(vatNumber.number.suffix(2))) else { return false }
            
            // Calculate the weighted sum
            let weightedSum = ChecksumHelper.calculateWeightedSum(vatNumber: vatNumber.number, weights: [3, 4, 6, 7, 8, 9])
            
            // Calculate the check value
            let checkValue = 37 - (weightedSum % 37)
            
            return checkDigit == checkValue
        }
        
    }
    
}
