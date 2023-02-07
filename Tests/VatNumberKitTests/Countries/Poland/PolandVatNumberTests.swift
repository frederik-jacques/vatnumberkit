//
//  PolandVatNumberTests.swift
//  
//
//  Created by Frederik Jacques on 17/12/2022.
//

import XCTest
@testable import VatNumberKit

final class PolandVatNumberTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidPolishVatNumber() throws {
        let expectedValidationResult = true
        
        let sut = VatNumberKit.validateFormat(country: .poland, number: "1234567890")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }
    
    func testInvalidPolishVatNumberWithNotEnoughDigits() throws {
        let expectedValidationResult = false
        
        let sut = VatNumberKit.validateFormat(country: .poland, number: "123456789")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }
    
    func testInvalidPolishVatNumberWithTooManyDigits() throws {
        let expectedValidationResult = false
        
        let sut = VatNumberKit.validateFormat(country: .poland, number: "12345678901")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }

}
