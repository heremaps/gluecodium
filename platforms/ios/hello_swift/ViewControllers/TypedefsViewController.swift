//
//  TypedefsViewController.swift
//  hello_swift
///
//  Copyright © 2017 HERE. All rights reserved.
//

import UIKit
import hello

class TypedefsViewController: UIViewController {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var textfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardAutomatically()
    }

    @IBAction func renamedStruct(_ sender: Any) {
        let typedefValue = HelloWorldTypedefs.RenamedStruct(text: textfield.text ?? "Empty value")
        resultLabel.text = HelloWorldTypedefs.methodWithTypeDef(input: typedefValue)?.text
        self.dismissKeyboard()
    }

    @IBAction func renamedTwiceStruct(_ sender: Any) {
        let typedefValue = HelloWorldTypedefs.RenamedTwiceStruct(text: textfield.text ?? "Empty value")
        resultLabel.text = HelloWorldTypedefs.methodWithTypeDef(input: typedefValue)?.text
        self.dismissKeyboard()
    }
}
