//
//  IrelandVatNumberTests.swift
//  
//
//  Created by Frederik Jacques on 17/12/2022.
//

import XCTest
@testable import VatNumberKit

final class IrelandVatNumberTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidIrishVatNumberWith1AlphabeticalCharacterAsSuffix() throws {
        let expectedValidationResult = true
        
        let sut = VatNumberKit.validateFormat(country: .ireland, number: "1234567A")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.isValid, expectedValidationResult)
    }
    
    func testValidIrishVatNumberWith2AlphabeticalCharactersAsSuffix() throws {
        let expectedValidationResult = true
        
        let sut = VatNumberKit.validateFormat(country: .ireland, number: "7234567AH")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.isValid, expectedValidationResult)
    }
    
    func testValidIrishVatNumberWithAlphabeticalCharacterAtPosition2AndAtTheEnd() throws {
        let expectedValidationResult = true
        
        let sut = VatNumberKit.validateFormat(country: .ireland, number: "7A23456A")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.isValid, expectedValidationResult)
    }
    
    func testInvalidIrishVatNumberWithNotEnoughDigits() throws {
        let expectedValidationResult = false
        
        let sut = VatNumberKit.validateFormat(country: .ireland, number: "1234567")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.isValid, expectedValidationResult)
    }
    
    func testInvalidIrishVatNumberWithTooManyDigits() throws {
        let expectedValidationResult = false
        
        let sut = VatNumberKit.validateFormat(country: .ireland, number: "123456789")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut.isValid, expectedValidationResult)
    }

}
