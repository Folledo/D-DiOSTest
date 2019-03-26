//
//  Constants.swift
//  D&DiOSTest
//
//  Created by Samuel Folledo on 3/8/19.
//  Copyright © 2019 Samuel Folledo. All rights reserved.
//

import Foundation
import UIKit
import FirebaseDatabase

let kUSERID: String = "userID"
let kNAME: String = "name"
let kEMAIL: String = "email"
let kAVATARURL: String = "avatarURL"
let kTEXT: String = "text"
let kCURRENTUSER: String = "currentUser" //for userDefaults
let kUSERS: String = "user" //fore firebase
let kMESSAGES: String = "message"

let kGAMESESSIONS: String = "gameSessions"
let kUSERTOGAMESESSIONS: String = "user-gameSessions"
let kPLAYER1: String = "player1"
let kPLAYER2: String = "player2"
let kTIMESTAMP: String = "timeStamp"


let kSMILEYURL: String = "https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Smiley.svg/220px-Smiley.svg.png"
let firDatabase = Database.database().reference()


//colors
let kCOLOR_FFFFFF: UIColor = UIColor(rgb: 0xFFFFFF)
let kCOLOR_1B1E1F: UIColor = UIColor(rgb: 0x1B1E1F)
let kCOLOR_5F6063: UIColor = UIColor(rgb: 0x5F6063)
let kCOLOR_0E5C89: UIColor = UIColor(rgb: 0x0E5C89)
let kCOLOR_F9F9F9: UIColor = UIColor(rgb: 0xF9F9F9)

let kREDCGCOLOR = UIColor.red.cgColor
let kCLEARCGCOLOR = UIColor.clear.cgColor
let kGREENCGCOLOR = UIColor.green.cgColor


//fonts
let kHEADERTEXT: UIFont = UIFont.systemFont(ofSize: 17, weight: .semibold)


//controller storyboard id
let kCHATCONTROLLER: String = "chatController"
let kLOGINCONTROLLER: String = "loginController"
let kANIMATIONCONTROLLER: String = "animationController"
let kMENUCONTROLLER: String = "menuController"

//func handleInvite() {
//	guard let opponentEmail = self.emailTextField.text?.trimmedString() else { return }
//	let properties: [String: AnyObject] = [kPLAYER2: opponentEmail] as [String: AnyObject]
//	sendInviteWithProperties(properties: properties)
//}
//
//func sendInviteWithProperties(properties: [String: AnyObject]) {
//	guard let userEmail = User.currentUser()?.email.trimmedString() else { return }
//	let userId = User.currentId()
//	let timeStamp: Int = Int(Date().timeIntervalSince1970)
//	var values: [String: AnyObject] = [kPLAYER1: userEmail, kTIMESTAMP: timeStamp] as [String: AnyObject]
//	properties.forEach{ values[$0] = $1 }
//	
//	let ref = firDatabase.child(kGAMESESSIONS)
//	let gameReference = ref.childByAutoId()
//	
//	guard let opponentEmail = emailTextField.text?.trimmedString() else { return }
//	if opponentEmail.isValidEmail && opponentEmail != "" {
//		var opponentUid: String = ""
//		for user in users { //go through each users and find email that matches our textfield
//			if user.email == opponentEmail {
//				opponentUid = user.email //this gives us the user that matches with the email we typed
//				break
//			} else { continue }
//		}
//		if opponentUid == "" { return }
//		
//		gameReference.updateChildValues(values) { (error, ref) in //update our values in our reference
//			if let error = error {
//				Service.presentAlert(on: self, title: "Error", message: error.localizedDescription); return
//			} else {
//				print("2")
//				
//				
//				let currentUserGameRef = firDatabase.child(kUSERTOGAMESESSIONS).child(userId).child(opponentUid)
//				print("3")
//				guard let gameId: String = gameReference.key else { return }
//				currentUserGameRef.updateChildValues([gameId: 1], withCompletionBlock: { (error, ref) in
//					print("4")
//					if let error = error {
//						Service.presentAlert(on: self, title: "Firebase Error", message: error.localizedDescription); return
//					} else {
//						
//						let opponentUserGameRef = firDatabase.child(kUSERTOGAMESESSIONS).child(opponentUid).child(userId)
//						print("6")
//						opponentUserGameRef.updateChildValues([gameId: 1], withCompletionBlock: { (error, ref) in
//							if let error = error  {
//								Service.presentAlert(on: self, title: "Error", message: error.localizedDescription); return
//							} else {
//								print("Creating opponent user's game reference was successful")
//								
//							}
//						})
//					}
//				})
//				
//			}
//		}
//		//			print("3")
//		//			let currentUserGameRef = firDatabase.child(kUSERTOGAMESESSIONS).child(userId).child(opponentUid)
//		//			print("4")
//		//			//					currentUserGameRef.updateChildValues([gameId: 1])
//		//			currentUserGameRef.updateChildValues([gameId: 1], withCompletionBlock: { (error, ref) in
//		//				if let error = error  {
//		//					Service.presentAlert(on: self, title: "Error", message: error.localizedDescription); return
//		//				} else {
//		//					print("Creating current user's game reference was successful")
//		//
//		//				}
//		//
//		//			})
//		//
//		//			print("5")
//		//			let opponentUserGameRef = firDatabase.child(kUSERTOGAMESESSIONS).child(opponentUid).child(userId)
//		//			print("6")
//		//			opponentUserGameRef.updateChildValues([gameId: 1], withCompletionBlock: { (error, ref) in
//		//				if let error = error  {
//		//					Service.presentAlert(on: self, title: "Error", message: error.localizedDescription); return
//		//				} else { print("Creating opponent user's game reference was successful") }
//		//
//		//			})
//		//			print("7")
//		//			print("Game Session created successfuly!")
//		
//		
//		//			let childRef = firDatabase.child(kUSERTOGAMESESSIONS).child(opponentUid).child(User.currentId())
//		
//		//			childRef.setValue(userEmail) //same as registering, but with autoId after "request" so new value for the child will not override previous child
//		//			let values: [String: String] = [kPLAYER1 : userEmail, kPLAYER2: opponentEmail, kGAMESESSIONS: childRef.key!]
//		//			childRef.setValue(values) { (error, ref) in
//		//				if let error = error {
//		//					Service.presentAlert(on: self, title: "Error Setting Value", message: error.localizedDescription)
//		//					return
//		//				}
//		////			playerSymbol = "X"
//		//
//		//
//		////				let sessionId:String = "\(userEmail)-\(opponentEmail)" //upon requesting, sessionId is the current user's email and the opponent's email
//		////				self.playOnline(sessionId: sessionId)
//		//
//		//
//		//			}
//		//	} else { //no text on textfield
//		//	Service.presentAlert(on: self, title: "Email Not Found", message: "Please try again")
//		//	}
//	}
//	
//}
