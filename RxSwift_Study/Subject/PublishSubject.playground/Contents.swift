import UIKit
import RxSwift

let disposeBag = DisposeBag()

enum MyError: Error {
    case error
}

// PublishSubject
// 생성시 아무런 이벤트가 저장되지 않은다.
// 옵저버이면서 옵저버블이다.
let subject = PublishSubject<String>()

// 이 이벤트는 사라짐
subject.onNext("Hello")

// 구독 후 이벤트를 전달해야 출력한다
let o1 = subject.subscribe { print(">> 1", $0) }
o1.disposed(by: disposeBag)

// Next Event 생성
subject.onNext("RxSwift")

let o2 = subject.subscribe { print(">> 2", $0) }
o2.disposed(by: disposeBag)

subject.onNext("Subject")

// completed Event는 이후에 생성되는 옵저버에도 complete Event를 발생시킨다.
//subject.onCompleted()
// error Event 역시 이후에 생성되는 옵저버에도 error Event를 발생시킨다.
subject.onError(MyError.error)

let o3 = subject.subscribe { print(">> 3", $0) }
o3.disposed(by: disposeBag)
