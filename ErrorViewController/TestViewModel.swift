import Foundation
import RxSwift
import RxCocoa


struct TestViewModel {
    //out
    let showNetworkError: Observable<Void>?
    
    //input
    let load = PublishSubject<Void>()
    
    init() {
        showNetworkError = load.subscribeOn(ConcurrentMainScheduler.instance)
    }
}
