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
