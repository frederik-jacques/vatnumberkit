//
//  BulgariaChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 04/02/2023.
//

import XCTest
@testable import VatNumberKit

final class BulgariaChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidBulgarianBusinessVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "BG175074752")
        XCTAssertTrue(sut)
    }
    
    func testValidBulgarianBusinessVatNumberWithSecondWeightedSum() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "BG301004503")
        XCTAssertTrue(sut)
    }
    
    func testValidBulgarianBusinessVatNumberWithSecondWeightedSum2() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "BG131272009")
        XCTAssertTrue(sut)
    }
    
    func testInvalidBulgarianBusinessVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "BG301004502")
        XCTAssertFalse(sut)
    }
    
    func testInvalidBulgarianVatWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "BG30502")
        XCTAssertFalse(sut)
    }

    func testValidBulgarianNaturalPersonVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "BG7501020018")
        XCTAssertTrue(sut)
    }
    
    func testValidBulgarianNaturalPersonVatNumber2() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "BG8001010008")
        XCTAssertTrue(sut)
    }
    
    func testValidBulgarianNaturalPersonVatNumber3() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "BG8032056031")
        XCTAssertTrue(sut)
    }
    
    func testValidBulgarianForeignerVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "BG7111042925")
        XCTAssertTrue(sut)
    }
    
}
