//
//  MovieCell.swift
//  MovieList
//
//  Created by seobyeonggwan on 2023/01/16.
//

import UIKit

class MovieCell: UITableViewCell {
    
    //MARK: image
    @IBOutlet weak var movieImageView: UIImageView!
    
    //MARK: label
    @IBOutlet weak var titleLabel: UILabel! {
        didSet {
            titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        }
    }
    
    @IBOutlet weak var dateLabel: UILabel! {
        didSet {
            dateLabel.font = UIFont.systemFont(ofSize: 10, weight: .light)
        }
    }
    
    @IBOutlet weak var descriptionLabel: UILabel! {
        didSet {
            descriptionLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        }
    }
    
    @IBOutlet weak var priceLabel: UILabel! {
        didSet {
            priceLabel.font = UIFont.systemFont(ofSize: 13, weight: .medium)
        }
    }
    
    
    
}
