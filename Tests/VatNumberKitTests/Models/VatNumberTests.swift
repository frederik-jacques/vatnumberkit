//
//  VatNumberTests.swift
//  
//
//  Created by Frederik Jacques on 17/12/2022.
//

import XCTest
@testable import VatNumberKit

final class VatNumberTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCreateVatNumberWithNilValueReturnsNil() throws {
        let sut = VatNumberKit.VatNumber(vatNumber: nil)
        XCTAssertNil(sut)
    }
    
    func testCreateVatNumberWithEmptyStringReturnsNil() throws {
        let sut = VatNumberKit.VatNumber(vatNumber: "")
        XCTAssertNil(sut)
    }
    
    func testCreateVatNumberWithStringWithOnlySpacesReturnsNil() throws {
        let sut = VatNumberKit.VatNumber(vatNumber: "        ")
        XCTAssertNil(sut)
    }
    
    func testCreateVatNumberWithValidBelgianVatNumberWith10Digits() throws {
        let expectedCountry: VatNumberKit.Country = .belgium
        let expectedNumber = "0651634023"
        
        let sut = VatNumberKit.VatNumber(vatNumber: "BE0651634023")
        
        XCTAssertEqual(sut?.country, expectedCountry)
        XCTAssertEqual(sut?.number, expectedNumber)
    }
    
    func testCreateVatNumberWithValidBelgianVatNumberWith9DigitsWillPrependAZero() throws {
        let expectedCountry: VatNumberKit.Country = .belgium
        let expectedNumber = "0651634023"
        
        let sut = VatNumberKit.VatNumber(vatNumber: "BE651634023")
        
        XCTAssertEqual(sut?.country, expectedCountry)
        XCTAssertEqual(sut?.number, expectedNumber)
    }
    
    func testCreateVatNumberWithInvalidCountryCodeReturnsNil() throws {
        let sut = VatNumberKit.VatNumber(vatNumber: "XX651634023")
    
        XCTAssertNil(sut)
    }
    
    func testCreateVatNumberWithValidBelgianVatNumberWhichContainsDotsAndSpaces() throws {
        let expectedCountry: VatNumberKit.Country = .belgium
        let expectedNumber = "0651634023"
        
        let sut = VatNumberKit.VatNumber(vatNumber: "BE 651.634.023")
        
        XCTAssertEqual(sut?.country, expectedCountry)
        XCTAssertEqual(sut?.number, expectedNumber)
    }
    
}
