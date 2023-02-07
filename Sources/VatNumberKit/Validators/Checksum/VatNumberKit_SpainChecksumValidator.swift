//
//  VatNumberKit_SpainChecksumValidator.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import Foundation

extension VatNumberKit {
    
    struct SpainChecksumValidator {
        
        static func validate(vatNumber: VatNumber) -> Bool {
            // Number needs to be 9 characters long
            guard vatNumber.number.count == 9 else { return false }
            
            // The 2nd till 8th character needs to be numeric
            guard Int(String(vatNumber.number[1..<8])) != nil else { return false }
            
            // The last digit serves as the check digit (it can be numeric or alphabetical)
            let checkDigit = vatNumber.number[8]
            
            let firstCharacter = vatNumber.number[0]
            
            // If the last character is a letter -> Juridical entities other than national ones
            if checkDigit.isLetter && ["A", "B", "C", "D", "E", "F", "G", "H", "N", "P", "Q", "R", "S", "W"].contains(firstCharacter) {
                return validateJuridicalEntity(vatNumber: vatNumber.number, checkDigit: String(checkDigit))
            }
            else if checkDigit.isLetter && ["K", "L", "M", "X", "Y", "Z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"].contains(firstCharacter) {
                return validatePhysicalPerson(vatNumber: vatNumber.number, checkDigit: String(checkDigit))
            }
            else {
                guard let checkDigit = Int(String(checkDigit)) else { return false }
                return validateNationalEntity(vatNumber: vatNumber.number, checkDigit: checkDigit)
            }
        }
        
        private static func validateJuridicalEntity(vatNumber: String, checkDigit: String) -> Bool {
            // Remove the first and last character
            let onlyDigits = String(vatNumber.dropFirst().dropLast(1))
            
            // Calculate the cross sum
            let crossSum = onlyDigits.reversed().enumerated().reduce(0) { partialResult, element in
                var updatedResult = partialResult
                
                guard let digit = Int(String(element.element)) else { return updatedResult }
                let isEven = element.offset % 2 == 0
                let valueToCrossSum = digit * (isEven ? 2 : 1)
                
                let crossSum = "\(valueToCrossSum)".compactMap { $0.wholeNumberValue }.reduce(0, +)
                updatedResult += crossSum
                
                return updatedResult
            }
            
            let checkValue = 10 - (crossSum % 10) - 1
            let clampedCheckValue = checkValue.clamped(lowerBound: 0, upperBound: 9)
            let possibleCheckDigits = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
            
            return possibleCheckDigits[clampedCheckValue] == checkDigit            
        }
        
        private static func validatePhysicalPerson(vatNumber: String, checkDigit: String) -> Bool {
            // If the first character of the VAT number is an X or an Y
            // we need to replace it with a 1 or 2.
            let updatedVatNumber: String
            
            if vatNumber[0] == "Y" {
                updatedVatNumber = "1" + vatNumber.dropFirst()
            }
            else if vatNumber[0] == "Z" {
                updatedVatNumber = "2" + vatNumber.dropFirst()
            }
            else {
                updatedVatNumber = vatNumber
            }
            
            let checkValueIndex: Int
            
            if updatedVatNumber[0].isNumber {
                guard let firstEightDigits = Int(String(updatedVatNumber.prefix(8))) else { return false }
                checkValueIndex = firstEightDigits % 23 + 1
            }
            else {
                guard let firstEightDigits = Int(String(updatedVatNumber.dropFirst().prefix(7))) else { return false }
                checkValueIndex = firstEightDigits % 23 + 1
            }
            
            let lookupDictionary = [
                1: "T",
                2: "R",
                3: "W",
                4: "A",
                5: "G",
                6: "M",
                7: "Y",
                8: "F",
                9: "P",
                10: "D",
                11: "X",
                12: "B",
                13: "N",
                14: "J",
                15: "Z",
                16: "S",
                17: "Q",
                18: "V",
                19: "H",
                20: "L",
                21: "C",
                22: "K",
                23: "E",
            ]
            
            guard let checkValue = lookupDictionary[checkValueIndex] else { return false }
            
            return checkValue == checkDigit
        }
        
        private static func validateNationalEntity(vatNumber: String, checkDigit: Int) -> Bool {
            // Remove the first and last character
            let onlyDigits = String(vatNumber.dropFirst().dropLast(1))
            
            // Calculate the cross sum
            let crossSum = onlyDigits.reversed().enumerated().reduce(0) { partialResult, element in
                var updatedResult = partialResult
                
                guard let digit = Int(String(element.element)) else { return updatedResult }
                let isEven = element.offset % 2 == 0
                let valueToCrossSum = digit * (isEven ? 2 : 1)
                
                let crossSum = "\(valueToCrossSum)".compactMap { $0.wholeNumberValue }.reduce(0, +)
                updatedResult += crossSum
                
                return updatedResult
            }
            
            let checkValue = 10 - (crossSum % 10)
            return checkValue % 10 == checkDigit
        }
        
    }
    
}
