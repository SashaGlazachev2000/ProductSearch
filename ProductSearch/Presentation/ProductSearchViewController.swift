import UIKit

class ProductSearchViewController: UIViewController, ProductSearchPresenterDelegate{
    
    var presenter: ProductSearchPresenter?
    
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var textViewInfo: UITextView!
    @IBOutlet private weak var backButtonImage: UIButton!
    @IBOutlet private weak var nextButtonImage: UIButton!
    @IBOutlet private weak var searchButton: UIStackView!
    @IBOutlet private weak var indexImageLable: UILabel!
    
    @IBOutlet weak var responceImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = ProductSearchPresenter(viewController: self)
        
        buttonImageSettings()
        imageProductSettings()
        
        textField.delegate = self
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.systemBlue.cgColor
        
        self.hideKeyboardWhenTappedAround()
    }
    
    @IBAction private func searchButtonClicked(_ sender: Any) {
        presenter?.filterTextField(text: textField.text)
    }
    
    @IBAction private func backButtonImageClicked(_ sender: Any) {
        presenter?.backIndexImage()
    }
    
    @IBAction private func nextButtonImageClicked(_ sender: Any) {
        presenter?.nextIndexImage()
    }
    
    private func imageProductSettings() {
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
    }
    
    private func buttonImageSettings() {
        searchButton.clipsToBounds = true
        searchButton.layer.cornerRadius = 10
        backButtonImage.clipsToBounds = true
        nextButtonImage.clipsToBounds = true
        let height = backButtonImage.layer.bounds.height
        let radius = height / 2
        backButtonImage.layer.cornerRadius = radius
        nextButtonImage.layer.cornerRadius = radius
        
    }
    
    
    func show(product: Product, currentIndex: Int, isEmptyImage: Bool){
        imageView.tintColor = .appBackground
        imageView.image = isEmptyImage ? UIImage(systemName: "xmark") : UIImage(named: product.image[currentIndex])
        responceImageView.image = isEmptyImage ? UIImage(systemName: "xmark.circle") : UIImage(systemName: "checkmark.circle")
        responceImageView.tintColor = isEmptyImage ? .appRed : .appGreen
        textViewInfo.text = presenter?.pushTextAtTextField(product: product)
        indexImageLable.text = isEmptyImage ? "0/0" : "\(currentIndex + 1)/\(product.image.count)"
    }
    
    
}

