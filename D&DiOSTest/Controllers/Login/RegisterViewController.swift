//
//  RegisterViewController.swift
//  D&DiOSTest
//
//  Created by Samuel Folledo on 3/10/19.
//  Copyright © 2019 Samuel Folledo. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase
import FirebaseStorage

class RegisterViewController: UIViewController {
	
//MARK: IBOutlets
	@IBOutlet weak var emailTextField: UITextField!
	@IBOutlet weak var nameTextField: UITextField!
	@IBOutlet weak var passwordTextField: UITextField!
	
	@IBOutlet weak var emailView: MyView!
	@IBOutlet weak var nameView: MyView!
	@IBOutlet weak var passwordView: MyView!
	
	@IBOutlet weak var avatarImageView: UIImageView!
	@IBOutlet weak var avatarLabel: UILabel!
	
	
//MARK: Properties
	var allTextFields: [UITextField] = []
	var timer = Timer()
	
//MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
		
		setupViews()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.animateAvatarLabel), userInfo: nil, repeats: true)
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		timer.invalidate()
	}
	
//MARK: Private Methods
	private func register() {
		
		var errorCounter = 0
		let methodStart = Date()
		
		guard let email = emailTextField.text?.trimmedString() else {
			emailView.layer.borderColor = kREDCGCOLOR; return
		}
		guard let password = passwordTextField.text?.trimmedString() else {
			passwordView.layer.borderColor = kREDCGCOLOR; return
		}
		
		guard let name = nameTextField.text?.trimmedString() else {
			nameView.layer.borderColor = kREDCGCOLOR; return
		}
		
		if !(email.isValidEmail) { //if email is not valid
			self.emailView.layer.borderColor = kREDCGCOLOR
			errorCounter += 1
			Service.presentAlert(on: self, title: "Invalid Email Format", message: "Email format is not valid. Please try again with correct or another email")
		} else {
			self.emailView.layer.borderColor = kCLEARCGCOLOR
		}
		
		if !(name.isValidName) {
			self.nameView.layer.borderColor = kREDCGCOLOR
			errorCounter += 1
			Service.presentAlert(on: self, title: "Invalid Name Format", message: "Name must only be US letters (ex. Samuel, Samuel Folledo, Samuel P Folledo, or Samuel P. Folledo)")
		} else {
			self.nameView.layer.borderColor = kCLEARCGCOLOR
		}
		
		if password.count < 6 {
			errorCounter += 1
			self.passwordView.layer.borderColor = kREDCGCOLOR
			Service.presentAlert(on: self, title: "Password Count Error", message: "Password must be at least 6 characters")
		} else {
			self.passwordView.layer.borderColor = kCLEARCGCOLOR
		}
		
		print("there are \(errorCounter) errors")
		
		switch errorCounter {
		case 0: //if 0 errorCounter... Register
			
			User.registerUserWith(email: email, password: password) { (error) in
				if let error = error {
					Service.presentAlert(on: self, title: "Register Error", message: error.localizedDescription)
				} else { //if no error registering user...
					
					let imageName = NSUUID().uuidString
					let imageReference = Storage.storage().reference().child("avatar_images").child("0000\(imageName).png")
					
					if let avatarImage = self.avatarImageView.image, let uploadData = avatarImage.jpegData(compressionQuality: 0.5) { //compress the image to be uploaded
						imageReference.putData(uploadData, metadata: nil, completion: { (metadata, error) in //putData = Asynchronously uploads data to the reference
							if let error = error {
								Service.presentAlert(on: self, title: "Error Putting Image", message: error.localizedDescription)
								return
							} else { //if no error
								imageReference.downloadURL(completion: { (imageUrl, error) in
									if let error = error {
										Service.presentAlert(on: self, title: "Error Downloading Image", message: error.localizedDescription)
									} else { //no error on downloading metadata URL
										
										let uid = User.currentId()
										guard let url = imageUrl?.absoluteString else { return }
										let values = [kNAME: name, kEMAIL: email, kAVATARURL: url, kUSERID: uid] //pass the url
										
										self.registerUserIntoDatabaseWithUID(uid: uid, values: values as [String : AnyObject])
										
										//finished registering!
										DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
											let methodFinish = Date()
											let executionTime = methodFinish.timeIntervalSince(methodStart) //to get the executionTime
											
											let okAction = UIAlertAction(title: "OK", style: .default) { (action) in
												self.navigationController?.popToRootViewController(animated: true)
											}
											Service.alertWithActions(on: self, actions: [okAction], title: "Success!", message: "Successfully logged in \(executionTime) milliseconds")
											
										})
									}
								})
							}
						})
					}
				}
			}
			
		default:
			Service.presentAlert(on: self, title: "Error", message: "There are errors on the field. Please try again.")
		}
	}
	
	
	
	private func registerUserIntoDatabaseWithUID(uid: String, values: [String: Any] ) {
		
		let ref = Database.database().reference()
		let usersReference = ref.child(kUSERS).child(uid)
		usersReference.setValue(values, withCompletionBlock: { (error, ref) in
			if let error = error {
				Service.presentAlert(on: self, title: "Register Error", message: error.localizedDescription)
				return
			}
			DispatchQueue.main.async {
				let user = User(_dictionary: values)
				saveUserLocally(user: user)
				saveUserInBackground(user: user)
			}
		})
	}
	
	@objc func animateAvatarLabel() {
		switch avatarLabel.alpha {
		case 1:
			UIView.animate(withDuration: 0.8) {
				self.avatarLabel.alpha = 0
			}
		default:
			UIView.animate(withDuration: 0.5) {
				self.avatarLabel.alpha = 1
			}
		}
	}
	
	private func setupViews() {
		title = "Register"
		let tap = UITapGestureRecognizer(target: self, action: #selector(handleDismissTap(_:)))
		self.view.addGestureRecognizer(tap)
		
		emailTextField.delegate = self
		passwordTextField.delegate = self
		nameTextField.delegate = self
		passwordTextField.returnKeyType = .join
		
		let imageTap = UITapGestureRecognizer(target: self, action: #selector(RegisterViewController.handleUserAvatar))
		avatarImageView.isUserInteractionEnabled = true
		avatarImageView.addGestureRecognizer(imageTap)
		
		avatarImageView.layer.cornerRadius = 25 //half of the imageView to make it round
		avatarImageView.layer.masksToBounds = true
		
		allTextFields = [emailTextField, nameTextField, passwordTextField]
	}
	
	
//MARK: Helpers
	@objc func handleDismissTap(_ gesture: UITapGestureRecognizer) {
		self.view.endEditing(false)
	}
	
	
//MARK: IBActions
	@IBAction func registerButtonTapped(_ sender: Any) {
		register()
		
	}
	@IBAction func loginButtonTapped(_ sender: Any) {
		navigationController?.popViewController(animated: true)
	}
	
}


//--------------- UITextFieldDelegate ---------------
extension RegisterViewController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		switch textField {
		case emailTextField:
			nameTextField.becomeFirstResponder()
		case nameTextField:
			passwordTextField.becomeFirstResponder()
		case passwordTextField:
			register() //register
		default:
			textField.resignFirstResponder()
		}
		return true
	}
}

//----------- UIImagePickerController Delegate ------------
extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
	
	@objc func handleUserAvatar() {
		let picker = UIImagePickerController()
		picker.delegate = self
		picker.allowsEditing = true //will allow us to edit image
		picker.sourceType = .photoLibrary
		present(picker, animated: true, completion: nil)
	}
	
//delegate method that will get the image to our app
	func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
		
		var selectedImageFromPicker: UIImage?
		if let editedImage = info[.editedImage] as? UIImage {
			selectedImageFromPicker = editedImage
		} else if let originalImage = info[.originalImage] as? UIImage {
			selectedImageFromPicker = originalImage
		}
		
		if let myCourtProfilePictureImage = selectedImageFromPicker { //if image is successfully unwrapped...
			print("putting image to login logo")
			avatarImageView.image = myCourtProfilePictureImage
		}
		
		dismiss(animated: true, completion: nil)
	}
//imagePickerController DID CANCEL
	func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
		dismiss(animated: true, completion: nil)
	}
}
