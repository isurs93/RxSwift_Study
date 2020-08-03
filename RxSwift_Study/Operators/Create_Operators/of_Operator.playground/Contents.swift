import UIKit
import RxSwift

// of Operator
// 2개 이상의 요소 방출 시에 사용
// 인자가 여러개 있을때 사용
let disposeBag = DisposeBag()
let apple = "🍎"
let lemon = "🍋"
let kiwi = "🥝"

Observable.of(apple, lemon, kiwi)
    .subscribe { element in print(element) }
    .disposed(by: disposeBag)

Observable.of([1,2], [3,4], [5,6])
    .subscribe {element in print(element) }
    .disposed(by: disposeBag)
