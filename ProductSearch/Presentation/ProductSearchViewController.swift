import UIKit

class ProductSearchViewController: UIViewController, ProductSearchPresenterDelegate{
    
    var presenter: ProductSearchPresenter?
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var textViewInfo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        presenter = ProductSearchPresenter(viewController: self)
        
        textField.delegate = self
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.systemBlue.cgColor
        
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction func searchButtonClicked(_ sender: Any) {
        presenter?.filterTextField(text: textField.text)
    }
    
    func show(product: Product){
        imageView.image = UIImage(named: product.image)
        textViewInfo.text = presenter?.pushTextAtTextField(product: product)
    }
    
}

