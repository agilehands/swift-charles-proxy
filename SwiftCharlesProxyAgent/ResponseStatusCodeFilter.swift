//
//  ResponseStatusCodeFilter.swift
//  SwiftCharlesProxyAgent
//
//  Created by Aman Shaikh on 19.05.17.
//  Copyright © 2017 Shaikh Aman. All rights reserved.
//

import Foundation

public struct ResponseStatusCodeFilter:EntryFilter {
	let statusCode:Int
	
	public func matches(_ entry: Entry) -> Bool {
		return entry.response.status == statusCode
	}
}
