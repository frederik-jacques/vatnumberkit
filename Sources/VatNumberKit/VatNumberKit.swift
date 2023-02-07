//
//  VatNumberKit.swift
//
//
//  Created by Frederik Jacques on 17/12/2022.
//

import Foundation

public struct VatNumberKit {
    
    /// Parse a raw VAT number and check if the format is correct (offline, regex based).
    /// - Parameters:
    ///   - text: Text to look for VAT numbers
    ///   - applyChecksumValidation: If a VAT number has been found with a correct format, you can additionally also check the checksum
    /// - Returns: A set of `ValidationOutput` structs
    public static func searchVatNumbersInText(_ text: String?, applyChecksumValidation: Bool = true) -> Set<ValidationOutput> {
        guard let text else { return [] }
        
        var outputs: Set<ValidationOutput> = []
        
        for country in Country.allCases {
            for pattern in country.regexPatterns {
                do {
                    let regex = try NSRegularExpression(pattern: pattern)
                    let range = NSRange(location: 0, length: text.utf16.count)
                    
                    let matches: [ValidationOutput] = regex.matches(in: text, range: range).compactMap { checkingResult -> ValidationOutput? in
                        let possibleVatNumber = text[checkingResult.range]
                        
                        // First validate the format
                        let output:ValidationOutput = validateFormat(rawVatNumber: possibleVatNumber)
                        
                        // If the output is not valid, skip it
                        guard output.isValid else { return nil }
                        
                        // Apply checksum validation if needed.
                        if applyChecksumValidation, validateChecksum(rawVatNumber: possibleVatNumber) == false {
                            return nil
                        }
                                                
                        return output
                    }
                    
                    outputs.formUnion(matches)
                }
                catch {
                    continue
                }
            }
        }
        
        return outputs
    }
    
    /// Parse a raw VAT number and check if the format is correct (offline, regex based).
    /// - Parameter vatNumber: The raw VAT number (spaces, special characters will be removed)
    /// - Returns: A validation object.
    public static func validateFormat(rawVatNumber: String?) -> ValidationOutput {
        guard let vatNumber = VatNumber(rawVatNumber: rawVatNumber) else { return ValidationOutput(rawVatNumber: rawVatNumber, vatNumber: nil, isValid: false) }
        return validateFormat(rawVatNumber: rawVatNumber, vatNumber: vatNumber)
    }
    
    /// Parse a VAT number of a given country and check if the format is correct (offline, regex based).
    /// - Parameters:
    ///   - country: The country to check the format for
    ///   - number: The number part of the VAT number (spaces, special characters will be removed)
    /// - Returns: A validation object, nil if VAT number was empty, nil or has an invalid country code.
    public static func validateFormat(country: Country, number: String?) -> ValidationOutput {
        guard let number else { return ValidationOutput(rawVatNumber: nil, vatNumber: nil, isValid: false) }
        
        let rawVatNumber = "\(country.rawValue)\(number)"
        
        guard let vatNumber = VatNumber(rawVatNumber: rawVatNumber) else { return ValidationOutput(rawVatNumber: nil, vatNumber: nil, isValid: false) }
        return validateFormat(rawVatNumber: vatNumber.fullVatNumber, vatNumber: vatNumber)
    }
    
    /// Validate the checksum of a VAT number (offline)
    /// - Parameter rawVatNumber: The raw VAT number  (spaces, special characters will be removed)
    /// - Returns: A boolean indicating if the checksum for the given VAT number is valid
    public static func validateChecksum(rawVatNumber: String?) -> Bool {
        return ChecksumValidator.validate(rawVatNumber: rawVatNumber)
    }
    
    /// Validate a VAT number against an online service.
    /// For European countries, https://ec.europa.eu/taxation_customs/vies is used.
    /// For Great Britain, https://api.service.hmrc.gov.uk is used.
    /// - Parameters:
    ///   - vatNumber: A raw VAT number
    ///   - completionHandler: Callback
    public static func validateOnline(vatNumber: String?, completionHandler: @escaping ((Result<ValidationServiceOutput, Error>) -> Void)) {
        guard let vatNumber = VatNumber(rawVatNumber: vatNumber) else {
            completionHandler(.success(ValidationServiceOutput(isValid: false, validationMessages: [.vatNumberIsNilOrEmpty], metaData: nil)))
            return
        }
        
        let validationService = ValidationService(urlSession: URLSession.shared)
        validationService.validate(vatNumber: vatNumber, completionHandler: completionHandler)
    }
    
    private static func validateFormat(rawVatNumber: String?, vatNumber: VatNumber) -> ValidationOutput {
        for regex in vatNumber.country.regexPatterns {
            
            let pattern = "\\b\(regex)\\b"
            
            if #available(macOS 13.0, *), #available(iOS 16.0, *) {
                do {
                    let regex = try Regex(pattern)
                    
                    if vatNumber.fullVatNumber.firstMatch(of: regex) != nil {
                        return ValidationOutput(rawVatNumber: rawVatNumber, vatNumber: vatNumber, isValid: true)
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
                    let regex = try NSRegularExpression(pattern: pattern)
                    let range = NSRange(location: 0, length: vatNumber.fullVatNumber.utf16.count)

                    guard regex.firstMatch(in: vatNumber.fullVatNumber, range: range) != nil else {
                        continue
                    }

                    return ValidationOutput(rawVatNumber: rawVatNumber, vatNumber: vatNumber, isValid: true)
                }
                catch {
                    assertionFailure("Regex resolve failed. This should never happen.")
                    continue
                }
            }
        }
        
        return ValidationOutput(rawVatNumber: rawVatNumber, vatNumber: vatNumber, isValid: false)
    }
    
}
