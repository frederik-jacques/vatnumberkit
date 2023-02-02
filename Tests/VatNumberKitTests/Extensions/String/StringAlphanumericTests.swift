//
//  StringAlphanumericTests.swift
//  
//
//  Created by Frederik Jacques on 17/12/2022.
//

import XCTest
@testable import VatNumberKit

final class StringAlphanumericTests: XCTestCase {
    
    override func setUpWithError() throws {
        
    }
    
    override func tearDownWithError() throws {
        
    }
    
    func testOnlyLettersAndNumbersAreReturned() throws {
        let expectedResult = "abcd123"
        
        let sut = "±§!@#$%ˆ&*()-_=+abcd123[]{}\\|'\"/?.>,<`˜".alphanumeric
        XCTAssertEqual(sut, expectedResult)
    }
    
}
