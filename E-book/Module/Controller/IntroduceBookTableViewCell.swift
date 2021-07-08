//
//  IntroduceBookTableViewCell.swift
//  E-book
//
//  Created by MIN SEONG KIM on 2021/07/09.
//

import UIKit

class IntroduceBookTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var writerLabel: UILabel!
    @IBOutlet weak var bookImage: UIImageView!
    @IBOutlet weak var introduceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        titleLabel.minimumScaleFactor = 0.5
        titleLabel.adjustsFontSizeToFitWidth = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
