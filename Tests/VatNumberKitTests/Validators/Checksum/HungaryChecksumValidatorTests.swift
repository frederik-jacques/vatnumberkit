//
//  HungaryChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import XCTest
@testable import VatNumberKit

final class HungarChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidHungaryVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "HU21376414")
        XCTAssertTrue(sut)
    }
    
    func testValidHungaryVatNumber2() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "HU10597190")
        XCTAssertTrue(sut)
    }
    
    func testInvalidHungaryVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "HU10597191")
        XCTAssertFalse(sut)
    }
    
    func testInvalidHungaryVatNumberWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "HU846A")
        XCTAssertFalse(sut)
    }

}
