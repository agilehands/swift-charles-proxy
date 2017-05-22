//
//  Timings.swift
//  SwiftCharlesProxyAgent
//
//  Created by Aman Shaikh on 18.05.17.
//  Copyright © 2017 Shaikh Aman. All rights reserved.
//

import UIKit

public struct Timings {
	public let dns: TimeInterval
	public let connect: TimeInterval
	public let ssl: TimeInterval
	public let send: TimeInterval
	public let wait: TimeInterval
	public let receive: TimeInterval
}
