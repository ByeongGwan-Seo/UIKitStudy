//
//  TodoDetailViewController.swift
//  TodoWithCoreData
//
//  Created by seobyeonggwan on 2023/01/18.
//

import UIKit
import CoreData

class TodoDetailViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var priorityLow: UIButton!
    @IBOutlet weak var priorityNormal: UIButton!
    @IBOutlet weak var priorityHigh: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    
    @IBAction func setPriority(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            break
        case 2:
            break
        case 3:
            break
            
        default:
            break
        }
    }
    
    
    @IBAction func saveData(_ sender: UIButton) {
        let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        
        
    }
}
