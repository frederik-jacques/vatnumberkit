//
//  FinlandVatNumberTests.swift
//  
//
//  Created by Frederik Jacques on 17/12/2022.
//

import XCTest
@testable import VatNumberKit

final class FinlandVatNumberTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidFinnishVatNumber() throws {
        let expectedValidationResult = true
        
        let sut = VatNumberKit.validateFormat(country: .finland, number: "12345678")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }

    func testInvalidFinnishVatNumberWithNotEnoughDigits() throws {
        let expectedValidationResult = false
        
        let sut = VatNumberKit.validateFormat(country: .finland, number: "1234567")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }
    
    func testInvalidFinnishVatNumberWithTooManyDigits() throws {
        let expectedValidationResult = false
        
        let sut = VatNumberKit.validateFormat(country: .finland, number: "123456789")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }

}
