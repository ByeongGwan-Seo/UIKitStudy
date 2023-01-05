//
//  ViewController.swift
//  FloatButton
//
//  Created by seobyeonggwan on 2023/01/04.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showPopup" {
            guard let floatingVC = segue.destination as? FloatingButtonListViewController else { return }
            floatingVC.modalPresentationStyle = .overCurrentContext
        }
    }
}

