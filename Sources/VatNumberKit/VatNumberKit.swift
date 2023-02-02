//
//  VatNumberKit.swift
//
//
//  Created by Frederik Jacques on 17/12/2022.
//

import Foundation

public struct VatNumberKit {
    
    /// Parse a given VAT number and check if the format is correct.
    /// - Parameter vatNumber: The raw VAT number (spaces, special characters included)
    /// - Returns: A validation object, nil if VAT number was empty, nil or has an invalid country code.
    public static func parse(vatNumber: String?) -> ValidationOutput? {
        guard let vatNumber = VatNumber(vatNumber: vatNumber) else { return nil }
           
        return check(vatNumber: vatNumber)
    }
    
    /// Check if the VAT number has a valid format
    /// - Parameters:
    ///   - country: The country for which to check the format
    ///   - number: The VAT number
    /// - Returns: A validation object, nil if VAT number was empty or nil
    public static func parse(country: Country, number: String?) -> ValidationOutput? {
        guard let vatNumber = VatNumber(country: country, number: number) else { return nil }
        
        return check(vatNumber: vatNumber)
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
    
    private static func check(vatNumber: VatNumber) -> ValidationOutput? {
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
