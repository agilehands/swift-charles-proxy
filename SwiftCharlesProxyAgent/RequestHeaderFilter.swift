//
//  RequestHeaderFilter.swift
//  SwiftCharlesProxyAgent
//
//  Created by Aman Shaikh on 19.05.17.
//  Copyright © 2017 Shaikh Aman. All rights reserved.
//

import Foundation

public struct RequestHeaderFilter: EntryFilter {
	let header:[AnyHashable:String]
	
	public func matches(_ entry: Entry) -> Bool {
		if self.header.isEmpty {
			return true
		}
		
		if entry.request.headers.isEmpty {
			return true
		}
		
		
		let availablePairs:[String] = entry.request.headers.map { (
			key, value) -> String in
			return "\(key as! String)=\(value)"
		}
		
		var testPairs:[String] = header.map { (
			key, value) -> String in
			return "\(key as! String)=\(value)"
		}
		
		for apair in availablePairs {
			if testPairs.isEmpty {
				return true
			}
			
			let first = testPairs.first!
			if apair == first {
				testPairs.removeFirst()
				continue
			}
		}
		
		return testPairs.isEmpty
	}
}
