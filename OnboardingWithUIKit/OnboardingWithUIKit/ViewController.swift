//
//  ViewController.swift
//  OnboardingWithUIKit
//
//  Created by seobyeonggwan on 2023/01/13.
//

import UIKit

class ViewController: UIViewController {

    var didShowOnboardingView = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if didShowOnboardingView == false {
            didShowOnboardingView = true
            let pageVC = OnboardingPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: .none)
            
            pageVC.modalPresentationStyle = .fullScreen
            self.present(pageVC, animated: true, completion: nil)
        }
    }
}

