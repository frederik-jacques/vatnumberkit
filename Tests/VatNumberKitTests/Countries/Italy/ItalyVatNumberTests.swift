//
//  ItalyVatNumberTests.swift
//  
//
//  Created by Frederik Jacques on 17/12/2022.
//

import XCTest
@testable import VatNumberKit

final class ItalyVatNumberTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidItalianVatNumber() throws {
        let expectedValidationResult = true
        
        let sut = VatNumberKit.validateFormat(country: .italy, number: "12345678901")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.isValid, expectedValidationResult)
    }

    func testInvalidItalianVatNumberWithNotEnoughDigits() throws {
        let expectedValidationResult = false
        
        let sut = VatNumberKit.validateFormat(country: .italy, number: "1234567890")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.isValid, expectedValidationResult)
    }
    
    func testInvalidItalianVatNumberWithTooManyDigits() throws {
        let expectedValidationResult = false
        
        let sut = VatNumberKit.validateFormat(country: .italy, number: "123456789012")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.isValid, expectedValidationResult)
    }
    
}
