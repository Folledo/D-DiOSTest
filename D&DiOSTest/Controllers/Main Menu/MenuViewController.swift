//
//  MenuViewController.swift
//  D&DiOSTest
//
//  Created by Samuel Folledo on 3/8/19.
//  Copyright © 2019 Samuel Folledo. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
