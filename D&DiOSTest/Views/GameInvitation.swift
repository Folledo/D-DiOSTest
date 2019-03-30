//
//  GameInvitation.swift
//  D&DiOSTest
//
//  Created by Samuel Folledo on 3/26/19.
//  Copyright © 2019 Samuel Folledo. All rights reserved.
//

import UIKit

class GameInvitationView: UIView {
	
	@IBOutlet weak var opponentNameLabel: UILabel!
	@IBOutlet weak var declineButton: UIButton! //PB ep68 7mins
	@IBOutlet weak var acceptButton: UIButton! //PB ep68 7mins
	@IBOutlet weak var opponentImageView: UIImageView!
	
	
	
	
	override init(frame: CGRect) { //because we subclass the UIView, we need to override the initialization of the UIView
		super.init(frame: frame)
		
		
	}
	
	required init?(coder aDecoder: NSCoder) { //the other required method
		super.init(coder: aDecoder)
		
		
	}
	
	internal func updateView() {
		
	}
	
	
	
	
}
