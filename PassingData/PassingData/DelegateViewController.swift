//
//  DelegateViewController.swift
//  PassingData
//
//  Created by seobyeonggwan on 2023/01/11.
//

import UIKit

protocol DelegateViewControllerDelegate: AnyObject {
    func passString(string: String)
}

class DelegateViewController: UIViewController {
    
    weak var delegate: DelegateViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func passDataToMainVC(_ sender: UIButton) {
        delegate?.passString(string: "delegate passed data!")
        self.dismiss(animated: true)
    }
}
