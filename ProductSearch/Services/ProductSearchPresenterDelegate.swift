import Foundation

protocol ProductSearchPresenterDelegate {
    func show(product: ProductStep, currentIndex: Int, isEmptyImage: Bool)
}
