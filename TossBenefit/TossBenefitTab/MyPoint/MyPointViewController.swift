//
//  MyPointViewController.swift
//  TossBenefitTab
//
//  Created by seobyeonggwan on 2022/12/20.
//

import UIKit

class MyPointViewController: UIViewController {

    @IBOutlet weak var pointLabel: UILabel!
    
    var point: MyPoint = .default
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        
    }
}
