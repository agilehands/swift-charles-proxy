//
//  String+Subscript.swift
//  SwiftCharlesProxyAgent
//
//  Created by Aman Shaikh on 11.05.17.
//  Copyright © 2017 Shaikh Aman. All rights reserved.
//

import Foundation

extension String {
	subscript(pos: Int) -> String {
		precondition(pos >= 0, "character position can't be negative")
		return self[pos...pos]
	}
	subscript(range: Range<Int>) -> String {
		precondition(range.lowerBound >= 0, "range lowerBound can't be negative")
		let lowerIndex = index(startIndex, offsetBy: range.lowerBound, limitedBy: endIndex) ?? endIndex
		return self[lowerIndex..<(index(lowerIndex, offsetBy: range.count, limitedBy: endIndex) ?? endIndex)]
	}
	subscript(range: ClosedRange<Int>) -> String {
		precondition(range.lowerBound >= 0, "range lowerBound can't be negative")
		let lowerIndex = index(startIndex, offsetBy: range.lowerBound, limitedBy: endIndex) ?? endIndex
		return self[lowerIndex..<(index(lowerIndex, offsetBy: range.count, limitedBy: endIndex) ?? endIndex)]
	}
}
