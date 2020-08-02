import UIKit
import RxSwift

// Observable은 이벤트를 Observer에게 전달한다.
// Observer는 Observable을 감시(Subscribe 구독)을 한다
// Observable은 Error와 Complete를 발생한다.

let disposeBag = DisposeBag()

Observable.just("Hello, RxSwift")
    .subscribe { print($0)}
    .disposed(by: disposeBag)
