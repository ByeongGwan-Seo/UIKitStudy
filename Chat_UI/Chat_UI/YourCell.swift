//
//  YourCell.swift
//  Chat_UI
//
//  Created by seobyeonggwan on 2023/01/09.
//

import UIKit

class YourCell: UITableViewCell {

    @IBOutlet weak var yourTextCell: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
