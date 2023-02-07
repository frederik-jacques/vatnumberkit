//
//  VatNumberKit_ChecksumHelper.swift
//  
//
//  Created by Frederik Jacques on 04/02/2023.
//

import Foundation

extension VatNumberKit {

    struct ChecksumHelper {
 
        static func validateChecksum(vatNumber: String, weights: [Int], modulo: Int = 11, vatNumberChecksumPosition: Int = 9, weightStartIndex: Int = 0) -> Bool {
            let weightedSum = calculateWeightedSum(vatNumber: vatNumber, weights: weights, startIndex: weightStartIndex)
            
            let checksum: Int
            
            if weightedSum % 11 == 10 {
                let fallbackWeights: [Int] = [3, 4, 5, 6, 7, 8, 9, 10]
                let fallbackWeightedSum = calculateWeightedSum(vatNumber: vatNumber, weights: fallbackWeights, startIndex: weightStartIndex)
                
                if fallbackWeightedSum % 11 == 10 {
                    checksum = 0
                }
                else {
                    checksum = fallbackWeightedSum % 11
                }
            }
            else {
                checksum = weightedSum % modulo
            }
            
            // Get the checksum position of the VAT number
            guard let vatChecksum = Int(String(vatNumber[vatNumberChecksumPosition])) else { return false }
            return checksum == vatChecksum
        }
        
        static func calculateWeightedSum(vatNumber: String, weights: [Int], startIndex: Int = 0) -> Int {                       
            var index = startIndex
            var sum = 0
            for weight in weights {
                guard let digit = Int(String(vatNumber[index])) else { continue }
                
                sum += digit * weight
                index += 1
            }
            
            return sum
        }
        
    }
    
}
