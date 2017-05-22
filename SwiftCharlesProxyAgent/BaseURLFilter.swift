//
//  HostFilter.swift
//  SwiftCharlesProxyAgent
//
//  Created by Aman Shaikh on 19.05.17.
//  Copyright © 2017 Shaikh Aman. All rights reserved.
//

import Foundation

public struct BaseURLFilter: EntryFilter {
	let urls:[String];
	let queries:[AnyHashable:String] = [:]
	
	public func matches(_ entry: Entry) -> Bool {
		for url in urls {
			let entryURL =  entry.request.url
			var entryURLString =  entryURL.absoluteString
			
			if url.lowercased().hasPrefix("http") == false {
				let scheme = entryURL.scheme!
				entryURLString = String(entryURLString.characters.dropFirst(scheme.characters.count + 3))
			}
			if entryURLString.lowercased().hasPrefix(url.lowercased()) {
				return true
			}
		}
		return false
	}
}
