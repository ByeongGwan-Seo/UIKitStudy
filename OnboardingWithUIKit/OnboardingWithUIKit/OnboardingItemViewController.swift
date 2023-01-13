//
//  OnboardingItemViewController.swift
//  OnboardingWithUIKit
//
//  Created by seobyeonggwan on 2023/01/13.
//

import UIKit

class OnboardingItemViewController: UIViewController {

    var mainText = ""
    var subText = ""
    var topImage: UIImage? = UIImage()
    
    @IBOutlet private weak var topImageView: UIImageView!
    @IBOutlet private weak var mainTitleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        topImageView.image = topImage
        mainTitleLabel.text = mainText
        descriptionLabel.text = subText
        
    }
}
