//
//  Response.swift
//  SwiftCharlesProxyAgent
//
//  Created by Aman Shaikh on 18.05.17.
//  Copyright © 2017 Shaikh Aman. All rights reserved.
//

import UIKit

public struct Response {
	public let status: Int
	public let charlesStatus: String?
	public let statusText: String?
	public let httpVersion: String
	public let headerSize: Int
	public let serverIPAddress: String?
	public let bodySize: Int
	public let redirectURL: URL?
	public let content:[AnyHashable:Any]?
	
	public let cookies: [AnyHashable:String]
	public let headers: [AnyHashable:String]
}
