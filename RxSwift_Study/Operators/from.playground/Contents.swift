import UIKit
import RxSwift

// from Operator
// 배열에 있는 요소를 순서대로 하나씩 방출 할 때 사용
// 배열 사용 시
let disposeBag = DisposeBag()
let fruits = ["🍎", "🍐", "🍊", "🍋", "🍓", "🥝"]
let fruits2 = [["🍎", "🍐", "🍊", "🍋", "🍓", "🥝"], ["🍎", "🍐", "🍊", "🍋", "🍓", "🥝"], ["🍎", "🍐", "🍊", "🍋", "🍓", "🥝"]]

Observable.from(fruits2)
    .subscribe{ element in print(element) }
.disposed(by: disposeBag)
