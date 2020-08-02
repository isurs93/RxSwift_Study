import UIKit
import RxSwift

// just Operator는 파라미터로 전달한 요소를 그대로 방출함.
// 하나의 요소를 방출 할 때 사용한다.
let disposeBag = DisposeBag()
let element = "😏"

Observable.just(element)
    .subscribe{ event in print(event) }
    .disposed(by: disposeBag)

Observable.just([1,2,3])
    .subscribe { event in print(event) }
    .disposed(by: disposeBag)



