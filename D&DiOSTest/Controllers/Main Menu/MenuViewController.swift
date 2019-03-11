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
	@IBOutlet weak var loginView: UIView!
	@IBOutlet weak var animationView: MyView!
	
	
//MARK: Properties
	var timer = Timer()
	
	
	
// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupViews()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		checkCurrentUser()
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		timer.invalidate() //stop timer
	}
	
	
//MARK: Private Methods
	private func setupViews() {
		setupNav()
		
		loginView.backgroundColor = .clear
		loginView.layer.cornerRadius = 8
		loginView.clipsToBounds = true
		loginView.layer.borderWidth = 2
		
	}
	
	private func checkCurrentUser() {
		self.loginView.layer.borderColor = isUserLoggedIn() ? kGREENCGCOLOR : kREDCGCOLOR
		
		timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(animateLoginView), userInfo: nil, repeats: true)
		
	}
	
//MARK: Helpers
	@objc func animateLoginView() {
		if loginView.layer.borderWidth == 2 {
			UIView.animate(withDuration: 1) {
				self.loginView.layer.borderWidth = 0
			}
		} else {
			UIView.animate(withDuration: 1) {
				self.loginView.layer.borderWidth = 2
			}
		}
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
