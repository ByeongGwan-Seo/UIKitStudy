//
//  PopupViewController.swift
//  Popup_complex
//
//  Created by seobyeonggwan on 2023/01/06.
//

import UIKit

class PopupViewController: UIViewController {

    
    @IBOutlet weak var popupView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        popupView.layer.cornerRadius = 25
    }
    

    @IBAction func closeBtnTapped(_ sender: UIButton) {
        self.dismiss(animated: false)
    }
    
    
    
    @IBAction func doneBtnTapped(_ sender: UIButton) {
        print("done Btn Tapped")
    }
    
}
