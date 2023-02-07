//
//  VatNumberKit_SloveniaChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import Foundation

extension VatNumberKit {
    
    struct SloveniaChecksumValidator {
        
        static func validate(vatNumber: VatNumber) -> Bool {
            // Number needs to be 8 characters long
            guard vatNumber.number.count == 8 else { return false }
            
            // The last digit serves as the check digit
            guard let checkDigit = Int(String(vatNumber.number.suffix(1))) else { return false }
            
            // First digit should not be 0
            guard !vatNumber.number.hasPrefix("0") else { return false }
            
            // Calculate the weighted sum
            let weightedSum = ChecksumHelper.calculateWeightedSum(vatNumber: vatNumber.number, weights: [8, 7, 6, 5, 4, 3, 2])
            
            let remainder = 11 - (weightedSum % 11)
            guard remainder != 11 else { return false }
            
            let checkValue = remainder == 10 ? 0 : remainder
            
            return checkValue == checkDigit
        }
        
    }
    
}
