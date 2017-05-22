//
//  Entry+Initializer+JSON.swift
//  SwiftCharlesProxyAgent
//
//  Created by Aman Shaikh on 18.05.17.
//  Copyright © 2017 Shaikh Aman. All rights reserved.
//

import Foundation

extension Entry {
	init(json: [AnyHashable: Any]) {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd hh:mm:ss.SSSS'Z"
		let datestring = json["startedDateTime"] as! String
//		let dt = dateFormatter.date(from: datestring)
		self.startTime = datestring
		
		self.time = json["time"] as! TimeInterval;
		self.serverIPAddress = json["serverIPAddress"] as? String;
		
		if let timingData = json["timings"] as? [AnyHashable:TimeInterval]{
			self.timings = Timings(json: timingData);
		} else {
			self.timings = nil;
		}
		
		self.request = Request(json: json["request"] as! [AnyHashable: Any])
		self.response = Response(json: json["response"] as! [AnyHashable: Any])
	}
}
