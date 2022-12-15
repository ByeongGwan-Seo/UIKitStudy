//
//  AddAlertViewController.swift
//  NotificationA
//
//  Created by seobyeonggwan on 2022/12/14.
//

import UIKit

class AddAlertViewController: UIViewController {
    
    var pickedDate: ((_ date: Date) -> Void)?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    
    @IBAction func dismissButtonTapped(_ sender: UIBarButtonItem) {
    }
    
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        pickedDate?(datePicker.date)
        self.dismiss(animated: true, completion: nil)
    }
    
}
