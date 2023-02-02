//
//  VatNumberKit_ValidationServiceOutput.swift
//  
//
//  Created by Frederik Jacques on 17/12/2022.
//

import Foundation

public extension VatNumberKit {
    
    struct ValidationServiceOutput {
        
        public enum ValidationMessage {
            case ukVatNumberHasIncorrectNumberOfDigits
            case ukVatNumberDoesNotMatchRegisteredCompany
            case vatNumberIsNilOrEmpty
        }
        
        public struct MetaData {
            public let name: String
            public let address: String
        }
        
        public let isValid: Bool
        public let validationMessages: [ValidationMessage]
        public let metaData: MetaData?
    }
    
}
