//
//  PortugalChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import XCTest
@testable import VatNumberKit

final class PortugalChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidPolandTemporaryVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "PT502757191")
        XCTAssertTrue(sut)
    }
    
    func testInvalidPolandVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "PT502757852")
        XCTAssertFalse(sut)
    }
    
    func testInvalidPolandVatNumberWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "PT846A")
        XCTAssertFalse(sut)
    }

}
