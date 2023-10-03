import Foundation
import UIKit

class ProductSearchPresenter: ProductSearchViewControllerProtocol {
    private var currentImageIndex = 0
    private var amountIndexImage = 0
    private var isEmptyImage = true
    private var factoryProduct: ProductFactoryProtocol?
    private var viewController: ProductSearchPresenterDelegate
    private var product: Product?
    
    init(viewController: ProductSearchPresenterDelegate) {
        self.viewController = viewController
        factoryProduct = ProductFactory()
    }
    
    func filterTextField(text: String?) {
        guard let text = text else { return }
        if text == "" { return }
        let code = Int(text)
        guard let code = code else { return }
        getProduct(code: code)
    }
    
    func getProduct(code: Int) {
        let product = factoryProduct?.searcProduct(code: code)
        guard let product = product else { return }
        self.isEmptyImage = product.image.isEmpty
        self.product = product
        currentImageIndex = 0
        amountIndexImage = product.image.count
        viewController.show(product: product, currentIndex: currentImageIndex, isEmptyImage: self.isEmptyImage)
        
    }
    
    func nextIndexImage() {
        guard let product = self.product else { return }
        if currentImageIndex == amountIndexImage - 1 { return }
        currentImageIndex += 1
        viewController.show(product: product, currentIndex: currentImageIndex, isEmptyImage: self.isEmptyImage)
    }
    
    func backIndexImage() {
        guard let product = self.product else { return }
        if currentImageIndex == 0 { return }
        currentImageIndex -= 1
        viewController.show(product: product, currentIndex: currentImageIndex, isEmptyImage: self.isEmptyImage)
    }
    
    func pushTextAtTextField(product: Product) -> String {
        var result = ""
        result += "Код товара: \(product.code)\n"
        result += "Кол-во: \(product.amount)\n"
        result += "Сезон: \(product.isSeasonal ? "СЕЗОН" : "НЕСЕЗОН")\n"
        result += "Свойства: \(product.quality.isEmpty ? "Нет" : "\(product.quality)")\n"
        return result
    }
    
}
