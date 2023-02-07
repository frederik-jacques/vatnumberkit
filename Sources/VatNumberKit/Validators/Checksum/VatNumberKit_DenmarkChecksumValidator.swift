//
//  VatNumberKit_DenmarkChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 05/02/2023.
//

import Foundation

extension VatNumberKit {
    
    struct DenmarkChecksumValidator {
        
        static func validate(vatNumber: VatNumber) -> Bool {
            let weightedSum = ChecksumHelper.calculateWeightedSum(vatNumber: vatNumber.number, weights: [2, 7, 6, 5, 4, 3, 2, 1])
            
            return weightedSum % 11 == 0
        }
        
    }
    
}
