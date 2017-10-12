//
//  InstancesViewController.swift
//  hello_swift
///
//  Copyright © 2017 HERE. All rights reserved.
//

import UIKit
import hello

class InstancesViewController: UIViewController {

    @IBOutlet weak var profileTextView: UITextField!
    @IBOutlet weak var profileLabel: UILabel!

    var profile: ProfileManager = HelloWorldProfileManagerFactory.createProfileManagerInstance()!

    override func viewDidLoad() {
        profile.createProfile(username: "Default Profile")
        super.viewDidLoad()
        self.hideKeyboardAutomatically()
    }

    @IBAction func createNewProfile(_ sender: Any) {
        profileLabel.isHidden = false
        profileLabel.text = profile.changeProfile(username: profileTextView.text ?? "")
        self.dismissKeyboard()
    }
}
