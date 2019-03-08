//
//  ChatTableViewCell.swift
//  D&DiOSTest
//
//  Created by Samuel Folledo on 3/8/19.
//  Copyright © 2019 Samuel Folledo. All rights reserved.
//

import UIKit

class ChatTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

/*
import UIKit

class ChatTableViewCell: UITableViewCell {

/**
* =========================================================================================
* INSTRUCTIONS
* =========================================================================================
* 1) Setup cell to match mockup
*
* 2) Include user's avatar image
**/

// MARK: - Outlets
@IBOutlet weak var header: UILabel!
@IBOutlet weak var body: UILabel!
@IBOutlet weak var userImageView: UIImageView!

// MARK: - Lifecycle
override func awakeFromNib() {
super.awakeFromNib()
}

// MARK: - Public
func setCellData(message: Message) {
header.text = message.username
body.text = message.text
userImageView.downloaded(fromURL: message.avatarURL) //downloaded(fromURL:) UIImageView extension
}
}
*/
