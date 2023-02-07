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
        let expectedResult = VatNumberKit.VatNumber(rawVatNumber: "IE6388047V")
        
        let sut = IrishVatNumberConverter.convert(vatNumber: VatNumberKit.VatNumber(rawVatNumber: "IE6388047V")!)
        XCTAssertEqual(sut, expectedResult)
    }
    
    func testOldIrishVatNumberIsConverted() throws {
        let expectedResult = VatNumberKit.VatNumber(rawVatNumber: "IE0797398I")
        
        let sut = IrishVatNumberConverter.convert(vatNumber: VatNumberKit.VatNumber(rawVatNumber: "IE8D79739I")!)
        XCTAssertEqual(sut, expectedResult)
    }

}
