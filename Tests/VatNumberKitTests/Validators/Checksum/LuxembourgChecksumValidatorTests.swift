//
//  LuxembourgChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import XCTest
@testable import VatNumberKit

final class LuxembourgChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidLuxembourgTemporaryVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "LU10000356")
        XCTAssertTrue(sut)
    }
    
    func testInvalidLuxembourgVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "LU10000357")
        XCTAssertFalse(sut)
    }
    
    func testInvalidLuxembourgVatNumberWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "LU846A")
        XCTAssertFalse(sut)
    }

}
