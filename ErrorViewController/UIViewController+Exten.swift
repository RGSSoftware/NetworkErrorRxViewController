import UIKit
import CDAlertView

extension UIViewController {
    func showNextworkError() {
        CDAlertView(title: "Network", message: "Network error, please try again...", type: .error).show()
    }
}
