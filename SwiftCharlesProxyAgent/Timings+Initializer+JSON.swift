//
//  Timings+Initializer+JSON.swift
//  SwiftCharlesProxyAgent
//
//  Created by Aman Shaikh on 19.05.17.
//  Copyright © 2017 Shaikh Aman. All rights reserved.
//

import Foundation
extension Timings{
	init(json: [AnyHashable: TimeInterval]) {
		self.dns = json["dns"] ?? 0
		self.connect = json["connect"] ?? 0
		self.ssl = json["ssl"] ?? 0
		self.send = json["send"] ?? 0
		self.wait = json["wait"] ?? 0
		self.receive = json["receive"] ?? 0
	}
}
