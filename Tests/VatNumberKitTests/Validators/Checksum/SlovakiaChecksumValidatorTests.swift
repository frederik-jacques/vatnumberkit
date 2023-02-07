//
//  SlovakiaChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import XCTest
@testable import VatNumberKit

final class SlovakiaChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidSlovakiaVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "SK4030000007")
        XCTAssertTrue(sut)
    }
    
    func testInvalidSlovakiaVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "SK4030000006")
        XCTAssertFalse(sut)
    }
    
    func testInvalidSlovakiaVatNumberWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "SK846A")
        XCTAssertFalse(sut)
    }

}
