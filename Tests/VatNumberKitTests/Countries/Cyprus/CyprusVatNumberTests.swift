//
//  CyprusVatNumberTests.swift
//  
//
//  Created by Frederik Jacques on 17/12/2022.
//

import XCTest
@testable import VatNumberKit

final class CyprusVatNumberTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidCyprianVatNumber() throws {
        let expectedValidationResult = true
        
        let sut = VatNumberKit.parse(country: .cyprus, number: "12345678X")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }

    func testInvalidCyprianVatNumber() throws {
        let expectedValidationResult = false
        
        let sut = VatNumberKit.parse(country: .cyprus, number: "123456781")
        XCTAssertNotNil(sut)
        XCTAssertEqual(sut?.isValid, expectedValidationResult)
    }
    
}
