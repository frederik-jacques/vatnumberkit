//
//  NetherlandsVatNumberTests.swift
//  
//
//  Created by Frederik Jacques on 17/12/2022.
//

import XCTest
@testable import VatNumberKit

final class NetherlandsVatNumberTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidDutchVatNumber() throws {
        let expectedValidationResult = true
        
        let sut = VatNumberKit.validateFormat(country: .netherlands, number: "123456789B01")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }

    func testInvaliDutchVatNumberWithOtherLetterThanB() throws {
        let expectedValidationResult = false
        
        let sut = VatNumberKit.validateFormat(country: .netherlands, number: "123456789C01")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }
    
    func testInvaliDutchVatNumberWithNotEnoughDigits() throws {
        let expectedValidationResult = false
        
        let sut = VatNumberKit.validateFormat(country: .netherlands, number: "1234567")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }
    
    func testInvalidDutchVatNumberWithTooManyDigits() throws {
        let expectedValidationResult = false
        
        let sut = VatNumberKit.validateFormat(country: .netherlands, number: "123456789")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }

}
