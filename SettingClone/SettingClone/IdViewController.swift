//
//  IdViewController.swift
//  SettingClone
//
//  Created by seobyeonggwan on 2023/01/13.
//

import UIKit

class IdViewController: UIViewController {

    
    @IBOutlet weak var nextButton: UIButton! {
        didSet {
            nextButton.isEnabled = false
        }
    }
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(sender: UITextField) {
        if sender.text?.isEmpty == false {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
    
    
    @IBAction func cancelTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}
