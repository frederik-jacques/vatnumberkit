//
//  VatNumberKit_LatviaChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import Foundation

extension VatNumberKit {
    
    struct LatviaChecksumValidator {
        
        static func validate(vatNumber: VatNumber) -> Bool {
            // Number needs to be 11 characters long
            guard vatNumber.number.count == 11 else { return false }
            
            // If the first digit is smaller than 4, it's invalid
            guard let firstDigit = Int(String(vatNumber.number.prefix(1))), firstDigit > 3 else { return false }
            
            // Last digit is the check digit
            guard let checkDigit = Int(String(vatNumber.number.suffix(1))) else { return false }
            
            // Calculate the weighted sum
            let weightedSum = ChecksumHelper.calculateWeightedSum(vatNumber: vatNumber.number, weights: [9, 1, 4, 8, 3, 10, 2, 5, 7, 6])
            
            let remainder = 3 - (weightedSum % 11)
            
            guard remainder != -1 else { return false }
            
            let checkValue = remainder < -1 ? remainder + 11 : remainder
            
            return checkValue == checkDigit
        }
        
    }
    
}
