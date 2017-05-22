//
//  Request.swift
//  SwiftCharlesProxyAgent
//
//  Created by Aman Shaikh on 18.05.17.
//  Copyright © 2017 Shaikh Aman. All rights reserved.
//

import UIKit

public struct Request {
	public let method: String
	public let url: URL
	public let httpVersion: String
	public let headerSize: Int
	public let bodySize: Int
	public let cookies: [AnyHashable:String]
	public let headers: [AnyHashable:String]
	public let query: [AnyHashable:String]
}
