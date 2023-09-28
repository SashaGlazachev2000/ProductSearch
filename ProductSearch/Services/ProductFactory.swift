import Foundation

class ProductFactory: ProductFactoryProtocol {
    private var viewController: ProductFactoryDelegat
    
    init(viewController: ProductFactoryDelegat) {
        self.viewController = viewController
    }
    
    let listProduct: [Product] = [
        Product(image: "The Godfather",
                code: 11122,
                barcode: 11122,
                name: "Кофта муж син черн полоск",
                amount: 3,
                price: 2000,
                isSeasonal: true,
                quality: []),
        Product(image: "The Dark Knight",
                code: 23411,
                barcode: 23411,
                name: "Блузка женск син черн карак 34-40",
                amount: 1,
                price: 1050,
                isSeasonal: true,
                quality: []),
        Product(image: "Kill Bill",
                code: 13411,
                barcode: 13411,
                name: "Носки детск 34-40",
                amount: 30,
                price: 60,
                isSeasonal: true,
                quality: []),
        Product(image: "The Avengers",
                code: 14563,
                barcode: 14563,
                name: "Блузка детск красн мульт узор",
                amount: 1,
                price: 880,
                isSeasonal: true,
                quality: []),
        Product(image: "Deadpool",
                code: 10500,
                barcode: 10500,
                name: "Дубленка женск коричн",
                amount: 1,
                price: 5000,
                isSeasonal: false,
                quality: []),
        Product(image: "The Green Knight",
                code: 309456,
                barcode: 309456,
                name: "Перчатки детск мульт",
                amount: 20,
                price: 80,
                isSeasonal: false,
                quality: []),
        Product(image: "Old",
                code: 29814,
                barcode: 29814,
                name: "Джинсы женск син JEANS",
                amount: 3,
                price: 2000,
                isSeasonal: true,
                quality: []),
        Product(image: "The Ice Age Adventures of Buck Wild",
                code: 10001,
                barcode: 10001,
                name: "Футболка мужск черн однотон",
                amount: 3,
                price: 550,
                isSeasonal: true,
                quality: []),
        Product(image: "Tesla",
                code: 13222,
                barcode: 13222,
                name: "Блузка женск желт черн син 34-40",
                amount: 1,
                price: 1400,
                isSeasonal: true,
                quality: []),
        Product(image: "Vivarium",
                code: 19999,
                barcode: 19999,
                name: "Кофта тепл в ассорт пузырьки",
                amount: 4,
                price: 1200,
                isSeasonal: false,
                quality: []),
    ]
    
    func searcProduct(code: Int) {
        if listProduct.contains(where: {$0.code == code}) {
           print(code)
        } else {
           print("Noooo code")
            
        }
    }
}
