//
//  Entry.swift
//  SwiftCharlesProxyAgent
//
//  Created by Aman Shaikh on 18.05.17.
//  Copyright © 2017 Shaikh Aman. All rights reserved.
//

import UIKit

public struct Entry{
	public let startTime: String
	public let time: TimeInterval
	public let serverIPAddress: String?
	public let request: Request
	public let response: Response
	public let timings: Timings?
}
