//
//  NetherlandsChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import XCTest
@testable import VatNumberKit

final class NetherlandsChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidNetherlandsVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "NL010000446B01")
        XCTAssertTrue(sut)
    }
    
    func testValidNetherlandsVatNumber2() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "NL002342672B42")
        XCTAssertTrue(sut)
    }
    
    func testInvalidNetherlandsVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "NL010000436B01")
        XCTAssertFalse(sut)
    }
    
    func testInvalidNetherlandsVatNumberWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "NL846A")
        XCTAssertFalse(sut)
    }

}
