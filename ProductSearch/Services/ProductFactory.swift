import Foundation

class ProductFactory: ProductFactoryProtocol {
    
    let loader: ProductLoaderProtocol
    
    init(loader: ProductLoader = ProductLoader()) {
        self.loader = loader
    }
    
    
    private let product: Product = Product(
        images_count: 3,
        code: 19999,
        barcode: 19999,
        name: "Кофта женск трикотаж хаки, железн кнопк Mei ren yu 36-44",
        amount: 4,
        price: 1200,
        isSeasonal: false,
        quality: "36, 37, 38, 39",
        stores: [
            Store(store: "Мг-", amount: 3, quality: "36, 37, 38"),
            Store(store: "Кв-", amount: 1, quality: "39")
        ]
    )
    
    
    func mockEncode() -> Data?{
        do{
            let res = try JSONEncoder().encode(product)
            
            return res
        } catch {}
        return nil
    }
    
    
    func searcProduct(code: Int) -> ProductStep? {
        
        loader.loadProduct(
            urlString: "https://ceshops.ru:8443/sem/hs/product_search",
            queryItems: [URLQueryItem(name: "barcode", value: "22303")]) { result in
                
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
                
                print(productStep.code)
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    
}


// В headers необходимол добавить такой параметр:
// Authorization |       "Basic 0JDQtNC80LjQvdC40YHRgtGA0LDRgtC+0YA6UHNtbWs5MDEyNA=="

// Запрос 1
//Покарз на экране
// После выполнение запрос 2
//Показ фото с индекс1


//https://ceshops.ru:8443/sem/hs/product_search?barcode=22303
//https://ceshops.ru:8443/sem/hs/product_img?code=22303&index=1
