import Foundation

class ProductFactory: ProductFactoryProtocol {
    
    let listProduct: [Product] = [
        Product(image: [],
                code: 11111,
                barcode: 11111,
                name: "Кофта муж син черн полоск",
                amount: 3,
                amountStoreOne: 1,
                amountStoreTwo: 2,
                price: 2000,
                isSeasonal: true,
                quality: [],
                qualityStoreOne: [],
                qualityStoreTwo: []
               ),
        Product(image: ["The Dark Knight", "The Godfather"],
                code: 23411,
                barcode: 23411,
                name: "Блузка женск син черн карак 34-40",
                amount: 1,
                amountStoreOne: 1,
                amountStoreTwo: 0,
                price: 1050,
                isSeasonal: true,
                quality: [],
                qualityStoreOne: [],
                qualityStoreTwo: []
               ),
        Product(image: ["Kill Bill"],
                code: 13411,
                barcode: 13411,
                name: "Носки детск 34-40",
                amount: 30,
                amountStoreOne: 13,
                amountStoreTwo: 17,
                price: 60,
                isSeasonal: true,
                quality: [],
                qualityStoreOne: [],
                qualityStoreTwo: []
               ),
        Product(image: ["The Avengers"],
                code: 14563,
                barcode: 14563,
                name: "Блузка детск красн мульт узор",
                amount: 1,
                amountStoreOne: 0,
                amountStoreTwo: 1,
                price: 880,
                isSeasonal: true,
                quality: [],
                qualityStoreOne: [],
                qualityStoreTwo: []
               ),
        Product(image: ["Deadpool"],
                code: 10500,
                barcode: 10500,
                name: "Дубленка женск коричн",
                amount: 1,
                amountStoreOne: 1,
                amountStoreTwo: 0,
                price: 5000,
                isSeasonal: false,
                quality: [],
                qualityStoreOne: [],
                qualityStoreTwo: []
               ),
        Product(image: ["The Green Knight"],
                code: 309456,
                barcode: 309456,
                name: "Перчатки детск мульт",
                amount: 20,
                amountStoreOne: 4,
                amountStoreTwo: 16,
                price: 80,
                isSeasonal: false,
                quality: [],
                qualityStoreOne: [],
                qualityStoreTwo: []
               ),
        Product(image: ["Old"],
                code: 29814,
                barcode: 29814,
                name: "Джинсы женск син JEANS",
                amount: 3,
                amountStoreOne: 1,
                amountStoreTwo: 2,
                price: 2000,
                isSeasonal: true,
                quality: [],
                qualityStoreOne: [],
                qualityStoreTwo: []
               ),
        Product(image: ["The Ice Age Adventures of Buck Wild"],
                code: 10001,
                barcode: 10001,
                name: "Футболка мужск черн однотон",
                amount: 10,
                amountStoreOne: 9,
                amountStoreTwo: 1,
                price: 550,
                isSeasonal: true,
                quality: ["Xl", "2Xl", "3Xl"],
                qualityStoreOne: ["Xl", "2Xl", "3Xl", "4Xl", "5Xl", "6Xl", "7Xl", "8Xl", "9Xl",],
                qualityStoreTwo: ["10Xl"]
               ),
        Product(image: ["Tesla"],
                code: 13222,
                barcode: 13222,
                name: "Блузка женск желт черн син 34-40",
                amount: 1,
                amountStoreOne: 1,
                amountStoreTwo: 0,
                price: 1400,
                isSeasonal: true,
                quality: ["34"],
                qualityStoreOne: ["34"],
                qualityStoreTwo: []
               ),
        Product(
            image: ["Vivarium", "Tesla", "Deadpool"],
            //            image: [],
            code: 19999,
            barcode: 19999,
            name: "Кофта женск трикотаж хаки, железн кнопк Mei ren yu 36-44",
            amount: 4,
            amountStoreOne: 1,
            amountStoreTwo: 3,
            price: 1200,
            isSeasonal: false,
            quality: [],
            qualityStoreOne: [],
            qualityStoreTwo: []
        ),
    ]
    
    func searcProduct(code: Int) -> Product? {
        var result: Product?
        listProduct.forEach { product in
            if product.code == code {
                result = product
            }
        }
        return result
    }
}
