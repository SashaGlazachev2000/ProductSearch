import UIKit

class ViewController: UIViewController, ProductFactoryDelegat {
    
    private var factoryProduct: ProductFactoryProtocol?
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var textViewInfo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        factoryProduct = ProductFactory(viewController: self)
    }

    @IBAction func searchButtonClicked(_ sender: Any) {
       filterTextField()
    }
    
    private func filterTextField() {
        guard let text = textField.text else { return }
        if text == "" { return }
        let code = Int(text)
        guard let code = code else { return }
        factoryProduct?.searcProduct(code: code)
    }
    
    func show(product: Product){
        imageView.image = UIImage(named: product.image)
        textViewInfo.text = pushTextAtTextField(product: product)
        
    }
    
    func pushTextAtTextField(product: Product) -> String{
        var result = ""
        result += "Код товара: \(product.code)\n"
        result += "Кол-во: \(product.amount)\n"
        result += "Сезон: \(product.isSeasonal ? "СЕЗОН" : "НЕСЕЗОН")\n"
        result += "Свойства: \(product.quality.isEmpty ? "Нет" : "\(product.quality)")\n"
        return result
    }
}

