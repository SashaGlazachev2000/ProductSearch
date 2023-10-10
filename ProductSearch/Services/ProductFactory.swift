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
    
    
    func sercImageNetwork(code: Int, index: Int) {
        DispatchQueue.global().async { [weak self] in
            guard let self = self else { return }
            
            let list: [URLQueryItem] = [
                URLQueryItem(name: "code", value: "\(code)"),
                URLQueryItem(name: "index", value: "\(index)")]
            
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

            self.loaderProduct.loadProduct(
                urlString: "https://ceshops.ru:8443/sem/hs/product_search",
                queryItems: [URLQueryItem(name: "barcode", value: "\(code)")]) { result in

                    switch result {

                    case .success(let product):
                        DispatchQueue.main.async { [weak self] in
                            guard let self = self else { return }
                            self.delegate.pushProductToController(product: product)
                        }
                        
                        self.sercImageNetwork(code: code, index: 1)
                        
                    case .failure(let error):
                        self.showError(error: error)
                    }
                }
        }
    }
}
