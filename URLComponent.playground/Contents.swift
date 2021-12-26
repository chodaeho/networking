import UIKit

//URL : Web Resource의 주소

let urlString: String = "https://news.naver.com/main/main.naver?mode=LSD&mid=shm&sid1=100"
let url = URL(string: urlString)

// 실제 주소를 보여줌
url?.absoluteString

// 어떤 방식으로 네트워킹을 하는지 보여줌. "https" or "http"
url?.scheme

// host를 보여줌
url?.host

// host 뒤의 경로를 보여줌
url?.path

// 파라미터의 대한 정보
url?.query


let baseURL = URL(string: "https://news.naver.com")
let relativeURL = URL(string: "main/main.naver?mode=LSD&mid=shm&sid1=100", relativeTo: baseURL)

// 실제 주소를 보여줌
relativeURL?.absoluteString

// 어떤 방식으로 네트워킹을 하는지 보여줌. "https" or "http"
relativeURL?.scheme

// host를 보여줌
relativeURL?.host

// host 뒤의 경로를 보여줌
relativeURL?.path

// 파라미터의 대한 정보
relativeURL?.query

// base URL을 보여줌
relativeURL?.baseURL


