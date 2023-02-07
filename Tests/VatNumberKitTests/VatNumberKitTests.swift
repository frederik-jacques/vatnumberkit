import XCTest
@testable import VatNumberKit

final class VatNumberKitTests: XCTestCase {
    
    func testParseReturnsNilIfVatNumberParameterIsNil() throws {        
        let sut = VatNumberKit.validateFormat(vatNumber: nil)
        XCTAssertNil(sut)
    }
    
    func testParseReturnsNilIfVatNumberParameterIsEmpty() throws {
        let sut = VatNumberKit.validateFormat(vatNumber: "")
        XCTAssertNil(sut)
    }
    
    func testParseReturnsValidResultIfVatNumberIsValid() throws {
        let expectedResult = true
        
        let sut = VatNumberKit.validateFormat(vatNumber: "BE0651634023")
        XCTAssertEqual(sut?.isValid, expectedResult)
    }
    
    func testParseReturnsInvalidResultIfVatNumberIsInvalid() throws {
        let expectedResult = false
        
        let sut = VatNumberKit.validateFormat(vatNumber: "BE0651634023A")
        XCTAssertEqual(sut?.isValid, expectedResult)
    }
    
}
