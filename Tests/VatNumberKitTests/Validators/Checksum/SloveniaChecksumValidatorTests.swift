//
//  SloveniaChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import XCTest
@testable import VatNumberKit

final class SloveniaChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidSloveniaVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "SI15012557")
        XCTAssertTrue(sut)
    }
    
    func testValidSloveniaVatNumber2() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "SI95796550")
        XCTAssertTrue(sut)
    }
    
    func testInvalidSloveniaVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "SI15012556")
        XCTAssertFalse(sut)
    }
    
    func testInvalidSloveniaVatNumberWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "SI846A")
        XCTAssertFalse(sut)
    }

}
