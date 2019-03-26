//
//  PreGameViewController.swift
//  D&DiOSTest
//
//  Created by Samuel Folledo on 3/24/19.
//  Copyright © 2019 Samuel Folledo. All rights reserved.
//

import UIKit
import FirebaseDatabase

class PreGameViewController: UIViewController {
	
//MARK: IBOutlets
	@IBOutlet weak var helloLabel: UILabel!
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var topButton: UIButton!
	@IBOutlet weak var bottomButton: UIButton!
	
	
//MARK: Properties
	var game = Game.sharedInstance
	var users = [User]()
	
	var opponentUID: String?
	var gameSessionID: String?
	
	
//MARK: Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		fetchUsers()
		
		disableButton(button: topButton)
		disableButton(button: bottomButton)
		
		incomingRequest()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		if User.currentUser() == nil {
			helloLabel.text = "Please login or register in order to play a game"
			disableButton(button: topButton)
			disableButton(button: bottomButton)
		} else {
			helloLabel.text = "Hello \(User.currentUser()!.name). Enter the email you would like to play against and click the invite button."
			enableButton(button: topButton)
		}
		
	}
	
	func disableButton(button: UIButton) {
		button.alpha = 0.2
		button.isEnabled = false
	}
	func enableButton(button: UIButton) {
		button.alpha = 1
		button.isEnabled = true
	}
	
	func playOnline(sessionId: String) {
		game.gameId = sessionId
		print("0")
//		Database.database().reference().child("playingOnline").child(sessionId).removeValue()
		print("1")
		let ref = Database.database().reference()
		ref.child("playing")
//		ref.child("playingOnline").child(sessionId).observe(.value, with: { (snapshot) in
			print("2")
			print(sessionId)
//			if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
//
//				self.player1Array.removeAll()
//				self.player2Array.removeAll()
//
//				for snap in snapshot {
//					if let playerEmail = snap.value as? String {
//						let keyCellId = snap.key
//
//						if playerEmail == self.userEmail { //if the playerEmail is current user...
//							self.activePlayer = self.playerSymbol == "X" ? 1 : 2 //if playerSymbol = "X" activePlayer is = 1, else 2 //online player 1 wins
//						} else { //the player's email is the opponents
//							self.activePlayer = self.playerSymbol == "X" ? 2 : 1
//						}
//
//						self.opponentMove(cellId: Int(keyCellId)!) //assign the snapshot.key as the keyCellId which will determine which button is selected
//
//					}
//				}
//			}
//		}, withCancel: nil)
		
		
		
	}
	
//MARK: IBActions
	@IBAction func topButtonTapped(_ sender: Any) {
		let userId = User.currentId()
		guard let opponentEmail = self.emailTextField.text?.trimmedString() else { return }
		
		if opponentEmail.isValidEmail && opponentEmail != "" {
			var opponentUid: String = ""
			for user in users { //go through each users and find email that matches our textfield
				if user.email == opponentEmail {
					opponentUid = user.userID //this givesUID us the user that matches with the email we typed
					break
				} else { continue }
			}
			if opponentUid == "" { return }
			
//start game session reference with properties/values
			let ref = firDatabase.child(kGAMESESSIONS)
			let gameReference = ref.childByAutoId()
			guard let gameId: String = gameReference.key else { return }
			let timeStamp: Int = Int(Date().timeIntervalSince1970)
			
			let values: [String: AnyObject] = [kPLAYER1 : userId, kPLAYER2: opponentUid, kTIMESTAMP: timeStamp, kGAMESESSIONS: gameId] as [String: AnyObject] //values for our game session
			print(values)
//			properties.forEach {values[$0] = $1}
			gameReference.updateChildValues(values) { (error, ref) in //update our values in our reference
				if let error = error {
					Service.presentAlert(on: self, title: "Error", message: error.localizedDescription); return
				} else {
					
					let currentUserGameRef = firDatabase.child(kUSERTOGAMESESSIONS).child(userId).child(opponentUid)
					
					currentUserGameRef.updateChildValues([gameId: 1], withCompletionBlock: { (error, ref) in
						if let error = error {
							Service.presentAlert(on: self, title: "Firebase Error", message: error.localizedDescription); return
						} else {
							
							let opponentUserGameRef = firDatabase.child(kUSERTOGAMESESSIONS).child(opponentUid).child(userId)
							opponentUserGameRef.updateChildValues([gameId: 1], withCompletionBlock: { (error, ref) in
								if let error = error  {
									Service.presentAlert(on: self, title: "Error", message: error.localizedDescription); return
								} else {
									print("Creating opponent user's game reference was successful")
									
								}
							})
						}
					})
				}
			}
		} else { //no text on textfield
			Service.presentAlert(on: self, title: "Email Not Found", message: "Please try again")
		}
	}
	
	func incomingRequest() {
		let requestReference = firDatabase.child(kUSERTOGAMESESSIONS).child(User.currentId()) //MISSING OPPONENT'S UID before we can access the game session id
		requestReference.observe(.value, with: { (snapshot) in
			
			guard let snapshot = snapshot.children.allObjects as? [DataSnapshot] else { print("No requests found"); return }
			for snap in snapshot { //each snap in snapshot is a dictionary //snap.key is the opponentUID and snap.value is the gameSessionId : 1
				guard let playerRequesting = snap.value as? [String: AnyObject] else { print("snap.value cannot be found"); return } //snap.value = gameSessionId : 1 //has to be converted to [String: AnyObject] in order to get the snap.value properly 
				print("\n\n\nKeys are\(playerRequesting.keys)\nValues are\(playerRequesting.values)\n\n\n")
				
				
//				self.emailTextField.text = playerRequesting
			}
			
		}, withCancel: nil)
	}
	
	func fetchUsers() {
		let ref = firDatabase.child(kUSERS)
		ref.observe(.childAdded, with: { (snapshot) in
//			print("user found")
			guard let userDic = snapshot.value as? [String: String] else { return }
			let user = User(_dictionary: userDic)
			user.name = userDic[kNAME]!
			user.email = userDic[kEMAIL]!
			user.userID = snapshot.key
			
			self.users.append(user)
		}, withCancel: nil)
	}
	
	@IBAction func bottomButtonTapped(_ sender: Any) {
		
	}
	
}
