//
//  URLSequenceFilter.swift
//  SwiftCharlesProxyAgent
//
//  Created by Aman Shaikh on 19.05.17.
//  Copyright © 2017 Shaikh Aman. All rights reserved.
//

import Foundation

public struct QueryFilter: EntryFilter {
	let query:[AnyHashable:String]
	
	public func matches(_ entry: Entry) -> Bool {
		if self.query.isEmpty {
			return true
		}
		
		guard let queryString:String = entry.request.url.query else {
			return false
		}
		
		
		let availablePairs:[String] = queryString.components(separatedBy: "&")
		var testPairs:[String] = query.map { (
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
