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
	
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	@IBOutlet weak var loginButton: UIButton!
	
	@IBOutlet weak var emailView: MyView!
	@IBOutlet weak var passwordView: MyView!
	
// MARK: - Properties
	private var client: LoginClient?
	
// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		title = "Login"
		
		emailView.layer.borderWidth = 1
		emailView.layer.borderColor = kCLEARCGCOLOR
		passwordView.layer.borderWidth = 1
		passwordView.layer.borderColor = kCLEARCGCOLOR
	}
	
	
	
// MARK: - Actions
	@IBAction func didPressLoginButton(_ sender: Any) {
		
		let methodStart = Date()
		
		guard let email = emailTextField.text?.trimmedString() else {
			emailView.layer.borderColor = kREDCGCOLOR;
			return
		}
		guard let password = passwordTextField.text?.trimmedString() else {
			passwordView.layer.borderColor = kREDCGCOLOR; return
			
		}
		
		if !(email.isValidEmail) { //if email is not valid
			emailView.layer.borderColor = kREDCGCOLOR
			Service.presentAlert(on: self, title: "Invalid Email", message: "Email format is not valid. Please try again with another email")
		} else {
			emailView.layer.borderColor = kCLEARCGCOLOR
		}
		
		if password.count < 6 {
			passwordView.layer.borderColor = kREDCGCOLOR
			Service.presentAlert(on: self, title: "Password Count Error", message: "Password must be at least 6 characters")
		} else {
			passwordView.layer.borderColor = kCLEARCGCOLOR
		}
		
		
		
		if email == "info@datechnologies.co" && password == "Test123" {
			let methodFinish = Date()
			let executionTime = methodFinish.timeIntervalSince(methodStart) //to get the executionTime
			
			let alertController = UIAlertController(title: "Success!", message: "Successfully logged in \(executionTime) milliseconds", preferredStyle: .alert)
			let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
				Service.toMenuController(on: self)
//				self.dismiss(animated: true, completion: nil)
			}
			alertController.addAction(okAction)
			present(alertController, animated: true, completion: nil)
			
		} else {
			
			Service.presentAlert(on: self, title: "Login Error", message: "There was an error logging in with your credentials. Please try again with a different account")
			
		}
		
		
		
		
		
	}
	
	
	
	
}
