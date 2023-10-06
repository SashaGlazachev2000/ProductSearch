import UIKit

class AlertPresenter: AlertPresenterProtocol{
    
    private let viewController: ProductViewControllerProtocol
    
    init(viewController: ProductViewControllerProtocol) {
        self.viewController = viewController
    }
    
    func show(quiz result: AlertModel) {
        let alert = UIAlertController(
            title: result.title,
            message: result.message,
            preferredStyle: .alert)
        alert.view.accessibilityIdentifier = "Game results"
        
        let alertAtion = UIAlertAction(
            title: result.titleButton,
            style: .default) { _ in
            result.action()
        }
        
        alert.addAction(alertAtion)
        viewController.present(alert, animated: true)
    }
}
