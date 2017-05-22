//
//  Request+Initializer+JSON.swift
//  SwiftCharlesProxyAgent
//
//  Created by Aman Shaikh on 19.05.17.
//  Copyright © 2017 Shaikh Aman. All rights reserved.
//

import Foundation

extension Request{
	init(json: [AnyHashable: Any]) {
		self.method = json["method"] as! String
		self.url = URL(string: json["url"] as! String)!
		self.httpVersion = json["httpVersion"] as! String
		self.headerSize = json["headersSize"] as! Int
		self.bodySize = json["bodySize"] as! Int
		
		var headers:[AnyHashable: String] = [:]
		if let headerData = json["headers"] as? [[AnyHashable: String]]{
			for case let pair in headerData {
				headers[pair["name"]!] = pair["value"] ?? ""
			}
		}
		self.headers = headers
		
		var cookies:[AnyHashable: String] = [:]
		if let cookiesData = json["cookies"] as? [[AnyHashable: String]]{
			for case let pair in cookiesData {
				for (key, value) in pair {
					cookies[key] = value
				}
			}
		}
		self.cookies = cookies
		
		var query:[AnyHashable: String] = [:]
		if let queryData = json["queryString"] as? [[AnyHashable: String]]{
			for case let pair in queryData {
				for (key, value) in pair {
					query[key] = value
				}
			}
		}
		self.query = query
	}
}
