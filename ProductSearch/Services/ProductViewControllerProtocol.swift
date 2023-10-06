import UIKit

protocol ProductViewControllerProtocol: AnyObject, UIViewController {
    func show(product: ProductStep, currentIndex: Int)
    func showImage(data: Data)
    func startIndicatorImage()
    func stopIndicatorImage()
}
