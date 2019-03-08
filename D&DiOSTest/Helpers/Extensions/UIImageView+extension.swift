//
//  UIImageView+extension.swift
//  iOSTest
//
//  Created by Samuel Folledo on 3/8/19.
//  Copyright © 2019 D&ATechnologies. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
	func downloaded(fromURL url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
		contentMode = mode
		URLSession.shared.dataTask(with: url) { data, response, error in
			guard
				let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
				let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
				let data = data, error == nil,
				let image = UIImage(data: data)
				else { return }
			DispatchQueue.main.async() {
				self.image = image
			}
			}.resume()
	}
	func downloaded(fromLink link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {  // for swift 4.2 syntax just use ===> mode: UIView.ContentMode
		guard let url = URL(string: link) else { return }
		downloaded(fromURL: url, contentMode: mode)
	}
}
