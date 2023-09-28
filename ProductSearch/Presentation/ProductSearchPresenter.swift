import Foundation
import UIKit

class ProductSearchPresenter: ProductSearchViewControllerProtocol {
    private var factoryProduct: ProductFactoryProtocol?
    private var viewController: ProductSearchPresenterDelegate
    
    init(viewController: ProductSearchPresenterDelegate) {
        self.viewController = viewController
        factoryProduct = ProductFactory()
    }
    
    func filterTextField(text: String?) {
        guard let text = text else { return }
        if text == "" { return }
        let code = Int(text)
        guard let code = code else { return }
        let product = factoryProduct?.searcProduct(code: code)
        guard let product = product else { return }
        viewController.show(product: product)
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
