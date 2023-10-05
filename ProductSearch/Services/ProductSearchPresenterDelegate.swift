import Foundation

protocol ProductSearchPresenterDelegate {
    func show(product: ProductStep, currentIndex: Int)
    func showImage(data: Data)
}
