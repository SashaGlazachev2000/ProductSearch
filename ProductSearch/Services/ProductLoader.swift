import Foundation

protocol ProductLoaderProtocol {
    func loadProduct(urlString: String, queryItems: [URLQueryItem], handler: @escaping (Result<Product, Error>) -> Void)
}

class ProductLoader: ProductLoaderProtocol {
    private let networkClient: NetworkRouting
    
    init(networkClient: NetworkRouting = NetworkClient()) {
        self.networkClient = networkClient
    }
    
    
    
    func loadProduct(urlString: String, queryItems: [URLQueryItem], handler: @escaping (Result<Product, Error>) -> Void) {
        
//        guard let url = URL(string: "\(url)") else {
//            preconditionFailure("Unable to construct mostPopularMoviesUrl")
//        }
        
        networkClient.fetch(urlString: urlString, queryItems: queryItems) { result in
            switch result {
            case .success(let data):
                do{
                    let product = try JSONDecoder().decode(Product.self, from: data)
                    handler(.success(product))
                } catch{
                    handler(.failure(error))
                }
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
    
}
