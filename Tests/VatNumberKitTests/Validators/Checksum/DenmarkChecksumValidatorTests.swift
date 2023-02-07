//
//  DenmarkChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 05/02/2023.
//

import XCTest
@testable import VatNumberKit

final class DenmarkChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidDenmarkVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "DK88146328")
        XCTAssertTrue(sut)
    }
    
    func testInvalidDenmarkVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "DK12385297")
        XCTAssertFalse(sut)
    }
    
    func testInvalidDenmarkVatNumberWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "DK0042A")
        XCTAssertFalse(sut)
    }

}
