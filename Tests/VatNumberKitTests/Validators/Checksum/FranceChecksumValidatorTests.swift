//
//  FranceChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 06/02/2023.
//

import XCTest
@testable import VatNumberKit

final class FranceChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidFranceVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "FR00300076965")
        XCTAssertTrue(sut)
    }
    
    func testValidFranceVatNumber2() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "FRK7399859412")
        XCTAssertTrue(sut)
    }
    
    func testValidFranceVatNumber3() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "FR4Z123456782")
        XCTAssertTrue(sut)
    }
    
    func testValidFranceVatNumber4() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "FR83404833048")
        XCTAssertTrue(sut)
    }
        
    func testInvalidFranceVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "FR0030007696A")
        XCTAssertFalse(sut)
    }
    
    func testInvalidFranceVatNumberWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "FR4585A")
        XCTAssertFalse(sut)
    }

}
