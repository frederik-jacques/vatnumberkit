//
//  Mocks.swift
//  
//
//  Created by Frederik Jacques on 17/12/2022.
//

import Foundation

enum Mocks: String {
    case euValidResponse = "eu_valid_response.json"
    case euInvalidResponse = "eu_invalid_response.json"
    case ukValidResponse = "uk_valid_response.json"
    case ukCompanyNotRegistered = "uk_company_not_registered.json"
    
    var url: URL {
        let thisSourceFile = URL(fileURLWithPath: #file)
        let thisDirectory = thisSourceFile.deletingLastPathComponent()
        return thisDirectory.appendingPathComponent("Mocks/\(self.rawValue)")
    }

    func getData() throws -> Data {
        return try Data(contentsOf: self.url)
    }
}
