//
//  CharlesProxyAgentError.swift
//  SwiftCharlesProxyAgent
//
//  Created by Aman Shaikh on 11.05.17.
//  Copyright © 2017 Shaikh Aman. All rights reserved.
//

import Foundation
enum CharlesProxyAgentError:String, Error  {
	case Unknown = "Unknown error"
	case CannotConnectCharlesWebInterface = "Cannot connect charles WebInterface"
	case InvalidCharlesWebInterfaceURL = "Invalid Charles web interface URL"
}
