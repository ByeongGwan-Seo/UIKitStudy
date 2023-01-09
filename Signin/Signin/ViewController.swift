//
//  ViewController.swift
//  Signin
//
//  Created by seobyeonggwan on 2023/01/06.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var emailErrorText: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordErrorText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //textfield 값이 변경되는 걸 감지 -> 기본적으로는 없음
        
        emailTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
    }
    
    
    @objc func textFieldEdited(textField: UITextField) {
        let emailErrorHeight = emailErrorText.heightAnchor
        
        if textField == emailTextField {
            print("email edited \(textField.text ?? "")")
            
            if isValidEmail(email: textField.text) == true {
                emailErrorHeight.constraint(equalToConstant: 0).isActive = true
            } else {
                emailErrorHeight.constraint(equalToConstant: 16).isActive = true
            }
            
        } else if textField == passwordTextField {
            print("password edited \(textField.text ?? "")")
            
        }
    }
    
    //이메일 정규식 - regular expression
    
    func isValidEmail(email:String?) -> Bool {
        guard email != nil else { return false }
        
        let regEx = "[A-Z0-9a-z.-_]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        
        let pred = NSPredicate(format: "SELF MATCHES %@", regEx)
        return pred.evaluate(with: email)
    }
}

