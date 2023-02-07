//
//  VatNumberKit_HungaryChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import Foundation

extension VatNumberKit {
    
    struct HungaryChecksumValidator {
        
        static func validate(vatNumber: VatNumber) -> Bool {
            // Number needs to be 8 characters long
            guard vatNumber.number.count == 8 else { return false }
            
            // Last digit is the check digit
            guard let checkDigit = Int(String(vatNumber.number.suffix(1))) else { return false }
            
            let weightedSum = ChecksumHelper.calculateWeightedSum(vatNumber: vatNumber.number, weights: [9, 7, 3, 1, 9, 7, 3])
            
            // Take last digit of the weighted sum (modulo 10 will do the trick)
            let lastDigitOfWeightedSum = weightedSum % 10
            
            let checkValue = lastDigitOfWeightedSum == 0 ? 0 : 10 - lastDigitOfWeightedSum
            
            return checkValue == checkDigit
        }
        
    }
    
}
