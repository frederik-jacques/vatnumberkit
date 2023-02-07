//
//  LithuaniaChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import XCTest
@testable import VatNumberKit

final class LithuaniaChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidLithuaniaTemporaryVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "LT210061371310")
        XCTAssertTrue(sut)
    }
    
    func testValidLithuaniaTemporaryVatNumber2() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "LT290061371314")
        XCTAssertTrue(sut)
    }
    
    func testValidLithuaniaLegalVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "LT213179412")
        XCTAssertTrue(sut)
    }
    
    func testValidLithuaniaLegalVatNumber2() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "LT208640716")
        XCTAssertTrue(sut)
    }
    
    func testInvalidLithuaniaVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "LT213179422")
        XCTAssertFalse(sut)
    }
    
    func testInvalidLithuaniaVatNumberWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "LT846A")
        XCTAssertFalse(sut)
    }

}
