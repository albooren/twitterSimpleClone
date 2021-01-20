//
//  TweetTableViewCell.swift
//  bootCamp
//
//  Created by Alperen Kişi on 7.12.2020.
//

import UIKit

class TweetTableViewCell: UITableViewCell {
    @IBOutlet weak var tweetsOwnerImageView: UIImageView!
    @IBOutlet weak var tweetingArea: UILabel!
    @IBOutlet weak var titleNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
//    @IBAction func commentButtonPushed(_ sender: UIButton) {
//    }
//    @IBAction func retweetButtonPushed(_ sender: UIButton) {
//    }
//    @IBAction func favoritesButtonPushed(_ sender: Any) {
//    }
//
    
    
}
