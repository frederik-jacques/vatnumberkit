//
//  CroatiaChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 04/02/2023.
//

import XCTest
@testable import VatNumberKit

final class CroatiaChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidCroatiaVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "HR38192148118")
        XCTAssertTrue(sut)
    }
    
    func testInvalidCroatiaVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "HR3819214811")
        XCTAssertFalse(sut)
    }
    
    func testInvalidCroatiaVatNumberWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "HR381811")
        XCTAssertFalse(sut)
    }

}
