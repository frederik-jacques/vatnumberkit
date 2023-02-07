//
//  BelgiumChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 04/02/2023.
//

import XCTest
@testable import VatNumberKit

final class BelgiumChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidBelgianVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "BE0651634023")
        XCTAssertTrue(sut)
    }
    
    func testInvalidBelgianVatNumberWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "BE04021")
        XCTAssertFalse(sut)
    }
    
    func testInvalidBelgianVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "BE0651634021")
        XCTAssertFalse(sut)
    }

}
