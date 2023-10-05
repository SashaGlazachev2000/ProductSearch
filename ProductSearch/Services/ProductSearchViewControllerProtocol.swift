import Foundation

protocol ProductSearchViewControllerProtocol {
    func filterTextField(text: String?)
    func pushTextAtTextField(product: ProductStep) -> String
    func pushTextAtStoreTextField(store: Store) -> String
    func nextIndexImage()
    func backIndexImage() 
}
