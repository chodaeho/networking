import UIKit
import Foundation

let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)

// URL
var urlComponent = URLComponents(string: "https://news.naver.com/main/main.naver?")!
let modeQuery = URLQueryItem(name: "mode", value: "LSD")
let midQuery = URLQueryItem(name: "mid", value: "shm")
let sidQuery = URLQueryItem(name: "sid1", value: "100")

urlComponent.queryItems?.append(modeQuery)
urlComponent.queryItems?.append(midQuery)
urlComponent.queryItems?.append(sidQuery)

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
