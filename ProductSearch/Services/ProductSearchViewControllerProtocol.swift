import Foundation

protocol ProductSearchViewControllerProtocol {
    func filterTextField(text: String?)
    func pushTextAtTextField(product: Product) -> String
}