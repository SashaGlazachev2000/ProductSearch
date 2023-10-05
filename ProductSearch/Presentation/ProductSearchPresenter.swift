import Foundation
import UIKit

class ProductSearchPresenter: ProductSearchViewControllerProtocol {
    private var currentImageIndex = 0
    private var amountIndexImage = 0
    private var isEmptyImage = true
    private var factoryProduct: ProductFactoryProtocol?
    private var viewController: ProductSearchPresenterDelegate
    private var product: ProductStep?
    
    init(viewController: ProductSearchPresenterDelegate) {
        self.viewController = viewController
        factoryProduct = ProductFactory()
    }
    
    private func pushCodeFactory(code: Int) {
        let product = factoryProduct?.searcProduct(code: code)
        guard let product = product else { return }
        self.isEmptyImage = product.image.isEmpty
        self.product = product
        currentImageIndex = 0
        amountIndexImage = product.image.count
        viewController.show(product: product, currentIndex: currentImageIndex, isEmptyImage: self.isEmptyImage)
        
    }
    
    func filterTextField(text: String?) {
        guard let text = text else { return }
        if text == "" { return }
        let code = Int(text)
        guard let code = code else { return }
        pushCodeFactory(code: code)
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
    
    func pushTextAtTextField(product: ProductStep) -> String {
        var result = ""
        result += "ИМЯ: \(product.name)\n"
        result += "КОД: \(product.code)\n"
        result += "КОЛ-ВО: \(product.amount)\n"
        result += "СЕЗОН: \(product.isSeasonal ? "СЕЗОН" : "НЕСЕЗОН")\n"
        return result
    }
    
    func pushTextAtStoreTextField(store: Store) -> String {
        var result = ""
        result += "\(store.store)\n\n"
        result += "Кол-во: \(store.amount)\n"
        result += "Свойства: \(store.quality.isEmpty ? "Нет" : "\(store.quality)")\n"
        return result
    }
    
    
}
