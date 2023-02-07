//
//  VatNumberKit_EstoniaChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 06/02/2023.
//

import Foundation

extension VatNumberKit {
    
    struct EstoniaChecksumValidator {
        
        static func validate(vatNumber: VatNumber) -> Bool {
            guard vatNumber.number.count == 9 else { return false }
            
            // The last digit is the check digit
            guard let checkDigit = Int(String(vatNumber.number.suffix(1))) else { return false }
            
            // Calculate the weighted sum
            let weightedSum = ChecksumHelper.calculateWeightedSum(vatNumber: vatNumber.number, weights: [3,7,1,3,7,1,3,7])
            
            // Perform modulo
            var remainder = 10 - (weightedSum % 10)
            if remainder == 10 {
                remainder = 0
            }
            
            return remainder == checkDigit
        }
        
    }
    
}
