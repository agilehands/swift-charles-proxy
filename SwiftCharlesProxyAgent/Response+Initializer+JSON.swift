//
//  Response+Initializer+JSON.swift
//  SwiftCharlesProxyAgent
//
//  Created by Aman Shaikh on 19.05.17.
//  Copyright © 2017 Shaikh Aman. All rights reserved.
//

import Foundation
//
//let status: Int
//let statusText: String
//let htmlVersion: String
//let headerSize: Int
//let bodySize: Int
//let redirectURL: URL
//let content:Content
//
//let headers: [AnyHashable:String]
extension Response{
	init(json: [AnyHashable: Any]) {
		self.charlesStatus = json["_charlesStatus"] as? String
		self.status = json["status"] as! Int
		self.statusText = json["statusText"] as? String
		self.httpVersion = json["httpVersion"] as! String
		self.headerSize = json["headersSize"] as! Int
		self.bodySize = json["bodySize"] as! Int
		self.serverIPAddress = json["serverIPAddress"] as? String
		
		
		if let redirectURL = json["redirectURL"] as? String {
			self.redirectURL = URL(string: redirectURL)
		} else {
			self.redirectURL = nil;
		}
		
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
		
		if let contentData = json["content"] as? [AnyHashable:Any] {
			self.content = contentData
		} else {
			self.content = nil;
		}
	}
}
