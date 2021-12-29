import UIKit
import Foundation

let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)

// URL
var urlComponent = URLComponents(string: "https://itunes.apple.com/search?")!
let mediaQuery = URLQueryItem(name: "media", value: "music")
let entityQuery = URLQueryItem(name: "entity", value: "song")
let termQuery = URLQueryItem(name: "term", value: "지드래곤")

urlComponent.queryItems?.append(mediaQuery)
urlComponent.queryItems?.append(entityQuery)
urlComponent.queryItems?.append(termQuery)

let requestURL = urlComponent.url!

let dataTask = session.dataTask(with: requestURL) { data, response, error in
    guard error == nil else { return }
    
    guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { return }
    let successRange = 200..<300
    
    guard successRange.contains(statusCode) else {
        // handle response error
        return
    }
    
    guard let resultData = data else { return }
    let resultString = String(data: resultData, encoding: .utf8)
    

    print("---> result : \(resultString)")
}

dataTask.resume()
 
