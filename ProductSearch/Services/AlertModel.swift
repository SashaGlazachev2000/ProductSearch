import Foundation

struct AlertModel {
    let title: String
    let message: String
    let titleButton: String
    let action: () -> Void
}
