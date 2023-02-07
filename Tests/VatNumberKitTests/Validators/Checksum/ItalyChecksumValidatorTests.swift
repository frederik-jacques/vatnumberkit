//
//  ItalyChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import XCTest
@testable import VatNumberKit

final class ItalyChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidItalyVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "IT00000010215")
        XCTAssertTrue(sut)
    }
    
    func testInvalidItalyVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "IT00000010214")
        XCTAssertFalse(sut)
    }
    
    func testInvalidItalyVatNumberWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "IT846A")
        XCTAssertFalse(sut)
    }

}
