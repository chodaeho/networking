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

//Codable 프로토콜 컨펌, 준수
struct Response: Codable {
    let resultCount: Int
    let tracks: [Track]
    
//    CodingKey : 서버에서 내려주는 데이터명과 프로젝트에서 사용하려는 오브젝트와 연결
    enum CodingKeys: String, CodingKey {
        case resultCount
        case tracks = "results"
    }
}

//Codable 프로토콜 컨펌, 준수
//Cocable : json 데이터를 원하는 struct나 오브젝트로 형태로 파싱할때 유용
struct Track: Codable {
    let title: String
    let artistName: String
    let thumbnailPath: String
    
//    CodingKey : 서버에서 내려주는 데이터명과 프로젝트에서 사용하려는 오브젝트와 연결
    enum CodingKeys: String, CodingKey {
        case title = "trackName"
        case artistName
        case thumbnailPath = "artworkUrl30"
    }
}

let dataTask = session.dataTask(with: requestURL) { data, response, error in
    guard error == nil else { return }
    
    guard let statusCode = (response as? HTTPURLResponse)?.statusCode else { return }
    let successRange = 200..<300
    
    guard successRange.contains(statusCode) else {
        // handle response error
        return
    }
    
//    resultData는 json형태의 데이터
    guard let resultData = data else { return }
//    let resultString = String(data: resultData, encoding: .utf8)
    
//    목표 : 트랙리스트 오브젝트로 가져오기

//    하고 싶은 목록
//    - Data -> Track 목록으로 가져오고 싶다 [Track]
//    - Track 오브젝트를 만들어야겠다.
//    - Data 에서 struct로 파싱하고 싶다. > Codable 이용해서 만들자
//    - Json 파일, 데이터 > 오브젝트 (Codable 이용하겠다)
//    - Response, Track 두개를 만들어야함.

//    해야할 일
//    - Response, Track struct
//    - struct의 프로퍼티 이름과 실제 데이터의 키와 맞추기(Codable 디코딩을 위해)
//    - 파싱하기(Decoding)
//    - 트랙 리스트 가져오기
    
    
//    print("---> result : \(resultString)")
    
//    파싱 및 트랙 가져오기
    do {
        let decoder = JSONDecoder()
//        try : 이 작업이 항상 성공하지 않을 수 있을 때 사용, 에러 발생시 catch 구문으로 빠진다.
        let response = try decoder.decode(Response.self, from: resultData)
        let tracks = response.tracks
        print("---> tracks.count : \(tracks.count)")
    } catch let error {
        print("---> error : \(error)")
    }
}

dataTask.resume()
