//
//  VatNumberKit_GreeceChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import Foundation

extension VatNumberKit {
    
    struct GreeceChecksumValidator {
        
        static func validate(vatNumber: VatNumber) -> Bool {
            // Number needs to be 9 characters long
            guard vatNumber.number.count == 9 else { return false }
            
            // Last digit is the check digit
            guard let checkDigit = Int(String(vatNumber.number.suffix(1))) else { return false }
            
            let weightedSum = ChecksumHelper.calculateWeightedSum(vatNumber: vatNumber.number, weights: [256, 128, 64, 32, 16, 8, 4, 2])
            let remainder: Int = weightedSum % 11
            let checkValue = remainder > 9 ? 0 : remainder
            
            return checkDigit == checkValue
        }
        
    }
    
}
