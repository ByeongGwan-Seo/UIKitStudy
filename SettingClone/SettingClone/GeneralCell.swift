//
//  GeneralCell.swift
//  SettingClone
//
//  Created by seobyeonggwan on 2023/01/12.
//

import UIKit

class GeneralCell: UITableViewCell {

    @IBOutlet weak var generalTitle: UILabel!
    @IBOutlet weak var rightImageView: UIImageView! {
        didSet {
            rightImageView.image = UIImage(systemName: "chevron.right")
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
