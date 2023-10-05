import Foundation

protocol ProductFactoryDelegat {
    func pushProductToController(product: ProductStep)
    func pushImageToController(data: Data)
}
