import XCTest
@testable import VatNumberKit

final class VatNumberKitTests: XCTestCase {
    
    func testParseReturnsInvalidIfVatNumberParameterIsNil() throws {
        let sut = VatNumberKit.validateFormat(rawVatNumber: nil)
        XCTAssertFalse(sut.isValid)
    }
    
    func testParseReturnsNilIfVatNumberParameterIsEmpty() throws {
        let sut = VatNumberKit.validateFormat(rawVatNumber: "")
        XCTAssertFalse(sut.isValid)
    }
    
    func testParseReturnsValidResultIfVatNumberIsValid() throws {
        let expectedResult = true
        
        let sut = VatNumberKit.validateFormat(rawVatNumber: "BE0651634023")
        XCTAssertEqual(sut.isValid, expectedResult)
    }
    
    func testParseReturnsInvalidResultIfVatNumberIsInvalid() throws {
        let expectedResult = false
        
        let sut = VatNumberKit.validateFormat(rawVatNumber: "BE0651634023A")
        XCTAssertEqual(sut.isValid, expectedResult)
    }
    
    func testSearch1VatNumberInTextResults() throws {
        let sut = VatNumberKit.searchVatNumbersInText("This is a VAT number that is BE0651634023 somewhere in the text")
        
        XCTAssertEqual(sut.count, 1)
    }
    
    func testSearchVatNumberWithInvalidChecksumInTextResultsReturnsNoResults() throws {
        let sut = VatNumberKit.searchVatNumbersInText("This is a VAT number that is BE0651634022 somewhere in the text", applyChecksumValidation: true)
        
        XCTAssertEqual(sut.count, 0)
    }
    
    func testSearchVatNumberWithInvalidChecksumInTextResultsReturnsAResult() throws {
        let sut = VatNumberKit.searchVatNumbersInText("This is a VAT number that is BE0651634022 somewhere in the text", applyChecksumValidation: false)
        
        XCTAssertEqual(sut.count, 1)
    }
    
    func testSearch2VatNumberInTextResults() throws {
        let sut = VatNumberKit.searchVatNumbersInText("This is a VAT number that is BE0651634023 somewhere in the text. \n Apple's Belgian VAT number is BE0842936235")
        
        XCTAssertEqual(sut.count, 2)
    }
    
}
