//
//  CzechRepublicChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 04/02/2023.
//

import XCTest
@testable import VatNumberKit

final class CzechRepublicChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testValidCzechRepublicBusinessVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "CZ46505334")
        XCTAssertTrue(sut)
    }
    
    func testValidCzechRepublicIndividual10DigitsVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "CZ7103192745")
        XCTAssertTrue(sut)
    }
    
    func testValidCzechRepublicIndividual9DigitsSpecialCaseVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "CZ640903926")
        XCTAssertTrue(sut)
    }
    
    func testValidCzechRepublicIndividual9DigitsVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "CZ395601439")
        XCTAssertTrue(sut)
    }
    
    func testInvalidCzechRepublicVatNumber() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "CZ00532442")
        XCTAssertFalse(sut)
    }
    
    func testInvalidCzechRepublicVatNumberWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "CZ0042A")
        XCTAssertFalse(sut)
    }
    
}
