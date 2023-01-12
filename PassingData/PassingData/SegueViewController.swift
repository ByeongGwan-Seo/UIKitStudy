//
//  SegueViewController.swift
//  PassingData
//
//  Created by seobyeonggwan on 2023/01/11.
//

import UIKit

class SegueViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    
    var dataString = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataLabel.text = dataString
    }
}
