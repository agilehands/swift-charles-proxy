//
//  Entry+Filter.swift
//  SwiftCharlesProxyAgent
//
//  Created by Aman Shaikh on 19.05.17.
//  Copyright © 2017 Shaikh Aman. All rights reserved.
//

import Foundation

extension Session{
	public func urls() -> [URL] {
		return self.entries.sorted { (a, b) -> Bool in
			a.startTime < b.startTime
			}.map { (entry) -> URL in
				return entry.request.url
		}
	}
	

	public func filter(_ filter:EntryFilter) -> [Entry] {
		return self.entries.filter({ (entry) -> Bool in
			return filter.matches(entry)
		})
	}
	public func filter(sequence:[String]) -> [Entry] {
		var result:[Entry] = []
		var seq = sequence
		if seq.isEmpty {
			return self.entries
		}
		
		for entry in self.entries {
			if seq.isEmpty {
				break;
			}
			
			let url = seq.first!
			
			let entryURL =  entry.request.url
			var entryURLString =  entryURL.absoluteString
			
			if url.lowercased().hasPrefix("http") == false {
				let scheme = entryURL.scheme!
				entryURLString = String(entryURLString.characters.dropFirst(scheme.characters.count + 3))
			}
			
			print(">> \(entryURLString)")
			if entryURLString.lowercased().hasPrefix(url.lowercased()) {
				result.append(entry)
				seq.removeFirst()
			}
		}
		
		if seq.isEmpty {
			return result
		}
		return []
	}
}

