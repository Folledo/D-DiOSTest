//
//  MatchesTableViewCell.swift
//  D&DiOSTest
//
//  Created by Samuel Folledo on 3/26/19.
//  Copyright © 2019 Samuel Folledo. All rights reserved.
//

import UIKit

class MatchesTableViewCell: UITableViewCell {
	
//MARK: IBOutlets
	@IBOutlet weak var opponentImageView: UIImageView!
	@IBOutlet weak var opponentNameLabel: UILabel!
	@IBOutlet weak var acceptButton: UIButton!
	@IBOutlet weak var declineButton: UIButton!
	@IBOutlet weak var resultButton: UIButton!
	
//MARK: Properties
	var delegate: MatchesTableViewCellDelegate!
	var gameUid: String!
	var match: Game?
	
//MARK: LifeCycle
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	
//MARK: Public
	func setCellData(game: Game) {
		gameUid = game.gameId
		self.match = game
		
		opponentImageView.layer.cornerRadius = 25 //half of the imageView to make it round
		opponentImageView.layer.masksToBounds = true
		
		if game.player1Id == User.currentId() { //then dont put player1Id as the opponentName
			opponentNameLabel.text = game.player2Name
			opponentImageView.downloaded(fromLink: game.player2AvatarUrl!)
			self.declineButton.setTitle("Cancel", for: .normal)
		} else {
			opponentNameLabel.text = game.player1Name
			opponentImageView.downloaded(fromLink: game.player1AvatarUrl!)
		}
		
//		let opponentUID: String = game.gamePartnerId()
		
//		opponentNameLabel.text = User.currentId() == game.player1Id ? game.player1Id
		
		
//		header.text = message.fullName
//		body.text = message.text
//
//		avatarImageView.layer.cornerRadius = 25 //half of the imageView to make it round
//		avatarImageView.layer.masksToBounds = true
//		avatarImageView.downloaded(fromURL: message.avatarURL)
//
//		if isUserLoggedIn() {
//			if message.userID == User.currentId() {
//				bubbleView.backgroundColor = kCOLOR_0E5C89
//				body.textColor = .white
//
//			} else {
//				bubbleView.backgroundColor = .white
//				body.textColor = kCOLOR_1B1E1F
//			}
//		} else {
//			bubbleView.backgroundColor = .white
//			body.textColor = kCOLOR_1B1E1F
//		}
	}
	
	@IBAction func acceptButtonTapped(_ sender: Any) {
		if self.delegate != nil {
			self.delegate.segueWithGameUid(withGame: match!)
		}
	}
	@IBAction func declineButtonTapped(_ sender: Any) {
		print("Decline \(gameUid!)")
//		if self.delegate != nil {
//			self.delegate.segueWithGameUid(gameSession: gameUid!)
//		}
	}
	
}
