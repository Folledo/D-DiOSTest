//
//  LoginViewController.swift
//  D&DiOSTest
//
//  Created by Samuel Folledo on 3/8/19.
//  Copyright © 2019 Samuel Folledo. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
	
	/**
	* =========================================================================================
	* INSTRUCTIONS
	* =========================================================================================
	* 1) Make the UI look like it does in the mock-up.
	*
	* 2) Take username and password input from the user using UITextFields
	*
	* 3) Using the following endpoint, make a request to login
	*    URL: http://dev.datechnologies.co/Tests/scripts/login.php
	*    Parameter One: email
	*    Parameter Two: password
	*
	* 4) A valid email is 'info@datechnologies.co'
	*    A valid password is 'Test123'
	*
	* 5) Calculate how long the API call took in milliseconds
	*
	* 6) If the response is an error display the error in a UIAlertView
	*
	* 7) If the response is successful display the success message AND how long the API call took in milliseconds in a UIAlertView
	*
	* 8) When login is successful, tapping 'OK' in the UIAlertView should bring you back to the main menu.
	**/
	
//MARK: IBOutlets
	
	@IBOutlet weak var usernameTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var loginButton: UIButton!
	
	
// MARK: - Properties
	private var client: LoginClient?
	
// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Login"
		
		loginButton.backgroundColor = kCOLOR_0E5C89 //blue button
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
// MARK: - Actions
	@IBAction func didPressLoginButton(_ sender: Any) {
	}
}

/*
import UIKit

class LoginViewController: UIViewController {

/**
* =========================================================================================
* INSTRUCTIONS
* =========================================================================================
* 1) Make the UI look like it does in the mock-up.
*
* 2) Take username and password input from the user using UITextFields
*
* 3) Using the following endpoint, make a request to login
*    URL: http://dev.datechnologies.co/Tests/scripts/login.php
*    Parameter One: email
*    Parameter Two: password
*
* 4) A valid email is 'info@datechnologies.co'
*    A valid password is 'Test123'
*
* 5) Calculate how long the API call took in milliseconds
*
* 6) If the response is an error display the error in a UIAlertView
*
* 7) If the response is successful display the success message AND how long the API call took in milliseconds in a UIAlertView
*
* 8) When login is successful, tapping 'OK' in the UIAlertView should bring you back to the main menu.
**/

// MARK: - Properties
private var client: LoginClient?

// MARK: - Lifecycle
override func viewDidLoad() {
super.viewDidLoad()
title = "Login"
}

override func didReceiveMemoryWarning() {
super.didReceiveMemoryWarning()
// Dispose of any resources that can be recreated.
}

// MARK: - Actions
@IBAction func backAction(_ sender: Any) {
let mainMenuViewController = MenuViewController()
self.navigationController?.pushViewController(mainMenuViewController, animated: true)
}

@IBAction func didPressLoginButton(_ sender: Any) {
}
}

*/
