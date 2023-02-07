//
//  GreatBritainChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import XCTest
@testable import VatNumberKit

final class GreatBritainChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidGreatBritainStandardVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "GB434031494")
        XCTAssertTrue(sut)
    }
    
    func testValidGreatBritainBranchVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "GB242338087388")
        XCTAssertTrue(sut)
    }
    
    func testValidGreatBritainGovernmentVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "GBGD001")
        XCTAssertTrue(sut)
    }
    
    func testValidGreatBritainHealthAuthorityVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "GBHA500")
        XCTAssertTrue(sut)
    }
    
    func testInvalidGreatBritainVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "GB434031491")
        XCTAssertFalse(sut)
    }
    
    func testInvalidGreatBritainVatNumberWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(vatNumber: "GB846A")
        XCTAssertFalse(sut)
    }

}
