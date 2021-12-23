import UIKit

// Queue - Main, Global, Custom

// - Main
DispatchQueue.main.async {
    // UI 업데이트에 사용, 사용자 인터렉션에 사용
    let view = UIView()
    view.backgroundColor = .green
}

// - Grobal : QoSClass를 정해서 사용 할 수도 있다.
DispatchQueue.global(qos: .userInteractive).async {
//    지금 당장 해야하는 작업
}

DispatchQueue.global(qos: .userInitiated).async {
//    userInteractive 보다 덜 중요한 작업
}

DispatchQueue.global(qos: .default).async {
//    우선순위가 필요 없을 때, 잘 사용하지 않음 왜냐면 DispatchQueue.global().async {}와 같음
}

DispatchQueue.global(qos: .utility).async {
//    시간이 조금 걸리는 작업, 사용자가 당장 필요하지 않은 작업들에 사용
}

DispatchQueue.global(qos: .background).async {
//     사용자에게 당장 인식 될 필요가 없는 것들. 데이터 미리 받아오기, 위치 업데이트, 용량이 큰 파일 다운로드
}

// - Custom Queue : Queue를 직접 관리를 해야 할때 사용(잘 사용하지 않음)
let concurrentQueue = DispatchQueue(label: "concurrent", qos: .background, attributes: .concurrent)
let serialQueue = DispatchQueue(label: "serial", qos: .background)


// 복합적인 상황
func downloadImageFromServer() -> UIImage {
//    Heavy Task
    return UIImage()
}

func updateUI(image: UIImage) {
    
}

DispatchQueue.global(qos: .background).async {
//    download
    let image = downloadImageFromServer()
    
    DispatchQueue.main.async {
//        update ui
        updateUI(image: image)
    }
}


// Sync, Async의 차이 예제
//async
DispatchQueue.global(qos: .background).async {
    for i in 0...5 {
        print("😈 \(i)")
    }
}
DispatchQueue.global(qos: .userInteractive).async {
    for i in 0...5 {
        print("😍 \(i)")
    }
}

//sync
DispatchQueue.global(qos: .background).sync {
    for i in 0...5 {
        print("🥶 \(i)")
    }
}
DispatchQueue.global(qos: .userInteractive).async {
    for i in 0...5 {
        print("🤩 \(i)")
    }
}
