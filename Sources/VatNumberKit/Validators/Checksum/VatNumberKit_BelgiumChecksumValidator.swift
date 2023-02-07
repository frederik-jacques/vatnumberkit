//
//  VatNumberKit_BelgiumChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 04/02/2023.
//

import Foundation

extension VatNumberKit {
 
    struct BelgiumChecksumValidator {
        
        static func validate(vatNumber: VatNumber) -> Bool {
            // Modulo 97 of first 8 digits
            // 97 - result = last 2 digits
            let firstEightCharacters = String(vatNumber.number.prefix(8))
            let lastTwoCharacters = String(vatNumber.number.suffix(2))
            
            guard let firstEightDigits = Int(firstEightCharacters),
                    let lastTwoDigits = Int(lastTwoCharacters)
            else { return false }
            
            let remainder = firstEightDigits % 97
            return (97 - remainder) == lastTwoDigits
        }
        
    }
    
}
