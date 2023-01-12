//
//  ViewController.swift
//  PassingData
//
//  Created by seobyeonggwan on 2023/01/11.
//

//how to pass the data

/*
 1. instance property
 2. segueway
 3. instance
 4. delegate (delegation, delegate pattern)
 5. closure
 */

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainDataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    //segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailVC = segue.destination as? SegueViewController {
            detailVC.dataString = "abcd"
        }
    }
   
    //instance property
    @IBAction func moveToDetail(_ sender: UIButton) {
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        
        detailVC.someString = "aaa"
        
        self.present(detailVC, animated: true, completion: nil)
        
        detailVC.someLabel.text = "아햏"
        
        
    }
    
    //instance
    @IBAction func moveToInstance(_ sender: UIButton) {
        let detailVC = InstanceDetailViewController(nibName: "InstanceDetailViewController", bundle: nil)
        detailVC.mainVC = self
        detailVC.modalPresentationStyle = .fullScreen
        
        self.present(detailVC, animated: true, completion: nil)
    }
    
    //delegate
    @IBAction func moveToDelegate(_ sender: UIButton) {
        let detailVC = DelegateViewController(nibName: "DelegateViewController", bundle: nil)
        detailVC.delegate = self
        self.present(detailVC, animated: true, completion: nil)
    }
    
    @IBAction func moveToClosure(_ sender: UIButton) {
    }
    
}

extension ViewController: DelegateViewControllerDelegate {
    func passString(string: String) {
        self.mainDataLabel.text = string
    }
}

