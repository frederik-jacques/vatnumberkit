//
//  VatNumberKit_CzechRepublicChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 04/02/2023.
//

import Foundation

extension VatNumberKit {
    
    struct CzechRepublicChecksumValidator {
        
        static func validate(vatNumber: VatNumber) -> Bool {
            switch vatNumber.number.count {
            case 8:
                return validateBusiness(vatNumber: vatNumber.number)
                
            case 9:
                if vatNumber.number[0] != "6" {
                    return validateIndividual(vatNumber: vatNumber.number)
                }
                else {
                    return validateIndividualSpecial(vatNumber: vatNumber.number)
                }
                
            case 10:
                return validateIndividualLong(vatNumber: vatNumber.number)
                
            default:
                return false
            }
        }
        
        private static func validateBusiness(vatNumber: String) -> Bool {
            guard let checksumDigit = Int(String(vatNumber[7])) else { return false }
            
            let sum = ChecksumHelper.calculateWeightedSum(vatNumber: vatNumber, weights: [8, 7, 6, 5, 4, 3, 2]);
            
            var calculatedCheckDigit = 11 - (sum % 11)
            
            if calculatedCheckDigit == 10 {
                calculatedCheckDigit = 0
            }
            else if calculatedCheckDigit == 11 {
                calculatedCheckDigit = 1
            }
            
            return calculatedCheckDigit == checksumDigit
        }
        
        private static func validateIndividual(vatNumber: String) -> Bool {
            guard let firstTwoDigits = Int(vatNumber.suffix(2)) else { return false}
            return firstTwoDigits < 63
        }
        
        private static func validateIndividualSpecial(vatNumber: String) -> Bool {
            guard let vatCheckDigit = Int(String(vatNumber[8])) else { return false }
            
            let weightedSum = ChecksumHelper.calculateWeightedSum(vatNumber: vatNumber, weights: [0, 8, 7, 6, 5, 4, 3, 2])
                    
            let checksum: Int
            
            if weightedSum % 11 == 0 {
                checksum = weightedSum + 11
            }
            else {
                checksum = Int(ceil(Double(weightedSum) / Double(11)) * Double(11))
            }
            
            let possibleCheckDigits = [8, 7, 6, 5, 4, 3, 2, 1, 0, 9, 8]
            let lookupIndex = (checksum - weightedSum) - 1
            
            let safeLookupIndex = lookupIndex.clamped(lowerBound: 0, upperBound: possibleCheckDigits.count - 1)
            return vatCheckDigit == possibleCheckDigits[safeLookupIndex]
        }
        
        private static func validateIndividualLong(vatNumber: String) -> Bool {
            guard let part1 = Int(String(vatNumber[0..<2])),
                  let part2 = Int(String(vatNumber[2..<4])),
                  let part3 = Int(String(vatNumber[4..<6])),
                  let part4 = Int(String(vatNumber[6..<8])),
                  let part5 = Int(String(vatNumber[8..<10])),
                  let vatAsNumber = Int(vatNumber)
            else { return false }
            
            let sum = part1 + part2 + part3 + part4 + part5
            return sum % 11 == 0 && vatAsNumber % 11 == 0
        }
    }
    
}
