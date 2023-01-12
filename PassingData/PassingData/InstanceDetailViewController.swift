//
//  InstanceDetailViewController.swift
//  PassingData
//
//  Created by seobyeonggwan on 2023/01/11.
//

import UIKit

class InstanceDetailViewController: UIViewController {

    var mainVC: ViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


    
    @IBAction func sendDataMainVc(_ sender: UIButton) {
        mainVC?.mainDataLabel.text = "some data"
        self.dismiss(animated: true)
    }
    
}
