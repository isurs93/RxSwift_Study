import UIKit
import RxSwift

let bag = DisposeBag()

enum MyError: Error {
    case error
}

let greetings = PublishSubject<String>()
let languages = PublishSubject<String>()

Observable.combineLatest(greetings, languages) { lhs, rhs
    -> String in
    return "\(lhs) \(rhs)"
}
    .subscribe({ print($0) })
    .disposed(by: bag)

// 아직 Next가 발생하지 않는다.
greetings.onNext("Hi")
// 이제 Next가 발생한다.
languages.onNext("World!")

// 이제 둘중에 하나만 Next가 발생하기만 하면 Next가 실행된다.
greetings.onNext("Hello")
languages.onNext("RxSwift")

// 아직 completed Event가 발생하지 않는다
greetings.onCompleted()

// 둘중에 하나라도 에러가 발생하면 바로 Error 이벤트를 발생한다.
languages.onError(MyError.error)

// 이제 completed Event가 발생한다
languages.onCompleted()

