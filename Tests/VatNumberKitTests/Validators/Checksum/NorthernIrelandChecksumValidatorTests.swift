//
//  NorthernIrelandChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import XCTest
@testable import VatNumberKit

final class NorthernIrelandChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidNorthernIrelandNormalVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "XI925901618")
        XCTAssertTrue(sut)
    }
    
    func testValidNorthernIrelandGovernmentVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "XIGD001")
        XCTAssertTrue(sut)
    }
    
    func testValidNorthernIrelandHealthAuthorityVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "XIHA500")
        XCTAssertTrue(sut)
    }
    
    func testInvalidNorthernIrelandVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "XI925901612")
        XCTAssertFalse(sut)
    }
    
    func testInvalidNorthernIrelandVatNumberWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "XI846A")
        XCTAssertFalse(sut)
    }

}
