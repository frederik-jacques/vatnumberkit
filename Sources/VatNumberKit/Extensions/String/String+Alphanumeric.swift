//
//  String+Alphanumeric.swift
//  
//
//  Created by Frederik Jacques on 17/12/2022.
//

import Foundation

public extension String {
    
    /// Returns a string without diacritics (à => a, o => ö => o, ...)
    var withoutDiacritics: String {
        return folding(options: .diacriticInsensitive, locale: nil)
    }
    
    /// Returns the alphanumeric version of the string, removing all special characters.
    /// Only leaving letters and numbers
    var alphanumeric: String {
        let alphanumericCharacterSet = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890")
        
        return components(separatedBy: alphanumericCharacterSet.inverted).joined()
    }
    
}
