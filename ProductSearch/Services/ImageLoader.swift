import Foundation

protocol ImageLoaderProtocol {
    func loadDataImage(urlString: String, queryItems: [URLQueryItem], handler: @escaping (Result<Data, Error>) -> Void)
}

class ImageLoader: ImageLoaderProtocol {
    private let networkClient: NetworkRouting
    
    init(networkClient: NetworkRouting = NetworkClient()) {
        self.networkClient = networkClient
    }
    
    
    
    func loadDataImage(urlString: String, queryItems: [URLQueryItem], handler: @escaping (Result<Data, Error>) -> Void) {
        
        networkClient.fetch(urlString: urlString, queryItems: queryItems) { result in
            switch result {
            case .success(let data):
                    handler(.success(data))
            case .failure(let error):
                handler(.failure(error))
            }
        }
    }
    
}
