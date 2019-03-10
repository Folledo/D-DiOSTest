//
//  AnimationViewController.swift
//  D&DiOSTest
//
//  Created by Samuel Folledo on 3/8/19.
//  Copyright © 2019 Samuel Folledo. All rights reserved.
//

import UIKit

class AnimationViewController: UIViewController {
	
	/**
	* =========================================================================================
	* INSTRUCTIONS
	* =========================================================================================
	* 1) Make the UI look like it does in the mock-up.
	*
	* 2) Logo should fade out or fade in when the user hits the Fade In or Fade Out button
	*
	* 3) User should be able to drag the logo around the screen with his/her fingers
	*
	* 4) Add a bonus to make yourself stick out. Music, color, fireworks, explosions!!! Have Swift experience? Why not write the Animation
	*    section in Swfit to show off your skills. Anything your heart desires!
	*
	**/
	
//MARK: IBOutlets
	
	@IBOutlet weak var logoImageView: UIImageView!
	
	@IBOutlet weak var fadeButton: UIButton!
	
	
//MARK: Properties
	var isVisible = true
	
	var logoOriginalCenter: CGPoint!
	var logoCenter: CGPoint!
	
// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Animation"
		
		logoOriginalCenter = logoImageView.center
		
	}
	
// MARK: - Actions
	@IBAction func fadeButtonTapped(_ sender: Any) {
		
		UIView.animate(withDuration: 1, animations: {
			self.logoImageView.alpha = self.isVisible ? 0 : 1
			
			let title: String = self.isVisible ? "FADE IN" : "FADE OUT"
			self.fadeButton.setTitle(title, for: .normal)
		}) { (success) in
			if success {
				self.isVisible = !self.isVisible
			}
		}
	}
	
	//MARK: Gestures
	@IBAction func scaleImage(_ sender: UIPinchGestureRecognizer) {
		logoImageView.transform = CGAffineTransform(scaleX: sender.scale, y: sender.scale)
	}
	@IBAction func rotateImage(_ sender: UIRotationGestureRecognizer) {
		
	}
	
	@IBAction func panImage(_ sender: UIPanGestureRecognizer) {
		let location = sender.location(in: view)
		let velocity = sender.velocity(in: view)
		let translation = sender.translation(in: view)
		
		if sender.state == .began {
			logoCenter = logoImageView.center
		} else if sender.state == .changed {
			logoImageView.center = CGPoint(x: logoCenter.x + translation.x, y: logoCenter.y + translation.y)
		} else if sender.state == .ended {
//			logoImageView.center = logoImageView.center //tried this and didnt work
		}
	}
	//03/10/2019 1:15 AM the app is basically done with simple animations and login controller not working, and chat controller that only meets expectation. That will be changed to a Firebase Login. Then with an actual working messaging app functionality. Maybe animations if I got time, I usually leave that last
	@IBAction func tapImage(_ sender: UITapGestureRecognizer) {
		switch sender.numberOfTouches {
		case 1:
			let location = sender.location(in: view)
			logoImageView.center = location
		case 2:
			logoImageView.center = logoOriginalCenter
		default:
			break
		}
		
	}
	
}


extension AnimationViewController: UIGestureRecognizerDelegate {
	func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
		return true
	}
}


/*
import UIKit

class AnimationViewController: UIViewController {

/**
* =========================================================================================
* INSTRUCTIONS
* =========================================================================================
* 1) Make the UI look like it does in the mock-up.
*
* 2) Logo should fade out or fade in when the user hits the Fade In or Fade Out button
*
* 3) User should be able to drag the logo around the screen with his/her fingers
*
* 4) Add a bonus to make yourself stick out. Music, color, fireworks, explosions!!! Have Swift experience? Why not write the Animation
*    section in Swfit to show off your skills. Anything your heart desires!
*
**/

// MARK: - Lifecycle
override func viewDidLoad() {
super.viewDidLoad()
title = "Animation"
}

// MARK: - Actions
@IBAction func backAction(_ sender: Any) {
let mainMenuViewController = MenuViewController()
self.navigationController?.pushViewController(mainMenuViewController, animated: true)
}

@IBAction func didPressFade(_ sender: Any) {
}
}

*/

