//
//  VatNumberKit_EUVatServiceResponse.swift
//  
//
//  Created by Frederik Jacques on 17/12/2022.
//

import Foundation

extension VatNumberKit {
    
    struct EUVatServiceResponse: Codable {
        
        enum CodingKeys: String, CodingKey {
            case isValid
            case name
            case address
            case vatNumber
            case userError
        }
        
        let isValid: Bool
        let name: String
        let address: String
        let vatNumber: String
        let userError: String
        
        var isServiceUnderMaintenance: Bool { return userError != "VALID" && userError != "INVALID" }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.isValid = try container.decode(Bool.self, forKey: .isValid)
            self.name = try container.decode(String.self, forKey: .name)
            self.address = try container.decode(String.self, forKey: .address)
            self.vatNumber = try container.decode(String.self, forKey: .vatNumber)
            self.userError = try container.decode(String.self, forKey: .userError)
        }
        
    }
    
}
