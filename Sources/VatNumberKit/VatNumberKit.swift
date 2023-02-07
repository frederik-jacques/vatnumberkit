//
//  VatNumberKit.swift
//
//
//  Created by Frederik Jacques on 17/12/2022.
//

import Foundation

public struct VatNumberKit {
    
    /// Parse a raw VAT number and check if the format is correct (offline, regex based).
    /// - Parameter vatNumber: The raw VAT number (spaces, special characters will be removed)
    /// - Returns: A validation object, nil if VAT number was empty, nil or has an invalid country code.
    public static func validateFormat(vatNumber: String?) -> ValidationOutput? {
        guard let vatNumber = VatNumber(vatNumber: vatNumber) else { return nil }
           
        return validateFormat(vatNumber: vatNumber)
    }
    
    /// Parse a VAT number of a given country and check if the format is correct (offline, regex based).
    /// - Parameters:
    ///   - country: The country to check the format for
    ///   - number: The number part of the VAT number (spaces, special characters will be removed)
    /// - Returns: A validation object, nil if VAT number was empty, nil or has an invalid country code.
    public static func validateFormat(country: Country, number: String?) -> ValidationOutput? {
        guard let vatNumber = VatNumber(country: country, number: number) else { return nil }
        
        return validateFormat(vatNumber: vatNumber)
    }
    
    /// Validate the checksum of a VAT number (offline)
    /// - Parameter vatNumber: The raw VAT number  (spaces, special characters will be removed)
    /// - Returns: A boolean indicating if the checksum for the given VAT number is valid
    public static func validateChecksum(vatNumber: String?) -> Bool {                
        return ChecksumValidator.validate(rawVatNumber: vatNumber)
    }
    
    /// Validate a VAT number against an online service.
    /// For European countries, https://ec.europa.eu/taxation_customs/vies is used.
    /// For Great Britain, https://api.service.hmrc.gov.uk is used.
    /// - Parameters:
    ///   - vatNumber: A raw VAT number
    ///   - completionHandler: Callback
    public static func validateOnline(vatNumber: String?, completionHandler: @escaping ((Result<ValidationServiceOutput, Error>) -> Void)) {
        guard let vatNumber = VatNumber(vatNumber: vatNumber) else {
            completionHandler(.success(ValidationServiceOutput(isValid: false, validationMessages: [.vatNumberIsNilOrEmpty], metaData: nil)))
            return
        }
        
        let validationService = ValidationService(urlSession: URLSession.shared)
        validationService.validate(vatNumber: vatNumber, completionHandler: completionHandler)
    }
    
    private static func validateFormat(vatNumber: VatNumber) -> ValidationOutput? {
        for regex in vatNumber.country.regexPatterns {
            if #available(macOS 13.0, *), #available(iOS 16.0, *) {
                do {
                    let regex = try Regex("\\b\(regex)\\b")
                    
                    if vatNumber.fullVatNumber.firstMatch(of: regex) != nil {
                        return ValidationOutput(vatNumber: vatNumber, isValid: true)
                    }
                    else {
                        continue
                    }
                }
                catch {
                    assertionFailure("Regex resolve failed. This should never happen.")
                    continue
                }
            }
            else {
                do {
                    let regex = try NSRegularExpression(pattern: "\\b\(regex)\\b")
                    let range = NSRange(location: 0, length: vatNumber.fullVatNumber.utf16.count)

                    guard regex.firstMatch(in: vatNumber.fullVatNumber, range: range) != nil else {
                        continue
                    }

                    return ValidationOutput(vatNumber: vatNumber, isValid: true)
                }
                catch {
                    assertionFailure("Regex resolve failed. This should never happen.")
                    continue
                }
            }
        }
        
        return ValidationOutput(vatNumber: vatNumber, isValid: false)
    }
    
}
