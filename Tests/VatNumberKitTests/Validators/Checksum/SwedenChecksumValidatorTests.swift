//
//  SwedenChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import XCTest
@testable import VatNumberKit

final class SwedenChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidSwedenVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "SE556188840401")
        XCTAssertTrue(sut)
    }
    
    func testInvalidSwedenVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "SE556188840400")
        XCTAssertFalse(sut)
    }
    
    func testInvalidSwedenVatNumberWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "SE846A")
        XCTAssertFalse(sut)
    }

}
