//
//  ExpandCell.swift
//  ExpandCell
//
//  Created by seobyeonggwan on 2023/01/03.
//

import UIKit

class ExpandCell: UITableViewCell {

    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
