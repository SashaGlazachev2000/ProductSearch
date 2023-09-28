//
//  ViewController.swift
//  ProductSearch
//
//  Created by Alexandr Glazachev on 27.09.2023.
//

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
        guard let text = textField.text else {return}
        if text == "" {return}
        let code = Int(text)
        guard let code = code else { return }
        factoryProduct?.searcProduct(code: code)
    }
    
    func show(product: Product){
        imageView.image = UIImage(named: product.image)
    }
}

