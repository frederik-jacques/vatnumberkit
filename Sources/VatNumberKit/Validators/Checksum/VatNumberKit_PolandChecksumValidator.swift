//
//  VatNumberKit_PolandChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import Foundation

extension VatNumberKit {
    
    struct PolandChecksumValidator {
        
        static func validate(vatNumber: VatNumber) -> Bool {
            // Number needs to be 10 characters long
            guard vatNumber.number.count == 10 else { return false }
            
            // The last digit serves as the check digit
            guard let checkDigit = Int(String(vatNumber.number.suffix(1))) else { return false }
            
            // Calculate the weighted sum
            let weightedSum = ChecksumHelper.calculateWeightedSum(vatNumber: vatNumber.number, weights: [6, 5, 7, 2, 3, 4, 5, 6, 7])

            return weightedSum % 11 == checkDigit
        }
        
    }
    
}
