//
//  ViewController.swift
//  Popup_complex
//
//  Created by seobyeonggwan on 2023/01/06.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func PopupBtnTapped(_ sender: UIButton) {
        //how to load popupViewController
        let storyboard = UIStoryboard.init(name: "PopupViewController", bundle: nil)
        
        let popupVC = storyboard.instantiateViewController(withIdentifier: "PopupViewController")
        
        popupVC.modalPresentationStyle = .overCurrentContext
        
        self.present(popupVC, animated: false)
        
    }
}


