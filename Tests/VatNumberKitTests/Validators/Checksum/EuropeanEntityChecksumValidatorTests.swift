//
//  EuropeanEntityChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 06/02/2023.
//

import XCTest
@testable import VatNumberKit

final class EuropeanEntityChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidEuropeanEntityVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "EU123456789")
        XCTAssertTrue(sut)
    }
    
    func testInvalidEuropeanEntityVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "EU2358243")
        XCTAssertFalse(sut)
    }
    
    func testInvalidEuropeanEntityVatNumberWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "EU846A")
        XCTAssertFalse(sut)
    }

}
