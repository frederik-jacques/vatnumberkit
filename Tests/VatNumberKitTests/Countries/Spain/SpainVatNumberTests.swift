//
//  SpainVatNumberTests.swift
//  
//
//  Created by Frederik Jacques on 17/12/2022.
//

import XCTest
@testable import VatNumberKit

final class SpainVatNumberTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidSpanishVatNumberWith8DigitsAndCharacterAsSuffix() throws {
        let expectedValidationResult = true
        
        let sut = VatNumberKit.parse(country: .spain, number: "12345678A")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }
    
    func testValidSpanishVatNumberWithCharacterAtStart7DigitsAndCharacterAsSuffix() throws {
        let expectedValidationResult = true
        
        let sut = VatNumberKit.parse(country: .spain, number: "A1234567A")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }
    
    func testValidSpanishVatNumberWithCharacterAtStartAnd8Digits() throws {
        let expectedValidationResult = true
        
        let sut = VatNumberKit.parse(country: .spain, number: "A12345678")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }
    
    func testInvalidSpanishVatNumberWithNotEnoughDigits() throws {
        let expectedValidationResult = false
        
        let sut = VatNumberKit.parse(country: .spain, number: "1234567")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }
    
    func testInvalidSpanishVatNumberWithTooManyDigits() throws {
        let expectedValidationResult = false
        
        let sut = VatNumberKit.parse(country: .spain, number: "123456789")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }

}
