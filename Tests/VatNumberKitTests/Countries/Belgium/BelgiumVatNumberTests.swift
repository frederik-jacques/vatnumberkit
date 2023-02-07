//
//  BelgiumVatNumberTests.swift
//  
//
//  Created by Frederik Jacques on 17/12/2022.
//

import XCTest
@testable import VatNumberKit

final class BelgiumVatNumberTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidBelgianVatNumber() throws {
        let expectedValidationResult = true
        
        let sut = VatNumberKit.validateFormat(country: .belgium, number: "0123456789")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.isValid, expectedValidationResult)
    }
    
    func testValidBelgianVatNumberWith9Digits() throws {
        let expectedValidationResult = true
        
        let sut = VatNumberKit.validateFormat(country: .belgium, number: "123456789")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.isValid, expectedValidationResult)
    }
    
    func testInvalidBelgianVatNumberWithLettersInIt() throws {
        let expectedValidationResult = false
        
        let sut = VatNumberKit.validateFormat(country: .belgium, number: "ABC123456789")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.isValid, expectedValidationResult)
    }
    
    func testInvalidBelgianVatNumberWithTooMuchNumbers() throws {
        let expectedValidationResult = false
        
        let sut = VatNumberKit.validateFormat(country: .belgium, number: "123456789123")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.isValid, expectedValidationResult)
    }
    
    func testValidBelgianVatNumberWithDotsFormatting() throws {
        let expectedValidationResult = true
        
        let sut = VatNumberKit.validateFormat(rawVatNumber: "BE 0651.634.023")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.isValid, expectedValidationResult)
    }
    
    func testValidBelgianVatNumberWithSpacesFormatting() throws {
        let expectedValidationResult = true
        
        let sut = VatNumberKit.validateFormat(rawVatNumber: "BE 0651 634 023")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.isValid, expectedValidationResult)
    }
    
    func testInvalidBelgianVatNumberWithNotEnoughNumbers() throws {
        let expectedValidationResult = false
        
        let sut = VatNumberKit.validateFormat(country: .belgium, number: "1234")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.isValid, expectedValidationResult)
    }

}
