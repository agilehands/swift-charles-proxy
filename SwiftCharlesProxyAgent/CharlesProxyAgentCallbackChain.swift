//
//  CharlesProxyAgentCallbackChain.swift
//  SwiftCharlesProxyAgent
//
//  Created by Aman Shaikh on 11.05.17.
//  Copyright © 2017 Shaikh Aman. All rights reserved.
//

public class CharlesProxyAgentCallbackChain {
	var callbacksSuccess:[CharlesProxyAgentCallbackSuccess] = [];
	var callbacksError:[CharlesProxyAgentCallbackError] = [];

	@discardableResult public func then(_ callback: @escaping CharlesProxyAgentCallbackSuccess) -> CharlesProxyAgentCallbackChain {
		self.callbacksSuccess.append(callback)
		return self
	}
	
	public func onError(_ callback: @escaping CharlesProxyAgentCallbackError) -> Void {
		self.callbacksError.append(callback)
	}
	
	func popAndRunSuccess() -> Void {
		if self.callbacksSuccess.isEmpty != true{
			do {
				try self.callbacksSuccess.removeFirst()()
			} catch  let err {
				self.popAndRunError(err)
			}
		}
	}
	func popAndRunError(_ error:Error?) -> Void {
		if self.callbacksError.isEmpty != true {
			do {
				try self.callbacksError.removeFirst()(error)
			} catch let err{
				self.popAndRunError(err)
			}
			
		}
	}
}
