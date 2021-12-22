Design Pattern(기술 부채 최소화, 재사용 및 지속 가능한 코드 생성을 위함)

 1. MVC(Model - View - Controller) : MVVM 패턴 전에 앱 개발 시 가장 많이 사용되던 디자인 패턴
    1) Model : 앱 내에서 사용하는 데이터(보통은 struct로 표현되고 가끔 class로 표현)
    2) View : UI요소(UIView)
    3) Controller :
        - View와 Model을 사이를 중개하는 중개자(UIViewController)
        - Model과는 스스로의 데이터가 변경 되었을때, Controller가 Model의 데이터가 수정이 되야 할때 의사소통
        - Controller가 View에서 보여줘야 할 것들이 있을때, 사용자가 변경한 인터렉션을 Controller에 보낼때 의사소통
    4) 문제점 : Controller에서 할 일이 많아져 코드가 많아지고 결과적으로 기술 부채가 발생함.
 
 2. MVVM(Model - View - ViewModel) : 앱 개발 시 가장 많이 사용되는 디자인 패턴
    1) Model : 앱 내에서 사용하는 데이터(보통은 struct로 표현되고 가끔 class로 표현)
    2) View : UI요소(UIView, UIViewController)
    3) ViewModel
        - Model의 내용을 View에서 사용할 수 있도록 전환시켜주는 역활
        - ViewModel이라는 클래스를 만들어서 역활 수행
 3. MVC vs MVVM
    1) 차이점
        - MVVM은 MVC와 다르게 ViewController가 Model에 직접 접근 하지 못함
        - MVVM의 ViewController가 ViewModel이라는 클래스를 새로 갖게 됨
        - MVVM은 MVC와 다르게 ViewController가 View 레이어에 속해있음
    2) MVC -> MVVM 개선점
        - ViewController의 역활을 축소시키고 그 역활을 ViewModel로 위임하여 ViewController Class가 할 일이 명확해짐
