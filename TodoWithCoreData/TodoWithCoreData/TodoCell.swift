//
//  TodoCell.swift
//  TodoWithCoreData
//
//  Created by seobyeonggwan on 2023/01/18.
//

import UIKit

class TodoCell: UITableViewCell {


    @IBOutlet weak var priorityView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
