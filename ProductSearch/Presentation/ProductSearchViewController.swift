import UIKit

class ProductSearchViewController: UIViewController, ProductViewControllerProtocol{
    
    private var presenter: ProductSearchViewControllerProtocol?
    private var alert: AlertPresenter?
    
    @IBOutlet private weak var indexImageLable: UILabel!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var textViewInfo: UITextView!
    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var searchImageView: UIImageView!
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
        imageView.backgroundColor = .appGray
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
        activeBackButtonImage(false)
        activeNextButtonImage(false)
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
        searchImageView.image = nil
        imageView.backgroundColor = .appTextBackground
    }
    
    func stopIndicatorImage() {
        indicatorImage.stopAnimating()
    }
    
    func show(product: ProductStep){
        textViewInfo.text = presenter?.pushTextAtTextField(product: product)
        textViewInfo.clipsToBounds = true
        textViewInfo.backgroundColor = .appGray
        textViewInfo.layer.cornerRadius = 10
    }
    
    func showIndexImage(text: String) {
        indexImageLable.text = text
    }
    
    func showImage(data: Data) {
        imageView.image = UIImage(data: data)
    }
    
    func activeBackButtonImage(_ isActive: Bool) {
        backButtonImage.alpha = isActive ? 1 : 0
        nextButtonImage.isEnabled = isActive
    }
    
    func activeNextButtonImage(_ isActive: Bool) {
        nextButtonImage.alpha = isActive ? 1 : 0
        nextButtonImage.isEnabled = isActive
    }
    
}

