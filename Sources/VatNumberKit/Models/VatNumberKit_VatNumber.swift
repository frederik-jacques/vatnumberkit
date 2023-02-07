//
//  VatNumberKit_VatNumber.swift
//  
//
//  Created by Frederik Jacques on 17/12/2022.
//

import Foundation

public extension VatNumberKit {
    
    struct VatNumber: Equatable {
        /// The country part of  the VAT number
        public let country: Country
        
        /// The number part of the VAT number
        public let number: String
        
        /// The full VAT number (country + number)
        public var fullVatNumber: String { return "\(country.rawValue)\(number)" }
        
        /// Create a VatNumber instance based on a country & the number. If the number is nil or empty, nil is returned.
        /// - Parameters:
        ///   - country: The country
        ///   - number: The number
        init?(country: Country, number: String?) {
            guard let number = number?.trimmingCharacters(in: .whitespacesAndNewlines).withoutDiacritics.alphanumeric, !number.isEmpty else { return nil }
            
            self.country = country
            self.number = number
        }
                
        /// Create a VatNumber instance based on a raw Vat number string.
        /// - Parameter vatNumber: A raw VAT number
        init?(vatNumber: String?) {
            // Check that the VAT number is not nil, empty and has a country code.
            guard let vatNumber = vatNumber?.trimmingCharacters(in: .whitespacesAndNewlines).withoutDiacritics.alphanumeric,
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
            
            self.init(country: country, number: updatedNumber)
        }
        
    }
    
}
