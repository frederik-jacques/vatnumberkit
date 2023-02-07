//
//  VatNumberKit_CroatiaChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 04/02/2023.
//

import Foundation

extension VatNumberKit {
    
    struct CroatiaChecksumValidator {
        
        static func validate(vatNumber: VatNumber) -> Bool {
            guard vatNumber.number.count == 11 else { return false }
            
            guard let lastDigit = Int(String(vatNumber.number.suffix(1))) else { return false }
            
            var product = 10
            
            for index in 0..<10 {
                guard let digit = Int(String(vatNumber.number[index])) else { continue }
                
                let remainder = (digit + product) % 10
                
                let sum = (remainder == 0) ? 10 : remainder
                                                    
                product = (2 * sum) % 11
            }
            
            return (product + lastDigit) % 10 == 1
        }
        
    }
    
}
