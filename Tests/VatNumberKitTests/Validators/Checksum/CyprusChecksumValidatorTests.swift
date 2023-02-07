//
//  CyprusChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 04/02/2023.
//

import XCTest
@testable import VatNumberKit

final class CyprusChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidCyprusVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "CY00532445O")
        XCTAssertTrue(sut)
    }
    
    func testInvalidCyprusVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "CY00532442A")
        XCTAssertFalse(sut)
    }
    
    func testInvalidCyprusVatNumberWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "CY0042A")
        XCTAssertFalse(sut)
    }

}
