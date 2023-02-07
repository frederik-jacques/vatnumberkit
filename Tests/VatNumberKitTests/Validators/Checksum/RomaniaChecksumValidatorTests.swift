//
//  RomaniaChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import XCTest
@testable import VatNumberKit

final class RomaniaChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidRomaniaVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "RO0011198699")
        XCTAssertTrue(sut)
    }
    
    func testValidRomaniaVatNumber2() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "RO0014186770")
        XCTAssertTrue(sut)
    }
    
    func testInvalidRomaniaVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "RO11198698")
        XCTAssertFalse(sut)
    }
    
    func testInvalidRomaniaVatNumberWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "RO846A")
        XCTAssertFalse(sut)
    }

}
