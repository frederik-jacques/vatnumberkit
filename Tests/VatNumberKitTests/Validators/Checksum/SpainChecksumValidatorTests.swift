//
//  SpainChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import XCTest
@testable import VatNumberKit

final class SpainChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidSpainJuridicalEntityVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "ESA0011012B")
        XCTAssertTrue(sut)
    }
    
    func testValidSpainNationalEntityVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "ESA78304516")
        XCTAssertTrue(sut)
    }
    
    func testValidSpainPhysicalPersonVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "ESX5910266W")
        XCTAssertTrue(sut)
    }
    
    func testInvalidSpainVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "ESK0011012B")
        XCTAssertFalse(sut)
    }
    
    func testInvalidSpainVatNumberWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "ES846A")
        XCTAssertFalse(sut)
    }

}
