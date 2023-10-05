import Foundation

struct Product: Codable {
    let images_count: Int
    let code: Int
    let barcode: Int
    let name: String
    let amount: Int
    let price: Float
    let isSeasonal: Bool
    let quality: String
    let stores: [Store]
}

