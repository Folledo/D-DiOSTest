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
let kUSER: String = "user" //fore firebase
let kMESSAGE: String = "message"

let kGAMESESSION: String = "gameSession"
let kUSERTOGAME: String = "user-game"
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
