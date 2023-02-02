//
//  VatNumberKit_ValidationOutput.swift
//  
//
//  Created by Frederik Jacques on 17/12/2022.
//

import Foundation

public extension VatNumberKit {
    
    struct ValidationOutput {
        
        /// The VAT number (contains country code information)
        public let vatNumber: VatNumber
        
        /// Is the format valid
        public let isValid: Bool
        
    }
    
}


