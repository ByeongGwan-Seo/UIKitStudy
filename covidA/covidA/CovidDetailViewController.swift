//
//  CovidDetailViewController.swift
//  covidA
//
//  Created by seobyeonggwan on 2022/12/08.
//

import UIKit

class CovidDetailViewController: UITableViewController {

    @IBOutlet weak var newCseCell: UITableViewCell!
    @IBOutlet weak var totalCaseCell: UITableViewCell!
    @IBOutlet weak var recoveredCell: UITableViewCell!
    @IBOutlet weak var deathCell: UITableViewCell!
    @IBOutlet weak var percentageCell: UITableViewCell!
    @IBOutlet weak var overseasInflowCell: UITableViewCell!
    @IBOutlet weak var regionalOutbreakCell: UITableViewCell!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
   
    }
}
