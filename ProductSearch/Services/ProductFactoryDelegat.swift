import Foundation

protocol ProductFactoryDelegat {
    func pushProductToController(product: Product)
    func pushImageToController(data: Data)
    func showNetworkError(error: String)
}
