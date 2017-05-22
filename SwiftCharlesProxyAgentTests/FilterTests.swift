//
//  FilterTests.swift
//  SwiftCharlesProxyAgent
//
//  Created by Aman Shaikh on 19.05.17.
//  Copyright © 2017 Shaikh Aman. All rights reserved.
//

import XCTest
import Foundation
@testable import SwiftCharlesProxyAgent
class FilterTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
//    func testFilter() {
//		let agent = CharlesProxyAgent()
//		let expect = XCTestExpectation(description: "Expectation for testCallbackChaining")
//		
//		var session:Session?
//		agent.downloadSession { (s) in
//			session = s
//			expect.fulfill()
//		}
//		
//		self.wait(for: [expect], timeout: 60)
//		assert(session != nil)
//		var entries =  session?.filter(sequence: ["www.example.com", "abs.twimg.com"])
////		assert(((entries!.count) == 2))
//		
//		entries = session?.filter(QueryFilter(query: ["hello":"world"]))
//		assert(((entries!.count) > 0))
//		entries = session?.filter(BaseURLFilter(urls: ["www.example.com", "video-frx5-1.xx.fbcdn.net", "abs.twimg.com"]))
//		assert(((entries!.count) > 0))
//		print(session!.urls())
//    }
	
	func testHeaderFilter(){
		let expect = XCTestExpectation(description: "expectation for header filter")
		
		var session:Session?
		
		let agent = CharlesProxyAgent()
		agent.clearSession().then {
				let url = URL(string: "http://www.example.com")
				let mutableRequest = NSMutableURLRequest(url: url!)
				mutableRequest.addValue("world", forHTTPHeaderField: "hello")
				let task =  URLSession.shared.dataTask(with: mutableRequest as URLRequest, completionHandler: { (data, response, error) in
						agent.stopRecord().then {
							agent.downloadSession { (s) in
								session = s
								expect.fulfill()
							}
						}
				})
				task.resume()
		}
		

		self.wait(for: [expect], timeout: 60)
		var entries =  session?.filter(RequestHeaderFilter(header: ["hello":"world"]))
		assert(entries?.count == 1, "request with header not found")
		
		entries =  session?.filter(ResponseHeaderFilter(header: ["Vary":"Accept-Encoding"]))
		assert(entries?.count == 1, "response with header not found")
	}
    
}
