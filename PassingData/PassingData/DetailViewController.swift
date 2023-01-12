//
//  DetailViewController.swift
//  PassingData
//
//  Created by seobyeonggwan on 2023/01/11.
//

import UIKit

class DetailViewController: UIViewController {

    var someString = "initial string"
    
    @IBOutlet weak var someLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        someLabel.text = someString
        
    }


    

}
