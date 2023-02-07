//
//  GermanyChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import XCTest
@testable import VatNumberKit

final class GermanyChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidGermanyVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "DE111111125")
        XCTAssertTrue(sut)
    }
    
    func testInvalidGermanyVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "DE111111124")
        XCTAssertFalse(sut)
    }
    
    func testInvalidGermanyVatNumberWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "DE846A")
        XCTAssertFalse(sut)
    }

}
