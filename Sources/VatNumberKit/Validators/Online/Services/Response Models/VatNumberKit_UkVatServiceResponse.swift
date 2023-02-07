//
//  VatNumberKit_UkVatServiceResponse.swift
//  
//
//  Created by Frederik Jacques on 17/12/2022.
//

import Foundation

extension VatNumberKit {
    
    struct UkVatServiceResponse: Codable {
        
        struct Address: Codable {
            enum CodingKeys: String, CodingKey {
                case line1
                case line2
                case zipcode = "postcode"
                case countryCode
            }
            
            let line1: String
            let line2: String
            let zipcode: String
            let countryCode: String
            
            var addressText: String {
                return "\(line1) \(line2) \(zipcode) \(countryCode)"
            }
            
            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                
                self.line1 = try container.decode(String.self, forKey: .line1)
                self.line2 = try container.decode(String.self, forKey: .line2)
                self.zipcode = try container.decode(String.self, forKey: .zipcode)
                self.countryCode = try container.decode(String.self, forKey: .countryCode)
            }
            
        }
        
        struct Target: Codable {
            
            enum CodingKeys: String, CodingKey {
                case name
                case vatNumber
                case address
            }
            
            let name: String
            let vatNumber: String
            let address: Address
            
            init(from decoder: Decoder) throws {
                let container = try decoder.container(keyedBy: CodingKeys.self)
                
                self.name = try container.decode(String.self, forKey: .name)
                self.vatNumber = try container.decode(String.self, forKey: .vatNumber)
                self.address = try container.decode(Address.self, forKey: .address)
            }
        }
        
        enum CodingKeys: String, CodingKey {
            case target
        }
        
        let target: Target
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            
            self.target = try container.decode(Target.self, forKey: .target)
        }
        
    }
    
}
