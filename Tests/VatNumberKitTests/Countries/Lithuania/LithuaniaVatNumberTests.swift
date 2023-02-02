//
//  LithuaniaVatNumberTests.swift
//  
//
//  Created by Frederik Jacques on 17/12/2022.
//

import XCTest
@testable import VatNumberKit

final class LithuaniaVatNumberTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidLithuanianVatNumberWith9Digits() throws {
        let expectedValidationResult = true
        
        let sut = VatNumberKit.parse(country: .lithuania, number: "123456789")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }
    
    func testValidLithuanianVatNumberWith12Digits() throws {
        let expectedValidationResult = true
        
        let sut = VatNumberKit.parse(country: .lithuania, number: "123456789012")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }
    
    func testInvalidLithuanianVatNumberWith10Digits() throws {
        let expectedValidationResult = false
        
        let sut = VatNumberKit.parse(country: .lithuania, number: "1234567890")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }
    
    func testInvalidLithuanianVatNumberWith11Digits() throws {
        let expectedValidationResult = false
        
        let sut = VatNumberKit.parse(country: .lithuania, number: "12345678901")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }

    func testInvalidLithuanianVatNumberWithNotEnoughDigits() throws {
        let expectedValidationResult = false
        
        let sut = VatNumberKit.parse(country: .lithuania, number: "12345678")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }
    
    func testInvalidLithuanianVatNumberWithTooManyDigits() throws {
        let expectedValidationResult = false
        
        let sut = VatNumberKit.parse(country: .lithuania, number: "1234567890123")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }
    
}
