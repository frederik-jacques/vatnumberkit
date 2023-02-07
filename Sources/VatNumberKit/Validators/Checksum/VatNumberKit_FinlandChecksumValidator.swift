//
//  VatNumberKit_FinlandChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 06/02/2023.
//

import Foundation

extension VatNumberKit {
    
    struct FinlandChecksumValidator {
        
        static func validate(vatNumber: VatNumber) -> Bool {
            // The last digit is the check digit
            guard let checkDigit = Int(String(vatNumber.number.suffix(1))) else { return false }
                        
            // Calculate the weighted sum
            let weightedSum = ChecksumHelper.calculateWeightedSum(vatNumber: vatNumber.number, weights: [7, 9, 10, 5, 8, 4, 2])
            
            // Perform modulo
            let remainder = weightedSum % 11
                        
            if remainder == 0 {
                return checkDigit == 0
            }
            else {
                return checkDigit == 11 - remainder
            }
        }
        
    }
    
}
