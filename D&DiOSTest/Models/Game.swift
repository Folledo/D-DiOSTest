//
//  Game.swift
//  D&DiOSTest
//
//  Created by Samuel Folledo on 3/24/19.
//  Copyright © 2019 Samuel Folledo. All rights reserved.
//

import Foundation
import FirebaseAuth

class Game {
	
	
	var player1Id: String?
	var text: String?
	var player2Id: String?
	var gameId: String?
	
	static let sharedInstance = Game() //initialize this Game as singleton
	private init() {} //PB ep75 2mins this prevents reinitialization. This prevents us to invoke the ShoppingCart.init(), the access of this class is only through sharedInstance
	
	init(dictionary: [String: Any]) { //constructor
		self.player1Id = dictionary["player1Id"] as? String
		self.text = dictionary["text"] as? String
		self.player2Id = dictionary["player2Id"] as? String
		self.gameId = dictionary["gameId"] as? String
	}
	
	
	internal func gamePartnerId() -> String {
		return (player1Id == User.currentId() ? player2Id : player1Id)!
		
//		if player1Id == User.currentId() {
//			return player2Id!
//		} else {
//			return player1Id!
//		}
	}
	
	internal func reset() {
		self.player2Id = nil
		self.player1Id = nil
		self.text = nil
		self.gameId = nil
	}
	
}
