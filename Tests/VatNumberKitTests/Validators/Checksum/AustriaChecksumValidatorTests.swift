//
//  AustriaChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 05/02/2023.
//

import XCTest
@testable import VatNumberKit

final class AustriaChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidAustriaVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "ATU10223006")
        XCTAssertTrue(sut)
    }
    
    func testInvalidAustriaVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "ATU1022300")
        XCTAssertFalse(sut)
    }
    
    func testInvalidAustriaVatNumberWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "AT0042A")
        XCTAssertFalse(sut)
    }

}
