//
//  NetworkTests.swift
//  bootCampTests
//
//  Created by Cem Kazım on 20.01.2021.
//

@testable import bootCamp
import XCTest

class NetworkTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override class func tearDown() {
        super.tearDown()
    }
    
    func testingTweetList() {
        let expect = expectation(description: "Get Tweet From")
        NetworkManager.shared.getTweetFrom(completion: { (result) in
            XCTAssertNotNil(result)
            expect.fulfill()
        })
        waitForExpectations(timeout: 10, handler: nil)
    }
}
