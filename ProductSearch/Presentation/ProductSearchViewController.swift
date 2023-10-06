import UIKit

class ProductSearchViewController: UIViewController, ProductViewControllerProtocol{
    
    private var presenter: ProductSearchViewControllerProtocol?
    private var alert: AlertPresenter?
    
    @IBOutlet private weak var indexImageLable: UILabel!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var textViewInfo: UITextView!
    @IBOutlet private weak var storeOneTextView: UITextView!
    @IBOutlet private weak var storeTwoTextView: UITextView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var searchButton: UIStackView!
    @IBOutlet private weak var indicatorImage: UIActivityIndicatorView!
    @IBOutlet private weak var backButtonImage: UIButton!
    @IBOutlet private weak var nextButtonImage: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = ProductSearchPresenter(viewController: self)
        alert = AlertPresenter(viewController: self)
        
        textFieldSettings()
        buttonImageSettings()
        imageProductSettings()
        
        indicatorImage.hidesWhenStopped = true
        
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
        imageView.tintColor = .appBackground
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
    }
    
    private func textFieldSettings() {
        textField.delegate = self
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 10
        textField.layer.borderColor = UIColor.systemBlue.cgColor
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
    
    func startIndicatorImage() {
        indicatorImage.startAnimating()
        imageView.image = nil
    }
    
    func stopIndicatorImage() {
        indicatorImage.stopAnimating()
    }
    
    func show(product: ProductStep, currentIndex: Int){
        
        textViewInfo.text = presenter?.pushTextAtTextField(product: product)
        storeOneTextView.clipsToBounds = true
        storeTwoTextView.clipsToBounds = true
        storeOneTextView.backgroundColor = .appGray
        storeTwoTextView.backgroundColor = .appGray
        storeOneTextView.layer.cornerRadius = 10
        storeTwoTextView.layer.cornerRadius = 10
    }
    
    func showImage(data: Data) {
        imageView.image = UIImage(data: data)
    }
    
}

