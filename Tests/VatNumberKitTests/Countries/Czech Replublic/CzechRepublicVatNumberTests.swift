//
//  CzechRepublicVatNumberTests.swift
//  
//
//  Created by Frederik Jacques on 17/12/2022.
//

import XCTest
@testable import VatNumberKit

final class CzechRepublicVatNumberTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidCzechRepublicVatNumberWith8Digits() throws {
        let expectedValidationResult = true
        
        let sut = VatNumberKit.validateFormat(country: .czechRepublic, number: "12345678")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.isValid, expectedValidationResult)
    }
    
    func testValidCzechRepublicVatNumberWith9Digits() throws {
        let expectedValidationResult = true
        
        let sut = VatNumberKit.validateFormat(country: .czechRepublic, number: "121212345")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.isValid, expectedValidationResult)
    }
    
    func testValidCzechRepublicVatNumberWith10Digits() throws {
        let expectedValidationResult = true
        
        let sut = VatNumberKit.validateFormat(country: .czechRepublic, number: "1225212345")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.isValid, expectedValidationResult)
    }
    
    func testInvalidCzechRepublicVatNumberWithNotEnoughDigits() throws {
        let expectedValidationResult = false
        
        let sut = VatNumberKit.validateFormat(country: .czechRepublic, number: "1234567")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.isValid, expectedValidationResult)
    }
    
    func testInvalidCzechRepublicVatNumberWithTooManyDigits() throws {
        let expectedValidationResult = false
        
        let sut = VatNumberKit.validateFormat(country: .czechRepublic, number: "12345678901")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.isValid, expectedValidationResult)
    }

}
