//
//  GameViewController.swift
//  D&DiOSTest
//
//  Created by Samuel Folledo on 3/24/19.
//  Copyright © 2019 Samuel Folledo. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
	
//MARK: IBOutlets
	@IBOutlet weak var userNameLabel: UILabel!
	@IBOutlet weak var opponentNameLabel: UILabel!
	@IBOutlet weak var gameSessionLabel: UILabel!
	
	
//MARK: Properties
	var game: Game?
	
	
//MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		updateViewWithGame()
    }
	
	private func updateViewWithGame() {
		guard let currentGame = game, let currentUserUid = User.currentUser()?.userID else { return }
		gameSessionLabel.text = currentGame.gameId
		if game!.player1Id == currentUserUid {
			opponentNameLabel.text = "\(currentGame.player2Name!)"
			userNameLabel.text = "\(currentGame.player1Name!)"
		} else {
			opponentNameLabel.text = "\(currentGame.player1Name!)"
			userNameLabel.text = "\(currentGame.player2Name!)"
		}
		
	}
	
	
    
//MARK: IBActions
    
	
}
