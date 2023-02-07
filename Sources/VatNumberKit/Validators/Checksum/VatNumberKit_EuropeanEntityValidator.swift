//
//  VatNumberKit_EuropeanEntityChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 06/02/2023.
//

import Foundation

extension VatNumberKit {
    
    struct EuropeanEntityChecksumValidator {
        
        static func validate(vatNumber: VatNumber) -> Bool {
            // There is no documentation to be found how the checksum works
            // so for now we'll just verify that it has 9 digits.
            return vatNumber.number.compactMap({ $0.isNumber }).count == 9
        }
        
    }
    
}
