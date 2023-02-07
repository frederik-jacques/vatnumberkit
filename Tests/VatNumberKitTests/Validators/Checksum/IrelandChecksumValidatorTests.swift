//
//  IrelandChecksumValidatorTests.swift
//  
//
//  Created by Frederik Jacques on 07/02/2023.
//

import XCTest
@testable import VatNumberKit

final class IrelandChecksumValidatorTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testValidNewIrishVatNumberWith1LetterAtTheEnd() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "IE6388047V")
        XCTAssertTrue(sut)
    }
    
    func testValidNewIrishVatNumberWithLetterWAtTheEnd() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "IE4807499W")
        XCTAssertTrue(sut)
    }
    
    func testValidNewIrishVatNumberWithLetterCAtTheEnd() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "IE9767830C")
        XCTAssertTrue(sut)
    }
    
    func testInvalidNewIrishVatNumberWith1LetterAtTheEnd() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "IE6388046V")
        XCTAssertFalse(sut)
    }
    
    func testValidNewIrishVatNumberWith2LettersAtTheEnd() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "IE3668997OH")
        XCTAssertTrue(sut)
    }
    
    func testInvalidNewIrishVatNumberWith2LetterAtTheEnd() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "IE3668998OH")
        XCTAssertFalse(sut)
    }
    
    func testInvalidIrishVatNumberWithIncorrectFormat() throws {
        let sut = VatNumberKit.validateChecksum(rawVatNumber: "IE6347V")
        XCTAssertFalse(sut)
    }

}
