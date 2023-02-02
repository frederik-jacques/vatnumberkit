//
//  EuropeanEntityVatNumberTests.swift
//  
//
//  Created by Frederik Jacques on 17/12/2022.
//

import XCTest
@testable import VatNumberKit

final class EuropeanEntityVatNumberTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidEuropeanEntityVatNumber() throws {
        let expectedValidationResult = true
        
        let sut = VatNumberKit.parse(country: .europeanEntity, number: "123456789")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }
    
    func testInvalidEuropeanEntityVatNumberWithNotEnoughDigits() throws {
        let expectedValidationResult = false
        
        let sut = VatNumberKit.parse(country: .europeanEntity, number: "12345678")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }
    
    func testInvalidEuropeanEntityVatNumberWithTooManyDigits() throws {
        let expectedValidationResult = false
        
        let sut = VatNumberKit.parse(country: .europeanEntity, number: "1234567890")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }

}