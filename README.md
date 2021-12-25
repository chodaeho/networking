1. Concurrency(동시성) : 한번에 여러개를 수행 하는것
     1) 사용자 인터랙션 처리
     2) 네트워킹
     3) 백그라운드에서 파일 다운로드
     4) 파일 저장하고 읽기

2. GCD(Grand Central Patch) API : C기반의 저수준 API, 코드 블럭 GCD에 넘기면 스레드를 할당하고 안전하게 수행/처리 해줌
     1) Queue : First-in First-out 먼저 들어온 것부터 먼저 나감.
     2) DispatchQueue의 타입
     
        A. Main Queue : 메인 스레드에서 작동하는 Queue
          
            ex) DispatchQueue.main.async {}
        B. Global Queue : 시스템에 의해 관리되는 Concurrent Queue(동시성)
          
            QoS(Quality of Service) : 우선순위 순
                - userInteractive : 바로 수행되어야 할 작업에 사용
                - userInitiated : 바로 수행되어야 할 작업에 사용
                - default : 잘 사용하지 않음, 덜 중요한 작업에 사용
                - uility : 수초에서 수분이 걸리는 작업에 사용
                - background : 사용자에게 당장 인식될 필요가 없는 작업에 사용
                - ex) DispatchQueue.global(qos: .background).async {}
        C. Custom Queue : 직접 Queue를 생성해서 관리 해야할 때 사용
          
                ex)     let concurrentQueue = DispatchQueue(label: "concurrent", qos: .background, attributes: .concurrent)
                        let serialQueue = DispatchQueue(label: "serial", qos: .background)

3. Sync(앞에 작업이 끝나고 나서 다음 작업을 시작) & Async(앞에 작업이 끝나지 않았음에도 다음 작업을 시작)

4. URLSessionConfiguration 
    1) 설명 : URLSessionConfiguration을 이용해서 URLSession생성
     
            - Default : 기본 통신 할때 사용
            - Ephemeral : 쿠키 데이터를 저장하지 않는 정책을 사용할떄 사용
            - Background : 앱이 백그라운드에 있을때 사용
            
5. URLSessionTask
    1) 설명 : URLSessionTask를 통해서 실제로 서버와의 통신을 함.
    
            - URLSessionDataTask : 기본적인(간단한) 데이터를 받는 작업일 떄 사용, Response 데이터를 메모리상에서 처리, Background 세션 지원 안됨
            - URLSessionUploadTask : 파일을 업로드할때 사용, 업로드 할때 편한 RequestBody를 사용
            - URLSessionDownloadTask : 파일을 다운로드 받을때 사용.
        
6. URLSession
    1) 설명 : URLSession은 여러개의 URLSessionTask를 생성 가능함
          
7. URLSessionDelegate    
    1) 설명 : URLSessionDelegate를 이용해서 네트워킹 중간 과정을 볼 수 있음.
