//
//  VatNumberKit_GreatBritainChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import Foundation

extension VatNumberKit {
    
    struct GreatBritainChecksumValidator {
        
        static func validate(vatNumber: VatNumber) -> Bool {
            switch vatNumber.number.count {
            case 5:
                if vatNumber.number.hasPrefix("GD") {
                    return validateGovernment(vatNumber: vatNumber.number)
                }
                else if vatNumber.number.hasPrefix("HA") {
                    return validateHealthAuthority(vatNumber: vatNumber.number)
                }
                else {
                    return false
                }
                
            case 9, 12:
                return validate(vatNumber: vatNumber.number)
                                
            default:
                return false
            }
        }
        
        static func validateGovernment(vatNumber: String) -> Bool {
            // Government departments have a number less then 500
            guard let numberWithoutGD = Int(String(vatNumber.dropFirst(2))) else { return false }
            return numberWithoutGD < 500
        }
        
        static func validateHealthAuthority(vatNumber: String) -> Bool {
            // Health Authorities have a number bigger then 499
            guard let numberWithoutHA = Int(String(vatNumber.dropFirst(2))) else { return false }
            return numberWithoutHA > 499
        }
        
        static func validate(vatNumber: String) -> Bool {
            guard let checkDigit = Int(String(vatNumber[7..<9])) else { return false }
                        
            let weightedSum = ChecksumHelper.calculateWeightedSum(vatNumber: vatNumber, weights: [8, 7, 6, 5, 4, 3, 2])
                        
            let addition = weightedSum + checkDigit
            
            let remainder = addition % 97
            let remainder2 = (remainder + 55) % 97
            
            return (remainder * remainder2) == 0
        }
    }
    
}
