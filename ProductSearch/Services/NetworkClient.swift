import Foundation

protocol NetworkRouting {
    func fetch(urlString: String, queryItems: [URLQueryItem], handler: @escaping (Result<Data, Error>) -> Void)
}


struct NetworkClient: NetworkRouting {
    
    private enum NetworkError: Error {
        case codeError
    }
    
    func fetch(urlString: String, queryItems: [URLQueryItem], handler: @escaping (Result<Data, Error>) -> Void) {
        
        let urlComponents = URLComponents(string: urlString)
        guard var urlComponents = urlComponents else { return }
        urlComponents.queryItems = queryItems
        
        var request = URLRequest(url: urlComponents.url!)
        request.setValue("Basic 0JDQtNC80LjQvdC40YHRgtGA0LDRgtC+0YA6UHNtbWs5MDEyNA==", forHTTPHeaderField: "Authorization")
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            // Проверяем, пришла ли ошибка
            if let error = error {
                handler(.failure(error))
                return
            }
            
            // Проверяем, что нам пришёл успешный код ответа
            if let response = response as? HTTPURLResponse,
               response.statusCode < 200 || response.statusCode >= 300 {
                handler(.failure(NetworkError.codeError))
                return
            }
            // Возвращаем данные
            guard let data = data else { return }
            handler(.success(data))
        }
        
        task.resume()
    }
}
