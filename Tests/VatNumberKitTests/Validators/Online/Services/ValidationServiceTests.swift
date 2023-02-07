//
//  ValidationServiceTests.swift
//  
//
//  Created by Frederik Jacques on 17/12/2022.
//

import Foundation

import XCTest
@testable import VatNumberKit

final class ValidationServiceTests: XCTestCase {
    
    var urlSession: URLSession!
    var mockService: VatNumberKit.ValidationService!
    
    override func setUpWithError() throws {
        let configuration = URLSessionConfiguration.ephemeral
        configuration.protocolClasses = [MockUrlProtocol.self]
        urlSession = URLSession(configuration: configuration)
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testEuropeanServiceReturnsValidResult() throws {
        let data = try Mocks.euValidResponse.getData()
        
        MockUrlProtocol.requestHandler = { request in
            return (HTTPURLResponse(), data)
        }
        
        let vatNumber = VatNumberKit.VatNumber(country: .belgium, number: "0651634023")!
        
        mockService = VatNumberKit.ValidationService(urlSession: urlSession)
        let expectation = XCTestExpectation(description: "I expect the European validation service to return a valid valid VAT number.")
        
        mockService.validate(vatNumber: vatNumber) { result in
            switch result {
            case .success(let output):
                XCTAssertTrue(output.isValid)
                expectation.fulfill()

            case .failure:
                break
            }
        }
        
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testEuropeanServiceReturnsInvalidResult() throws {
        let data = try Mocks.euInvalidResponse.getData()
        
        MockUrlProtocol.requestHandler = { request in
            return (HTTPURLResponse(), data)
        }
        
        let vatNumber = VatNumberKit.VatNumber(country: .belgium, number: "0651634022")!
        
        mockService = VatNumberKit.ValidationService(urlSession: urlSession)
        let expectation = XCTestExpectation(description: "I expect the European validation service to return an invalid result for an invalid VAT number.")
        
        mockService.validate(vatNumber: vatNumber) { result in
            switch result {
            case .success(let output):
                XCTAssertFalse(output.isValid)
                expectation.fulfill()

            case .failure:
                break
            }
        }
        
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testUnitedKingdomServiceReturnsValidResult() throws {
        let data = try Mocks.ukValidResponse.getData()
        
        MockUrlProtocol.requestHandler = { request in
            return (HTTPURLResponse(), data)
        }
        
        let vatNumber = VatNumberKit.VatNumber(country: .greatBritain, number: "307477591")!
        
        mockService = VatNumberKit.ValidationService(urlSession: urlSession)
        let expectation = XCTestExpectation(description: "I expect the United Kingdom validation service to return an valid result for a valid VAT number.")
        
        mockService.validate(vatNumber: vatNumber) { result in
            switch result {
            case .success(let output):
                XCTAssertTrue(output.isValid)
                expectation.fulfill()

            case .failure:
                break
            }
        }
        
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testUnitedKingdomServiceReturnsInvalidResultForACompanyThatIsNotRegistered() throws {
        let data = try Mocks.ukCompanyNotRegistered.getData()
        
        MockUrlProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: URL(string: "https://google.com")!, statusCode: 404, httpVersion: nil, headerFields: nil)!
            return (response, data)
        }
        
        let vatNumber = VatNumberKit.VatNumber(country: .greatBritain, number: "307477591")!
        
        mockService = VatNumberKit.ValidationService(urlSession: urlSession)
        let expectation = XCTestExpectation(description: "I expect the United Kingdom validation service to return an invalid result for a VAT number which has not company registered.")
        
        mockService.validate(vatNumber: vatNumber) { result in
            switch result {
            case .success(let output):
                XCTAssertFalse(output.isValid)
                expectation.fulfill()

            case .failure:
                break
            }
        }
        
        wait(for: [expectation], timeout: 3.0)
    }
    
}
