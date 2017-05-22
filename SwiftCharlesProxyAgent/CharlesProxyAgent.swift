//
//  CharlesProxyAgent.swift
//  SwiftCharlesProxyAgent
//
//  Created by Aman Shaikh on 11.05.17.
//  Copyright © 2017 Shaikh Aman. All rights reserved.
//

import UIKit

public typealias CharlesProxyAgentCallbackSuccess = () throws -> Void
public typealias CharlesProxyAgentCallbackError = (_ error:Error?) throws -> Void

public final class CharlesProxyAgent: NSObject {
	final var callbackChain = CharlesProxyAgentCallbackChain()
	final var endpoint:CharlesProxyWebInterfaceEndpoint;
	
	public init(baseURL:String) {
		self.endpoint = CharlesProxyWebInterfaceEndpoint(base: baseURL);
		super.init()
	}
	
	public convenience override init(){
		self.init(baseURL: "http://control.charles");
	}
	
	@discardableResult public func startRecord() -> CharlesProxyAgentCallbackChain {
		call(self.endpoint.recordStart)
		return self.callbackChain
	}
	
	@discardableResult public func stopRecord() -> CharlesProxyAgentCallbackChain {
		call(self.endpoint.recordStop)
		return self.callbackChain
	}
	
	@discardableResult public func clearSession() -> CharlesProxyAgentCallbackChain {
		call(self.endpoint.sessionClear)
		return self.callbackChain
	}
	
	public func downloadSession(_ callback: @escaping (_ session:Session?) -> Void) -> Void {
		
		var session:Session? = nil;
		GET(self.endpoint.sessionJSON) {
			(data, error) in
			if let data = data,
			let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [AnyHashable: Any],
			let logs = json?["log"] as? [AnyHashable: Any]
				
				{
					session =  Session(jsonDictionary: logs)
			}
			callback(session)
		}
	}
}
