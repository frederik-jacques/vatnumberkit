//
//  LatviaChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import XCTest
@testable import VatNumberKit

final class LatviaChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidLatviaVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "LV40003009497")
        XCTAssertTrue(sut)
    }
    
    func testInvalidLatviaVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "LV40013009497")
        XCTAssertFalse(sut)
    }
    
    func testInvalidLatviaVatNumberWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "LV846A")
        XCTAssertFalse(sut)
    }

}
