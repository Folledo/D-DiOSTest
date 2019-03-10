//
//  String+extension.swift
//  D&DiOSTest
//
//  Created by Samuel Folledo on 3/9/19.
//  Copyright © 2019 Samuel Folledo. All rights reserved.
//

import UIKit

extension String {
	
	var isValidEmail: Bool {
		let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
		let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailFormat)
		return emailPredicate.evaluate(with: self)
	}
	
	
	func trimmedString() -> String { //method that removes string's left and right white spaces and new lines
		let newWord: String = self.trimmingCharacters(in: .whitespacesAndNewlines)
		print(newWord)
		return newWord
	}
}
