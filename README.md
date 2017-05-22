# Swift Charles Proxy

## Instantiating
```Swift
let agent = CharlesProxyAgent() // base url will be default : http://control.charles
let agent = CharlesProxyAgent(baseURL: "your own base url for charles web interface")
```

## Basic Charles Control
### Start Recording
```Swift
let agent = CharlesProxyAgent()
agent.startRecord()
```
### Stop Recording
```Swift
let agent = CharlesProxyAgent()
agent.stopRecord()
```
### Clear Session
```Swift
let agent = CharlesProxyAgent()
agent.clearRecord()
```
### Download Recording : Practical example

```Swift
let agent = CharlesProxyAgent()
		agent.clearSession().then {
				let url = URL(string: "http://www.example.com")
				let mutableRequest = NSMutableURLRequest(url: url!)
				mutableRequest.addValue("world", forHTTPHeaderField: "hello")
				let task =  URLSession.shared.dataTask(with: mutableRequest as URLRequest, completionHandler: { (data, response, error) in
						agent.stopRecord().then {
							agent.downloadSession { session in
                let entries =  session?.filter(RequestHeaderFilter(header: ["hello":"world"]))
							}
						}
				})
				task.resume()
		}
```
## Processing/Filtering Session
### BaseURLFilter: Get session entries matching base url/s
If scheme e.g. `https://` or `http://` is not present, it will match scheme independent matching

```Swift
let agent = CharlesProxyAgent()
agent.downloadSession { session in
  let entries = session?.filter(BaseURLFilter(urls: ["www.example.com", "www.twitter.com", "https://www.google.com"]))
}
```

### RequestHeaderFilter: Get session entries matching header
```Swift
let agent = CharlesProxyAgent()
agent.downloadSession { session in
  let entries =  session?.filter(RequestHeaderFilter(header: ["hello":"world"])) // entries with request with this header value  
}
```

### QueryFilter: Get session entries matching particular queries
```Swift
let agent = CharlesProxyAgent()
agent.downloadSession { session in
  let entries = session?.filter(QueryFilter(query: ["hello":"world"]))
}
```

### ResponseHeaderFilter: Get session entries matching particular queries
```Swift
let agent = CharlesProxyAgent()
agent.downloadSession { session in
  let entries = session?.filter(ResponseHeaderFilter(header: ["Vary":"Accept-Encoding"]))
}
```

## Create Your Own Entry Filter
```Swift
// implement EntryFilter protocol
public struct MyFilter: EntryFilter {
public func matches(_ entry: Entry) -> Bool {
  if(/*do something with entry*/ true)
		return true
	}
  return false
}
```
