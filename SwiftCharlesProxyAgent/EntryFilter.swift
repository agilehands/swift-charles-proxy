//
//  EntriesFilter.swift
//  SwiftCharlesProxyAgent
//
//  Created by Aman Shaikh on 19.05.17.
//  Copyright © 2017 Shaikh Aman. All rights reserved.
//

import Foundation

public protocol EntryFilter {
	func matches(_ entry: Entry) -> Bool;
}
