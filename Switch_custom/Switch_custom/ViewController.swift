//
//  ViewController.swift
//  Switch_custom
//
//  Created by seobyeonggwan on 2023/01/06.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var switchBtn: UIButton!
    @IBOutlet weak var switchBg: UIView!
    
    
    @IBOutlet weak var switchBtnCenterX: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        switchBtn.layer.cornerRadius = switchBtn.bounds.height / 2
        switchBg.layer.cornerRadius = switchBg.bounds.height / 2
        
    }
    
    @IBAction func switchBtnTapped(_ sender: UIButton) {
        
        if switchBtnCenterX.constant == 75 {
            switchBtnCenterX.constant = -75
            switchBg.backgroundColor = .systemCyan
        } else {
            switchBtnCenterX.constant = 75
            switchBg.backgroundColor = .black
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        
    }
}

