//
//  VatNumberCountryTests.swift
//  
//
//  Created by Frederik Jacques on 17/12/2022.
//

import XCTest
@testable import VatNumberKit

final class VatNumberCountryTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAustriaReturnsCorrectCountryCode() throws {
        let expectedResult = "AT"
        let sut: VatNumberKit.Country = .austria
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testBelgiumReturnsCorrectCountryCode() throws {
        let expectedResult = "BE"
        let sut: VatNumberKit.Country = .belgium
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testBulgariaReturnsCorrectCountryCode() throws {
        let expectedResult = "BG"
        let sut: VatNumberKit.Country = .bulgaria
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testCyprusReturnsCorrectCountryCode() throws {
        let expectedResult = "CY"
        let sut: VatNumberKit.Country = .cyprus
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testCzechRepublicReturnsCorrectCountryCode() throws {
        let expectedResult = "CZ"
        let sut: VatNumberKit.Country = .czechRepublic
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testGermanyReturnsCorrectCountryCode() throws {
        let expectedResult = "DE"
        let sut: VatNumberKit.Country = .germany
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testDenmarkReturnsCorrectCountryCode() throws {
        let expectedResult = "DK"
        let sut: VatNumberKit.Country = .denmark
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testEstoniaReturnsCorrectCountryCode() throws {
        let expectedResult = "EE"
        let sut: VatNumberKit.Country = .estonia
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testGreeceReturnsCorrectCountryCode() throws {
        let expectedResult = "EL"
        let sut: VatNumberKit.Country = .greece
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testSpainReturnsCorrectCountryCode() throws {
        let expectedResult = "ES"
        let sut: VatNumberKit.Country = .spain
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testFinlandReturnsCorrectCountryCode() throws {
        let expectedResult = "FI"
        let sut: VatNumberKit.Country = .finland
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testFranceReturnsCorrectCountryCode() throws {
        let expectedResult = "FR"
        let sut: VatNumberKit.Country = .france
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testCroatiaReturnsCorrectCountryCode() throws {
        let expectedResult = "HR"
        let sut: VatNumberKit.Country = .croatia
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testHungaryReturnsCorrectCountryCode() throws {
        let expectedResult = "HU"
        let sut: VatNumberKit.Country = .hungary
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testIrelandReturnsCorrectCountryCode() throws {
        let expectedResult = "IE"
        let sut: VatNumberKit.Country = .ireland
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testItalyReturnsCorrectCountryCode() throws {
        let expectedResult = "IT"
        let sut: VatNumberKit.Country = .italy
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testLithuaniaReturnsCorrectCountryCode() throws {
        let expectedResult = "IT"
        let sut: VatNumberKit.Country = .italy
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testLuxembourgReturnsCorrectCountryCode() throws {
        let expectedResult = "LU"
        let sut: VatNumberKit.Country = .luxembourg
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testLatviaReturnsCorrectCountryCode() throws {
        let expectedResult = "LV"
        let sut: VatNumberKit.Country = .latvia
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testMaltaReturnsCorrectCountryCode() throws {
        let expectedResult = "MT"
        let sut: VatNumberKit.Country = .malta
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testNetherlandsReturnsCorrectCountryCode() throws {
        let expectedResult = "NL"
        let sut: VatNumberKit.Country = .netherlands
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testPolandReturnsCorrectCountryCode() throws {
        let expectedResult = "PL"
        let sut: VatNumberKit.Country = .poland
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testPortugalReturnsCorrectCountryCode() throws {
        let expectedResult = "PT"
        let sut: VatNumberKit.Country = .portugal
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testRomaniaReturnsCorrectCountryCode() throws {
        let expectedResult = "RO"
        let sut: VatNumberKit.Country = .romania
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testSwedenReturnsCorrectCountryCode() throws {
        let expectedResult = "SE"
        let sut: VatNumberKit.Country = .sweden
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testSloveniaReturnsCorrectCountryCode() throws {
        let expectedResult = "SI"
        let sut: VatNumberKit.Country = .slovenia
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testSlovakiaReturnsCorrectCountryCode() throws {
        let expectedResult = "SK"
        let sut: VatNumberKit.Country = .slovakia
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testNorthernIrelandReturnsCorrectCountryCode() throws {
        let expectedResult = "XI"
        let sut: VatNumberKit.Country = .northernIreland
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testEuropeanEntityReturnsCorrectCountryCode() throws {
        let expectedResult = "EU"
        let sut: VatNumberKit.Country = .europeanEntity
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }
    
    func testGreatBritainReturnsCorrectCountryCode() throws {
        let expectedResult = "GB"
        let sut: VatNumberKit.Country = .greatBritain
        
        XCTAssertEqual(sut.rawValue, expectedResult)
    }

}
