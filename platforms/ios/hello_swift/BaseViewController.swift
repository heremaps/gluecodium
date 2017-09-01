//
//  BaseViewController
//  hello_swift
//
//  Copyright © 2017 HERE. All rights reserved.
//

import UIKit
import hello

class BaseViewController: UIViewController {
    @IBOutlet var textInput: UITextField!
    @IBOutlet var textLabel: UILabel!

    @IBAction func didPressButton(_ sender: Any) {
        textInput.resignFirstResponder()
        if let text = textInput.text {
            textLabel.text = HelloWorld.helloWorldMethod(inputString: text)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
