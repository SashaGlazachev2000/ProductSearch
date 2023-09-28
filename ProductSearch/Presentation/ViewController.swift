//
//  ViewController.swift
//  ProductSearch
//
//  Created by Alexandr Glazachev on 27.09.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textViewInfo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
    }

    @IBAction func searchButtonClicked(_ sender: Any) {
        guard let text = textField.text else {return}
        if text == "" {return}
        print(text)
       
    }
}

