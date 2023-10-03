import Foundation

protocol ProductSearchViewControllerProtocol {
    func filterTextField(text: String?)
    func pushTextAtTextField(product: Product) -> String
    func pushTextAtStoreOneTextField(product: Product) -> String
    func pushTextAtStoreTwoTextField(product: Product) -> String
    func nextIndexImage()
    func backIndexImage() 
}
