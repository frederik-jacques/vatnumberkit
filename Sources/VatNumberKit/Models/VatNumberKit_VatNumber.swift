//
//  VatNumberKit_VatNumber.swift
//  
//
//  Created by Frederik Jacques on 17/12/2022.
//

import Foundation

public extension VatNumberKit {
    
    struct VatNumber: Hashable {
        /// The country part of  the VAT number
        public let country: Country
        
        /// The number part of the VAT number
        public let number: String
        
        /// The full VAT number (country + number)
        public var fullVatNumber: String { return "\(country.rawValue)\(number)" }
        
        /// Create a VatNumber instance based on a raw VAT number string.
        /// - Parameter rawVatNumber: The raw VAT number (spaces, special characters will be removed)
        init?(rawVatNumber: String?) {
            // Check that the VAT number is not nil, empty and has a country code.
            guard let vatNumber = rawVatNumber?.trimmingCharacters(in: .whitespacesAndNewlines).withoutDiacritics.alphanumeric,
                  !vatNumber.isEmpty,
                  let country = Country.create(from: vatNumber)
            else { return nil }
            
            // Get the remaining numbers
            let number = String(vatNumber.dropFirst(2))
            
            // Verify the remaining number is not empty.
            guard !number.isEmpty else { return nil }
            
            let updatedNumber: String
            
            // Belgium has a case where the VAT number can also be 9 digits, in that case we need to add a 0 at the start of the number.
            if country.isBelgian, number.count == 9 {
                updatedNumber = "0\(number)"
            }
            else {
                updatedNumber = number
            }
            
            self.country = country
            self.number = updatedNumber
        }
        
    }
    
}
