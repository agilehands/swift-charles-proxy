//
//  Session+Initializer+JSON.swift
//  SwiftCharlesProxyAgent
//
//  Created by Aman Shaikh on 18.05.17.
//  Copyright © 2017 Shaikh Aman. All rights reserved.
//

import Foundation

extension Session {
	init?(jsonDictionary: [AnyHashable: Any]) {
		if let version = jsonDictionary["version"] as? String {
			self.version = version
		} else {
			return nil;
		}
		
		if let creator = jsonDictionary["creator"] as? [AnyHashable: String],
			let creatorName = creator["name"],
			let creatorVersion = creator["version"]
			{
				self.creatorName = creatorName
				self.creatorVersion = creatorVersion
		} else {
			return nil;
		}
		
		var entries:[Entry] = []
		if let logEntries = jsonDictionary["entries"] as? [[AnyHashable: Any]] {
			for case let entry in logEntries {
				entries.append(Entry(json:entry))
			}
		} else {
			return nil
		}
		
		self.entries = entries
	}
}
