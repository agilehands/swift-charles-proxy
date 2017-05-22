//
//  CharlesProxyWebInterfaceEndpoint.swift
//  SwiftCharlesProxyAgent
//
//  Created by Aman Shaikh on 16.05.17.
//  Copyright © 2017 Shaikh Aman. All rights reserved.
//

import UIKit


/// This provides the Charles Web Interface Endpoints for various actions
struct CharlesProxyWebInterfaceEndpoint{
	/// Base url for charles proxy web interface
	var base:String
	
	init(base:String) {
		self.base = base
	}
	
	// Helper method to form urls with base url
	private func url(_ path:String) -> String{
		return "\(base)/\(path)" // no validation!!
	}
	
	var recordStart: String {
		return url("recording/start")
	}
	
	var recordStop: String {
		return url("recording/stop")
	}
	
	var sessionClear: String {
		return url("session/clear")
	}
	
	/// URL for session export in HAR format
	var sessionJSON: String {
		return url("session/export-har")
	}
}
