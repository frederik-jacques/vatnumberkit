//
//  FinlandChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 06/02/2023.
//

import XCTest
@testable import VatNumberKit

final class FinlandChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidFinlandVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "FI09853608")
        XCTAssertTrue(sut)
    }
    
    func testValidFinlandVatNumber2() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "FI01089940")
        XCTAssertTrue(sut)
    }
    
    func testInvalidFinlandVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "FI09853607")
        XCTAssertFalse(sut)
    }
    
    func testInvalidFinlandVatNumberWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "FI846A")
        XCTAssertFalse(sut)
    }

}
