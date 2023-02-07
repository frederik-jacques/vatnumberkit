//
//  VatNumberKit_ValidationService.swift
//  
//
//  Created by Frederik Jacques on 17/12/2022.
//

import Foundation

public extension VatNumberKit {
    
    enum ValidationServiceError: Error {
        case invalidUrl
        case invalidUrlResponse
        case invalidJsonResponse
        case validationServiceDown
        case vatNumberDoesNotMatchRegisteredCompany
        case vatNumberHasIncorrectNumberOfDigits
    }
    
    struct ValidationService {
        
        private let urlSession: URLSession
        
        init(urlSession: URLSession) {
            self.urlSession = urlSession
        }
        
        func validate(vatNumber: VatNumber, completionHandler: @escaping ((Result<ValidationServiceOutput, Error>) -> Void)) {
            if vatNumber.country.isGreatBritain {
                return validateWithUkVatService(vatNumber: vatNumber, completionHandler: completionHandler)
            }
            else {
                return validateWithEuropeanVatService(vatNumber: vatNumber, completionHandler: completionHandler)
            }
        }
        
        private func validateWithUkVatService(vatNumber: VatNumber, completionHandler: @escaping ((Result<ValidationServiceOutput, Error>) -> Void)) {
            guard let url = URL(string: "https://api.service.hmrc.gov.uk/organisations/vat/check-vat-number/lookup/\(vatNumber.number)") else {
                completionHandler(.failure(ValidationServiceError.invalidUrl))
                return
            }
            
            let task = urlSession.dataTask(with: url, completionHandler: { (data, response, error) in
                guard error == nil else {                    
                    completionHandler(.failure(error!))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    completionHandler(.failure(ValidationServiceError.invalidUrlResponse))
                    return
                }
                
                // If the VAT number has an incorrect number of digits (not 9 or 12),
                // the service returns a 400 (Bad Request) response.
                guard httpResponse.statusCode != 400 else {
                    completionHandler(.success(ValidationServiceOutput(isValid: false, validationMessages: [.ukVatNumberHasIncorrectNumberOfDigits], metaData: nil)))
                    return
                }
                
                // If the VAT number has the correct length, but does not match a registered company,
                // the service returns a 404 (Not Found) response.
                guard httpResponse.statusCode != 404 else {
                    completionHandler(.success(ValidationServiceOutput(isValid: false, validationMessages: [.ukVatNumberDoesNotMatchRegisteredCompany], metaData: nil)))
                    return
                }
                
                guard let jsonData = data else {
                    completionHandler(.failure(ValidationServiceError.invalidJsonResponse))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let vatServiceData = try decoder.decode(UkVatServiceResponse.self, from: jsonData)
                    
                    let metaData = ValidationServiceOutput.MetaData(name: vatServiceData.target.name, address: vatServiceData.target.address.addressText)
                    let output = ValidationServiceOutput(isValid: true, validationMessages: [], metaData: metaData)
                    
                    completionHandler(.success(output))
                }
                catch let error {
                    completionHandler(.failure(error))
                }
            })
            
            task.resume()
        }
        
        private func validateWithEuropeanVatService(vatNumber: VatNumber, completionHandler: @escaping ((Result<ValidationServiceOutput, Error>) -> Void)) {
            guard let url = URL(string: "https://ec.europa.eu/taxation_customs/vies/rest-api/ms/\(vatNumber.country.rawValue)/vat/\(vatNumber.number)") else {
                completionHandler(.failure(ValidationServiceError.invalidUrl))
                return
            }
            
            let task = urlSession.dataTask(with: url, completionHandler: { (data, response, error) in
                guard error == nil else {
                    completionHandler(.failure(error!))
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    completionHandler(.failure(ValidationServiceError.invalidUrlResponse))
                    return
                }
                
                guard (200...299).contains(httpResponse.statusCode) else {
                    completionHandler(.failure(ValidationServiceError.validationServiceDown))
                    return
                }
                
                guard let jsonData = data else {
                    completionHandler(.failure(ValidationServiceError.invalidJsonResponse))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let vatServiceData = try decoder.decode(EUVatServiceResponse.self, from: jsonData)
                    
                    if vatServiceData.isServiceUnderMaintenance {
                        completionHandler(.failure(ValidationServiceError.validationServiceDown))
                    }
                    else {
                        let metaData = ValidationServiceOutput.MetaData(name: vatServiceData.name, address: vatServiceData.address)
                        let serviceOutput = ValidationServiceOutput(isValid: vatServiceData.isValid, validationMessages: [], metaData: metaData)
                        
                        completionHandler(.success(serviceOutput))
                    }
                }
                catch let error {
                    completionHandler(.failure(error))
                }                
            })
            
            task.resume()
        }
        
    }
    
}
