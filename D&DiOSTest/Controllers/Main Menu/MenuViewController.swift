//
//  MenuViewController.swift
//  D&DiOSTest
//
//  Created by Samuel Folledo on 3/8/19.
//  Copyright © 2019 Samuel Folledo. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
	
	/**
	* =========================================================================================
	* INSTRUCTIONS
	* =========================================================================================
	*
	* 1) UI must work on iOS phones of multiple sizes. Do not worry about iPads.
	*
	* 2) Use Autolayout to make sure all UI works for each resolution
	*
	* 3) Use this starter project as a base and build upon it. It is ok to remove some of the
	*    provided code if necessary. It is ok to add any classes. This is your project now!
	*
	* 4) Read the additional instructions comments throughout the codebase, they will guide you.
	*
	* 5) Please take care of the bug(s) we left for you in the project as well. Happy hunting!
	*
	* Thank you and Good luck. - D & A Technologies
	* =========================================================================================
	*/
	
// MARK: - Outlets
	@IBOutlet weak var chatView: MyView!
	@IBOutlet weak var loginView: MyView!
	@IBOutlet weak var animationView: MyView!
	
	@IBOutlet weak var navItem: UINavigationItem!
	
	
// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		//title = "Coding Tasks"
		
		setupViews()
		
		
	}
	
	private func setupViews() {
		setupNav()
		
		let toChatTap = UITapGestureRecognizer(target: self, action: #selector(handleToChatTapped))
		self.chatView.isUserInteractionEnabled = true
		self.chatView.addGestureRecognizer(toChatTap)
		
		let toLoginTap = UITapGestureRecognizer(target: self, action: #selector(handleToLoginTapped))
		self.loginView.isUserInteractionEnabled = true
		self.loginView.addGestureRecognizer(toLoginTap)
		
		let toAnimationTap = UITapGestureRecognizer(target: self, action: #selector(handleToAnimationTapped))
		self.animationView.isUserInteractionEnabled = true
		self.animationView.addGestureRecognizer(toAnimationTap)
		
	}
	
	@objc func handleToChatTapped() {
		Service.toChatController(on: self)
//		let vc = ChatViewController()
//		navigationController?.pushViewController(vc, animated: true)
	}
	
	@objc func handleToLoginTapped() {
		Service.toLoginController(on: self)
//		let vc = LoginViewController()
//		navigationController?.pushViewController(vc, animated: true)
	}
	
	@objc func handleToAnimationTapped() {
		Service.toAnimationController(on: self)
		let vc = AnimationViewController()
		navigationController?.pushViewController(vc, animated: true)
	}
	
//NavigationController methods
	private func setupNav() {
		navigationController?.setNavigationBarHidden(false, animated: true)
		navigationController?.navigationBar.barTintColor = kCOLOR_0E5C89 //bar's backgroundColor
		navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: kHEADERTEXT, NSAttributedString.Key.foregroundColor: kCOLOR_FFFFFF] //turn title to white and font to systemFont with size and weight
		
		title = "Coding Tasks"
		
		
		navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style: .plain, target: nil, action: nil) //removes the title when we go to child controller
	}
	override var preferredStatusBarStyle: UIStatusBarStyle { return .lightContent }
	
	
// MARK: - Actions
	@IBAction func didPressChatButton(_ sender: Any) {
		performSegue(withIdentifier: kTOCHAT, sender: nil)
//		let chatViewController = ChatViewController()
//		navigationController?.pushViewController(chatViewController, animated: true)
	}
	
	@IBAction func didPressLoginButton(_ sender: Any) {
		performSegue(withIdentifier: kTOLOGIN, sender: nil)
//		let loginViewController = LoginViewController()
//		navigationController?.pushViewController(loginViewController, animated: true)
	}
	
	@IBAction func didPressAnimationButton(_ sender: Any) {
		performSegue(withIdentifier: kTOANIMATION, sender: nil)
//		let animationViewController = AnimationViewController()
//		navigationController?.pushViewController(animationViewController, animated: true)
	}
}



/*
import UIKit

class MenuViewController: UIViewController {

/**
* =========================================================================================
* INSTRUCTIONS
* =========================================================================================
*
* 1) UI must work on iOS phones of multiple sizes. Do not worry about iPads.
*
* 2) Use Autolayout to make sure all UI works for each resolution
*
* 3) Use this starter project as a base and build upon it. It is ok to remove some of the
*    provided code if necessary. It is ok to add any classes. This is your project now!
*
* 4) Read the additional instructions comments throughout the codebase, they will guide you.
*
* 5) Please take care of the bug(s) we left for you in the project as well. Happy hunting!
*
* Thank you and Good luck. - D & A Technologies
* =========================================================================================
*/

// MARK: - Outlets
@IBOutlet weak var chatButton: UIButton!
@IBOutlet weak var loginButton: UIButton!
@IBOutlet weak var animationButton: UIButton!

// MARK: - Lifecycle
override func viewDidLoad() {
super.viewDidLoad()
title = "Coding Tasks"
}

// MARK: - Actions
@IBAction func didPressChatButton(_ sender: Any) {
let chatViewController = ChatViewController()
navigationController?.pushViewController(chatViewController, animated: true)
}

@IBAction func didPressLoginButton(_ sender: Any) {
let loginViewController = LoginViewController()
navigationController?.pushViewController(loginViewController, animated: true)
}

@IBAction func didPressAnimationButton(_ sender: Any) {
let animationViewController = AnimationViewController()
navigationController?.pushViewController(animationViewController, animated: true)
}
}

*/
