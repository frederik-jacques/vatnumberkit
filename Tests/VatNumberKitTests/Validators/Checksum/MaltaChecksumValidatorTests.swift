//
//  MaltaChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import XCTest
@testable import VatNumberKit

final class MaltaChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidMaltaTemporaryVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "MT15121333")
        XCTAssertTrue(sut)
    }
    
    func testInvalidMaltaVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "MT15121332")
        XCTAssertFalse(sut)
    }
    
    func testInvalidMaltaVatNumberWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "MT846A")
        XCTAssertFalse(sut)
    }

}
