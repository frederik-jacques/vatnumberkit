//
//  VatNumberKit_LuxembourgChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import Foundation

extension VatNumberKit {
    
    struct LuxembourgChecksumValidator {
        
        static func validate(vatNumber: VatNumber) -> Bool {
            // Number needs to be 8 characters long
            guard vatNumber.number.count == 8 else { return false }
            
            // Check digit are the last two digits
            guard let checkDigit = Int(String(vatNumber.number.suffix(2))) else { return false }
            
            // The number to work with are the first 6 digits
            guard let firstSixDigits = Int(String(vatNumber.number.prefix(6))) else { return false }
            
            let checkValue = firstSixDigits % 89
            
            return checkValue == checkDigit
        }
        
    }
    
}
