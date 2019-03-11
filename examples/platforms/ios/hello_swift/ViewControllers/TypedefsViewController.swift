// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2018 HERE Europe B.V.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// SPDX-License-Identifier: Apache-2.0
// License-Filename: LICENSE
//
// -------------------------------------------------------------------------------------------------

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
