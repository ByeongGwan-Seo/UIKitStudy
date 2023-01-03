//
//  ViewController.swift
//  CustomKeyboard
//
//  Created by seobyeonggwan on 2022/12/31.
//

import UIKit

class ViewController: UIViewController, CustomKeyboardDelegate {

    @IBOutlet weak var firstTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myKeyboard = Bundle.main.loadNibNamed("CustomKeyboard", owner: nil)
        
        let myKeyboardView = myKeyboard?.first as? CustomKeyboard
        myKeyboardView?.delegate = self
        firstTextField.inputView = myKeyboardView
    }
    
    func keyboardTapped(str: String) {
        print("keyboard tapped: \(str)")
        
        let oldNumber = Int(firstTextField.text ?? "")
        var newNumber = Int(str)
        
        if str == "00" && oldNumber != nil {
            newNumber = ((oldNumber ?? 0) * 100)
        }
        
        if str == "000" && oldNumber != nil {
            newNumber = ((oldNumber ?? 0) * 1000)
        }
        
        if let hasNumber = newNumber {
            let numberFormatter = NumberFormatter()
            
            firstTextField.text = String(describing: hasNumber)
        }
    }
}

