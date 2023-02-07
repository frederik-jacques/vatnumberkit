//
//  EstoniaChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 06/02/2023.
//

import XCTest
@testable import VatNumberKit

final class EstoniaChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidEstoniaVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "EE100207415")
        XCTAssertTrue(sut)
    }
    
    func testInvalidEstoniaVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "EE1002074")
        XCTAssertFalse(sut)
    }
    
    func testInvalidEstoniaVatNumberWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "EE846A")
        XCTAssertFalse(sut)
    }
    
}
