//
//  StringDiacriticsTests.swift
//  
//
//  Created by Frederik Jacques on 17/12/2022.
//

import XCTest

final class StringDiacriticsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testDiacrictsAreReplacedWithTheBaseLetter() throws {
        let expectedResult = "aAbuUcd123"
        
        let sut = "àAbûÜcd123".withoutDiacritics
        XCTAssertEqual(sut, expectedResult)
    }
    
}
