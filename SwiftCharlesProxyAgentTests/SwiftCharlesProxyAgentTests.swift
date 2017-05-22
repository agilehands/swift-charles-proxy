//
//  SwiftCharlesProxyAgentTests.swift
//  SwiftCharlesProxyAgentTests
//
//  Created by Aman Shaikh on 11.05.17.
//  Copyright © 2017 Shaikh Aman. All rights reserved.
//

import XCTest

@testable import SwiftCharlesProxyAgent

extension String: Error {}

class SwiftCharlesProxyAgentTests: XCTestCase {
	
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCallbackChaining() {
		let expect = XCTestExpectation(description: "Expectation for testCallbackChaining")
        let agent = CharlesProxyAgent()
		agent.startRecord().then ({ (success) in
			print("startRecord completed")
			agent.stopRecord()
		}).then({ (success) in
			print("stopRecord completed")
			throw CharlesProxyAgentError.CannotConnectCharlesWebInterface
		}).onError { (error) in
			expect.fulfill()
			print("I am in error")
			print(error ?? "Unknown error")
		}
		
		self.wait(for: [expect], timeout: 10)
    }
	
	
    
}
