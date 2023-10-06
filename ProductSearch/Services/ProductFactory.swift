import Foundation

class ProductFactory: ProductFactoryProtocol {
    
    let delegate: ProductFactoryDelegat
    let loaderProduct: ProductLoaderProtocol
    let loaderImage: ImageLoaderProtocol
    
    init(loaderProduct: ProductLoaderProtocol = ProductLoader(), loaderImage: ImageLoaderProtocol = ImageLoader(), delegate: ProductFactoryDelegat) {
        self.loaderProduct = loaderProduct
        self.delegate = delegate
        self.loaderImage = loaderImage
    }
    
    
    private func sercImageNetwork(code: Int) {
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            
            let list: [URLQueryItem] = [
                URLQueryItem(name: "code", value: "\(code)"),
                URLQueryItem(name: "index", value: "\(1)")]
            
            loaderImage.loadDataImage(
                urlString: "https://ceshops.ru:8443/sem/hs/product_img",
                queryItems: list) { result in
                    switch result {
                    case .success(let data):
                        DispatchQueue.main.async { [weak self] in
                            guard let self = self else { return }
                            self.delegate.pushImageToController(data: data)
                        }
                    case .failure(let error):
                        self.showError(error: error)
                    }
                }
        }
    }
    
    func showError(error: Error) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.delegate.showNetworkError(error: error.localizedDescription)
        }
    }
    
    
    func searchProduct(code: Int) {
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }

            loaderProduct.loadProduct(
                urlString: "https://ceshops.ru:8443/sem/hs/product_search",
                queryItems: [URLQueryItem(name: "barcode", value: "\(code)")]) { result in

                    switch result {

                    case .success(let product):
                        let imageList = Data()

                        let productStep = ProductStep(
                            image: imageList,
                            code: product.code,
                            barcode: product.barcode,
                            name: product.name,
                            amount: product.amount,
                            price: product.price,
                            isSeasonal: product.isSeasonal,
                            quality: product.quality,
                            stores: product.stores)

                        DispatchQueue.main.async { [weak self] in
                            guard let self = self else { return }
                            self.delegate.pushProductToController(product: productStep)
                        }
                        
                        self.sercImageNetwork(code: code)
                        
                    case .failure(let error):
                        self.showError(error: error)
                    }
                }
        }
    }
}
