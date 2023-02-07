//
//  VatNumberKit_RomaniaChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import Foundation

extension VatNumberKit {
    
    struct RomaniaChecksumValidator {
        
        static func validate(vatNumber: VatNumber) -> Bool {
            // Number needs to be 10 characters long
            guard vatNumber.number.count == 10 else { return false }
                        
            // The last digit serves as the check digit
            guard let checkDigit = Int(String(vatNumber.number.suffix(1))) else { return false }
            
            // Calculate the weighted sum
            let weightedSum = ChecksumHelper.calculateWeightedSum(vatNumber: vatNumber.number, weights: [9, 8, 7, 6, 5, 4, 3, 2])
            
            let remainder = (weightedSum * 10) % 11
            let checkValue = remainder == 10 ? 0 : remainder
            
            return checkDigit == checkValue
        }
        
    }
    
}
