//
//  VatNumberKit_ValidationOutput.swift
//  
//
//  Created by Frederik Jacques on 17/12/2022.
//

import Foundation

public extension VatNumberKit {
    
    struct ValidationOutput: Hashable {
        
        /// The original VAT number that was submitted
        public let rawVatNumber: String?
        
        /// The VAT number, separated by country & number (contains country code information)
        public let vatNumber: VatNumber?
        
        /// Is it a valid VAT number (regex or checksum check)
        public let isValid: Bool
        
    }
    
}


