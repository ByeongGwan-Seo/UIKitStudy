//
//  MyPointViewController.swift
//  TossBenefitTab
//
//  Created by seobyeonggwan on 2022/12/20.
//

import UIKit
import Combine

class MyPointViewController: UIViewController {

    @IBOutlet weak var pointLabel: UILabel!
    
    var viewModel: MyPointViewModel!
    var supscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind()
    }
    
    private func setupUI() {
        navigationItem.largeTitleDisplayMode = .never
    }
    
    private func bind() {
        viewModel.$point
            .receive(on: RunLoop.main)
            .sink { point in
                self.pointLabel.text = "\(point.point) 원"
            }
    }
}
