//
//  VatNumberKit_LithuaniaChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import Foundation

extension VatNumberKit {
    
    struct LithuaniaChecksumValidator {
        
        static func validate(vatNumber: VatNumber) -> Bool {
            switch vatNumber.number.count {
            case 9:
                return validate(vatNumber: vatNumber.number)
                
            case 12:
                return validateTemporaryTaxPayer(vatNumber: vatNumber.number)
                
            default:
                return false
            }
        }
        
        private static func validateTemporaryTaxPayer(vatNumber: String) -> Bool {
            // The eleventh character should be 1
            guard let eleventhDigit = Int(String(vatNumber[10])), eleventhDigit == 1 else { return false }
            
            // Last digit is the check digit
            guard let checkDigit = Int(String(vatNumber.suffix(1))) else { return false }
            
            // Calculate the weighted sum
            let weightedSum = ChecksumHelper.calculateWeightedSum(vatNumber: vatNumber, weights: [1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2])
            
            // Check if we need to calculate a fallback weighted sum
            if (weightedSum % 11) == 10 {
                // Calculate fallback weighted sum
                let fallBackWeightedSum = ChecksumHelper.calculateWeightedSum(vatNumber: vatNumber, weights: [3, 4, 5, 6, 7, 8, 9, 1, 2, 3, 4])
                
                let checkValue = fallBackWeightedSum % 11 == 10 ? 0 : fallBackWeightedSum % 11
                return checkValue == checkDigit
            }
            else {
                let checkValue = weightedSum % 11
                return checkValue == checkDigit
            }
        }
        
        private static func validate(vatNumber: String) -> Bool {
            // The eight character should be 1
            guard let seventhDigit = Int(String(vatNumber[7])), seventhDigit == 1 else { return false }
            
            // Last digit is the check digit
            guard let checkDigit = Int(String(vatNumber.suffix(1))) else { return false }
            
            // Calculate the weighted sum
            let weightedSum = ChecksumHelper.calculateWeightedSum(vatNumber: vatNumber, weights: [1, 2, 3, 4, 5, 6, 7, 8])
            
            // Check if we need to calculate a fallback weighted sum
            if (weightedSum % 11) == 10 {
                // Calculate fallback weighted sum
                let fallBackWeightedSum = ChecksumHelper.calculateWeightedSum(vatNumber: vatNumber, weights: [3, 4, 5, 6, 7, 8, 9, 1])
                
                let checkValue = fallBackWeightedSum % 11 == 10 ? 0 : fallBackWeightedSum % 11
                return checkValue == checkDigit
            }
            else {
                let checkValue = weightedSum % 11
                return checkValue == checkDigit
            }
        }
        
    }
    
}
