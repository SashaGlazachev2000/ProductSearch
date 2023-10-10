import Foundation
import UIKit

class ProductSearchPresenter: ProductSearchViewControllerProtocol, ProductFactoryDelegat {
    
    private var currentImageIndex = 1
    private var amountIndexImage = 0
    private var textIndexImage: String { get { "\(currentImageIndex)/\(amountIndexImage)" } }
    private var factoryProduct: ProductFactoryProtocol?
    private weak var viewController: ProductViewControllerProtocol?
    private var product: ProductStep?
    private var alert: AlertPresenter?
    
    init(viewController: ProductViewControllerProtocol) {
        self.viewController = viewController
        factoryProduct = ProductFactory(delegate: self)
        alert = AlertPresenter(viewController: viewController)
    }
    
    private func pushCodeFactory(code: Int) {
        factoryProduct?.searchProduct(code: code)
        viewController?.startIndicatorImage()
    }
    
    private func convertProductStep(product: Product) -> ProductStep {
        let productStep = ProductStep(
            image: Data(),
            code: product.code,
            barcode: product.barcode,
            name: product.name,
            amount: product.amount,
            price: product.price,
            isSeasonal: product.isSeasonal,
            quality: product.quality,
            stores: product.stores)
        
        return productStep
    }
    
    private func settingsIndexImage() {
        let text = textIndexImage
        viewController?.showIndexImage(text: text)
        
        if amountIndexImage > 1 {
            viewController?.activeBackButtonImage(false)
            viewController?.activeNextButtonImage(true)
        } else {
            viewController?.activeBackButtonImage(false)
            viewController?.activeNextButtonImage(false)
        }
    }
    
    func pushProductToController(product: Product) {
        let productStep = convertProductStep(product: product)
        
        self.product = productStep
        
        if product.images_count != 0 {
            currentImageIndex = 1
        } else {
            currentImageIndex = 0
        }
        
        amountIndexImage = product.images_count
        
        settingsIndexImage()
        
        viewController?.show(product: productStep)
    }
    
    func pushImageToController(data: Data) {
        viewController?.stopIndicatorImage()
        viewController?.showImage(data: data)
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
        
        if currentImageIndex == amountIndexImage { return }
        
        currentImageIndex += 1
        
        if currentImageIndex == amountIndexImage {
            viewController?.activeBackButtonImage(true)
            viewController?.activeNextButtonImage(false)
        }
        
        if currentImageIndex > 1 {
            viewController?.activeBackButtonImage(true)
        }
        
        viewController?.showIndexImage(text: textIndexImage)
        
        viewController?.startIndicatorImage()
        factoryProduct?.sercImageNetwork(code: product.code, index: currentImageIndex)
    }
    
    func backIndexImage() {
        guard let product = self.product else { return }
        
        if currentImageIndex == 1 { return }
        
        currentImageIndex -= 1
        
        if currentImageIndex == 1 {
            viewController?.activeBackButtonImage(false)
            viewController?.activeNextButtonImage(true)
        }
        
        viewController?.showIndexImage(text: textIndexImage)
        
        viewController?.startIndicatorImage()
        factoryProduct?.sercImageNetwork(code: product.code, index: currentImageIndex)
    }
    
    func pushTextAtTextField(product: ProductStep) -> String {
        var result = ""
        result += "ИМЯ: \(product.name)\n"
        result += "КОД: \(product.code)\n"
        result += "ЦЕНА: \(product.price)\n"
        result += "КОЛ-ВО: \(product.amount)\n"
        result += "Сво-во: \(product.quality)\n"
        result += "СЕЗОН: \(product.isSeasonal ? "СЕЗОН" : "НЕСЕЗОН")\n\n"
        
        product.stores.forEach { store in
            result += pushTextAtStoreTextField(store: store)
            result += "\n"
        }
        return result
    }
    
    func pushTextAtStoreTextField(store: Store) -> String {
        var result = ""
        result += "____\(store.store)____\n"
        result += "Кол-во: \(store.amount)\n"
        result += "Свойства: \(store.quality.isEmpty ? "Нет" : "\(store.quality)")\n"
        result += "___________\n"
        return result
    }
    
    func showNetworkError(error: String) {
        viewController?.stopIndicatorImage()
        alert?.show(quiz: AlertModel(
            title: "Ошибка",
            message: error,
            titleButton: "Выйти",
            action: {})
        )
    }
    
    
}
