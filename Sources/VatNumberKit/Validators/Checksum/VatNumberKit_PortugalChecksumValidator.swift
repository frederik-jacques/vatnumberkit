//
//  VatNumberKit_PortugalChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import Foundation

extension VatNumberKit {
    
    struct PortugalChecksumValidator {
        
        static func validate(vatNumber: VatNumber) -> Bool {
            // Number needs to be 9 characters long
            guard vatNumber.number.count == 9 else { return false }
            
            // The last digit serves as the check digit
            guard let checkDigit = Int(String(vatNumber.number.suffix(1))) else { return false }
            
            // Calculate the weighted sum
            let weightedSum = ChecksumHelper.calculateWeightedSum(vatNumber: vatNumber.number, weights: [9, 8, 7, 6, 5, 4, 3, 2])
            
            // Calculate checksum
            let checkValue: Int
            if (11 - (weightedSum % 11)) > 9 {
                checkValue = 0
            }
            else {
                checkValue = 11 - (weightedSum % 11)
            }
            
            return checkValue == checkDigit
        }
        
    }
    
}
