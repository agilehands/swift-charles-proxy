//
//  CallbackChainTest.swift
//  SwiftCharlesProxyAgent
//
//  Created by Aman Shaikh on 16.05.17.
//  Copyright © 2017 Shaikh Aman. All rights reserved.
//

import XCTest

@testable import SwiftCharlesProxyAgent

class CallbackChainTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testCallbackPromiseSuccess() {
		let expectation = self.expectation(description: "Expectation for callback promise")
		
		let callbackChain:CharlesProxyAgentCallbackChain = CharlesProxyAgentCallbackChain()
		var count = 3
		callbackChain.then ({
			print("I am first block!")
			count -= 1
		}).then({
			print("I am second block!");
			count -= 1
		}).then({
			print("I am third block!");
			count -= 1
			expectation.fulfill()
		});
		assert(count == 3, "Count should be 3 before any pop")
		callbackChain.popAndRunSuccess();
		assert(count == 2, "Count should be 2 after first pop")
		callbackChain.popAndRunSuccess();
		assert(count == 1, "Count should be 1 after second pop")
		callbackChain.popAndRunSuccess();
		assert(count == 0, "Count should be 0 after third pop")
		callbackChain.popAndRunSuccess();
		assert(count == 0, "Count should be 0 after further pop")
		self.wait(for: [expectation], timeout: 60)
    }
	
	func testCallbackPromiseSequencialExecution() {
		let expectation = self.expectation(description: "Expectation for callback promise")
		
		let callbackChain:CharlesProxyAgentCallbackChain = CharlesProxyAgentCallbackChain()
		var cb1Called = false
		var cb2Called = false
		var cb3Called = false
		
		callbackChain.then ({
			cb1Called = true
		}).then({
			cb2Called = true
		}).then({
			cb3Called = true
			expectation.fulfill()
		});
		
		assert(cb1Called == false
			&& cb2Called == false
			&& cb3Called == false
			, "None should be true"
		)
		
		callbackChain.popAndRunSuccess();
		assert(cb1Called == true
			&& cb2Called == false
			&& cb3Called == false
			, "Only cb1Called should be true"
		)
		
		
		callbackChain.popAndRunSuccess();
		assert(cb1Called == true
			&& cb2Called == true
			&& cb3Called == false
			, "Only cb1Called and cb2called should be true"
		)
		
		
		callbackChain.popAndRunSuccess();
		assert(cb1Called == true
			&& cb2Called == true
			&& cb3Called == true
			, "All flags should be true"
		)
		
		
		self.wait(for: [expectation], timeout: 60)
	}
	
	func testCallbackPromiseOnError() {
		let expectation = self.expectation(description: "Expectation for callback promise")
		
		var errorCalled = false
		let callbackChain:CharlesProxyAgentCallbackChain = CharlesProxyAgentCallbackChain()
		callbackChain.then ({
			throw CharlesProxyAgentError.Unknown
		}).onError({_ in 
			print("I am error block!");
			errorCalled = true;
			expectation.fulfill()
		});
		
		callbackChain.popAndRunSuccess();
		assert(errorCalled == true, "Error block not called")
		self.wait(for: [expectation], timeout: 60)
	}
}
