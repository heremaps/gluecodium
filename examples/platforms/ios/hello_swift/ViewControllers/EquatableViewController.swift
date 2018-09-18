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

class EquatableViewController: UIViewController {
    @IBOutlet weak var intFieldInput: UITextField!
    @IBOutlet weak var stringFieldInput: UITextField!
    @IBOutlet weak var nestedStringFieldInput: UITextField!
    @IBOutlet weak var referenceStructLabel: UIWebView!
    @IBOutlet weak var newStructLabel: UIWebView!
    @IBOutlet weak var equalsLabel: UILabel!

    private let referenceStruct = HelloWorldEquatable.EquatableStruct(
        intField: 42,
        stringField: "Foo",
        structField: HelloWorldEquatable.NestedEquatableStruct(stringField: "Bar"))

    @IBAction func didPressButton(_ sender: Any) {
        view.endEditing(true)

        let intValue = intFieldInput.text ?? ""
        let stringValue = stringFieldInput.text ?? ""
        let nestedStringValue = nestedStringFieldInput.text ?? ""

        let newStruct = HelloWorldEquatable.EquatableStruct(
            intField: Int32(intValue) ?? 0,
            stringField: stringValue,
            structField: HelloWorldEquatable.NestedEquatableStruct(stringField: nestedStringValue))
        newStructLabel.loadHTMLString(HTML.renderStruct(newStruct), baseURL: nil)
        equalsLabel.text = "equals: " + String(newStruct == referenceStruct)
        }

    override func viewDidLoad() {
        super.viewDidLoad()
        referenceStructLabel.loadHTMLString(HTML.renderStruct(referenceStruct), baseURL: nil)
    }
}
