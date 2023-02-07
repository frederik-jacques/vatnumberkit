//
//  IrishVatNumberConverterTests.swift
//  
//
//  Created by Frederik Jacques on 04/02/2023.
//

import XCTest
@testable import VatNumberKit

final class IrishVatNumberConverterTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testNewIrishVatNumberReturnsTheSameVatNumber() throws {
        let expectedResult = VatNumberKit.VatNumber(country: .ireland, number: "6388047V")
        
        let sut = IrishVatNumberConverter.convert(vatNumber: VatNumberKit.VatNumber(country: .ireland, number: "6388047V")!)
        XCTAssertEqual(sut, expectedResult)
    }
    
    func testOldIrishVatNumberIsConverted() throws {
        let expectedResult = VatNumberKit.VatNumber(country: .ireland, number: "0797398I")
        
        let sut = IrishVatNumberConverter.convert(vatNumber: VatNumberKit.VatNumber(country: .ireland, number: "8D79739I")!)
        XCTAssertEqual(sut, expectedResult)
    }

}
