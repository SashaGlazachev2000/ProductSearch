import UIKit

protocol ProductViewControllerProtocol: AnyObject, UIViewController {
    func show(product: ProductStep)
    func showImage(data: Data)
    func startIndicatorImage()
    func showIndexImage(text: String)
    func stopIndicatorImage()
    func activeBackButtonImage(_ isActive: Bool)
    func activeNextButtonImage(_ isActive: Bool)
}
