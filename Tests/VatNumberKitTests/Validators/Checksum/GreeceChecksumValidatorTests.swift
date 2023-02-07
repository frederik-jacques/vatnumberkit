//
//  GreeceChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import XCTest
@testable import VatNumberKit

final class GreeceChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testValidGreeceVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "EL040127797")
        XCTAssertTrue(sut)
    }
    
    func testInvalidGreeceVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "EL040127796")
        XCTAssertFalse(sut)
    }
    
    func testInvalidGreeceVatNumberWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "EL846A")
        XCTAssertFalse(sut)
    }

}
