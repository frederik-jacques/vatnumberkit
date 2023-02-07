//
//  VatNumberKit_BulgariaChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 04/02/2023.
//

import Foundation

extension VatNumberKit {
 
    struct BulgariaChecksumValidator {
        
        static func validate(vatNumber: VatNumber) -> Bool {
            // The Bulgarian VAT number is
            // - 9 digits: Business
            // - 10 digits: Natural person
            if vatNumber.number.count == 9 {
                return validateBusiness(number: vatNumber.number)
            }
            else if vatNumber.number.count == 10 {
                // Check if it is a natural person
                return validateNaturalPerson(number: vatNumber.number) || validateForeigner(number: vatNumber.number)
            }
            else {
                return false
            }
        }
        
        private static func validateBusiness(number: String) -> Bool {
            return ChecksumHelper.validateChecksum(vatNumber: number, weights: [1, 2, 3, 4, 5, 6, 7, 8], vatNumberChecksumPosition: 8)
        }
        
        private static func validateNaturalPerson(number: String) -> Bool {
            return ChecksumHelper.validateChecksum(vatNumber: number, weights: [2, 4, 8, 5, 10, 9, 7, 3, 6])
        }
                
        private static func validateForeigner(number: String) -> Bool {
            return ChecksumHelper.validateChecksum(vatNumber: number, weights: [21, 19, 17, 13, 11, 9, 7, 3, 1], modulo: 10)
        }
        
    }
    
}


