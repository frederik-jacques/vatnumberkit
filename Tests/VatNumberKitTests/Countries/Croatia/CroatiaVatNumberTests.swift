//
//  CroatiaVatNumberTests.swift
//  
//
//  Created by Frederik Jacques on 17/12/2022.
//

import XCTest
@testable import VatNumberKit

final class CroatiaVatNumberTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidCroatianVatNumber() throws {
        let expectedValidationResult = true
        
        let sut = VatNumberKit.validateFormat(country: .croatia, number: "01234567891")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }

    func testInvalidCroatianVatNumberWithTooManyDigits() throws {
        let expectedValidationResult = false
        
        let sut = VatNumberKit.validateFormat(country: .croatia, number: "012345678912")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }
    
    func testInvalidCroatianVatNumberWithNotEnoughDigits() throws {
        let expectedValidationResult = false
        
        let sut = VatNumberKit.validateFormat(country: .croatia, number: "01234567")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }
    
}
