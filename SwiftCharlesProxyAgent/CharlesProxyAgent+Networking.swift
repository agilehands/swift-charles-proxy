//
//  CharlesProxyAgent+Networking.swift
//  SwiftCharlesProxyAgent
//
//  Created by Aman Shaikh on 16.05.17.
//  Copyright © 2017 Shaikh Aman. All rights reserved.
//

import Foundation

extension CharlesProxyAgent{
	func GET(_ url:String, completionHandler: @escaping (Data?, Error?) -> Swift.Void) -> Void {
		guard let apiURL:URL = URL(string: url) else {
			completionHandler(nil, CharlesProxyAgentError.InvalidCharlesWebInterfaceURL)
			return
		}
		
		let task:URLSessionDataTask =  URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
			completionHandler(data, error)
		}
		task.resume()
	}
	
	func call(_ url: String){
		GET(url) {
			[unowned self]
			(data, error) in
			if error != nil {
				self.callbackChain.popAndRunError(error)
			} else {
				self.callbackChain.popAndRunSuccess()
			}
		}
	}
}
