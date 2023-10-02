import UIKit

extension ProductSearchViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2, delay: 0, options: .transitionCurlUp, animations: {
            textField.layer.borderWidth = 1.5
            textField.layer.cornerRadius = 20
        })
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.2, delay: 0, options: .transitionCurlUp, animations: {
            textField.layer.borderWidth = 1.5
            textField.layer.borderWidth = 0
            textField.layer.cornerRadius = 10
        })
    }
    
}
