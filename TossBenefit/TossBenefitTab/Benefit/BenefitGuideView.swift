//
//  BenefitGuideView.swift
//  TossBenefitTab
//
//  Created by seobyeonggwan on 2022/12/20.
//

import UIKit

final class BenefitGuideView: UIView {
    
    lazy var icon: UIImageView = {
       let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var title: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        addSubview(icon)
        addSubview(title)
        
        NSLayoutConstraint.activate([
            icon.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            icon.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            icon.widthAnchor.constraint(equalToConstant: 30),
            icon.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        NSLayoutConstraint.activate([
            title.leadingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 20),
            title.centerYAnchor.constraint(equalTo: icon.centerYAnchor)
        ])
    }
}
