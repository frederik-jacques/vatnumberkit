//
//  VatNumberKit_SlovakiaChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import Foundation

extension VatNumberKit {
    
    struct SlovakiaChecksumValidator {
        
        static func validate(vatNumber: VatNumber) -> Bool {
            // Number needs to be 10 characters long
            guard vatNumber.number.count == 10 else { return false }
            
            // First digit should not be 0
            guard !vatNumber.number.hasPrefix("0") else { return false }
            
            // Third digit should be 2, 3, 4, 7, 8 or 9
            let thirdCharacter = String(vatNumber.number[2])
            guard ["2", "3", "4", "7", "8", "9"].contains(thirdCharacter) else { return false }
            
            // Convert the string to numbers & apply modulo 11
            guard let number = Int(vatNumber.number) else { return false }
            
            return number % 11 == 0
        }
        
    }
    
}
