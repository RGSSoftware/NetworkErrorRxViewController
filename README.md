# NetworkErrorRxViewController
An example showing how to propagate network errors from a ViewModel to a ViewController using RxSwift.

```swift

extension UIViewController {
    func showNextworkError() {
    CDAlertView(title: "Network", message: "Network error, please try again...", type: .error).show()
    }
}

...

import UIKit
import NSObject_Rx

class ViewController: UIViewController {

    let viewModel = TestViewModel()

    override func viewDidLoad() {
    super.viewDidLoad()

        viewModel.showNetworkError?.subscribe(onNext:{[weak self] in
            self?.showNextworkError()
        }).addDisposableTo(rx_disposeBag)
    }

    @IBAction func buttonDidTap(_ sender: Any) {
    viewModel.load.onNext()
    }
}

...

struct TestViewModel {
    //out
    let showNetworkError: Observable<Void>?

    //input
    let load = PublishSubject<Void>()

    init() {
        showNetworkError = load.subscribeOn(ConcurrentMainScheduler.instance)
    }
}

```

