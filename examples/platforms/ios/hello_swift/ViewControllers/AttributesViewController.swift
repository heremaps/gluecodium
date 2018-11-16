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

class AttributesViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    enum FunctionToExecute: String {
        case getBuiltInAttribute = "get builtInAttribute"
        case setBuiltInAttribute = "set builtInAttribute"
        case getReadonlyAttribute = "get readonlyAttribute"
        case getStructAttribute = "get structAttribute"
        case setStructAttribute = "set structAttribute"
    }

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var result: UIWebView!
    @IBOutlet weak var protocolDescription: UIWebView!
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var execute: UIButton!
    @IBOutlet weak var textFieldHeight: NSLayoutConstraint!

    var dataSource = [
        (FunctionToExecute.getBuiltInAttribute, false, UIKeyboardType.default),
        (FunctionToExecute.setBuiltInAttribute, true, UIKeyboardType.numberPad),
        (FunctionToExecute.getReadonlyAttribute, false, UIKeyboardType.default),
        (FunctionToExecute.getStructAttribute, false, UIKeyboardType.default),
        (FunctionToExecute.setStructAttribute, true, UIKeyboardType.decimalPad)
    ]
    var indexSelected = 0
    var inputFieldInitialHeight: CGFloat = 0
    var testClass: HelloWorldAttributes = HelloWorldFactory.createAttributes()!

    override func viewDidLoad() {
        inputFieldInitialHeight = textFieldHeight.constant
        picker.dataSource = self
        picker.delegate = self
        protocolDescription.loadHTMLString(AttributesLabels.protocolHTML, baseURL: nil)
        pickerView(picker, didSelectRow: 0, inComponent: 0)
        hideKeyboardAutomatically()
        super.viewDidLoad()
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }

    public func pickerView(_ pickerView: UIPickerView,
                           titleForRow row: Int,
                           forComponent component: Int) -> String? {
        return dataSource[row].0.rawValue
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        indexSelected = row
        resetControlsAfterSelection(dataSource[row].1)
    }

    @IBAction func execute(_ sender: Any) {
        let currentAction = dataSource[indexSelected].0
        switch currentAction {
        case .getBuiltInAttribute:
            let readValue = testClass.builtInTypeAttribute
            result.loadHTMLString(String(format: AttributesLabels.getBuiltInAttrHTML, readValue), baseURL: nil)
        case .setBuiltInAttribute:
            let newValue = UInt32(input.text!)!
            testClass.builtInTypeAttribute = newValue
            result.loadHTMLString(String(format: AttributesLabels.setBuiltInAttrHTML, newValue), baseURL: nil)
        case .getReadonlyAttribute:
            let readValue = testClass.readonlyAttribute
            result.loadHTMLString(String(format: AttributesLabels.getReadonlyAttributeHTML, readValue), baseURL: nil)
        case .getStructAttribute:
            let readValue = testClass.structAttribute
            result.loadHTMLString(
                String(format: AttributesLabels.getStructAttrHTML, HTML.renderStruct(readValue)), baseURL: nil)
        case .setStructAttribute:
            let newValue = Double(input.text!)!
            testClass.structAttribute = HelloWorldAttributes.ExampleStruct(value: newValue, intValue: [])
            result.loadHTMLString(String(format: AttributesLabels.setStructAttrHTML, newValue), baseURL: nil)
        }
    }

    @IBAction func inputHasChanged(_ sender: Any) {
        execute.isEnabled = !isInputNeeded() || (isInputProvided() && isInputCorrect())
        execute.alpha = execute.isEnabled ? 1.0 : 0.3
    }

    @IBAction func startedEditing(_ sender: Any) {
        cleanResult()
    }

    func resetControlsAfterSelection(_ visible: Bool) {
        let val: CGFloat = (visible) ? inputFieldInitialHeight : 0
        textFieldHeight.constant = val
        UIView.animate(withDuration: 0.1) {
            self.view.layoutIfNeeded()
        }
        input.keyboardType = dataSource[indexSelected].2
        input.text = ""
        inputHasChanged(self)
        cleanResult()
    }

    func isInputNeeded() -> Bool {
        return dataSource[indexSelected].1
    }

    func isInputProvided() -> Bool {
        return !input.text!.isEmpty
    }

    func isInputCorrect() -> Bool {
        let currentAction = dataSource[indexSelected].0
        switch currentAction {
        case .setBuiltInAttribute:
            if let text = input.text, UInt32(text) != nil {
                return true
            } else {
                return false
            }
        case .setStructAttribute:
            if let text = input.text, Double(text) != nil {
                return true
            } else {
                return false
            }
        default:
            return true
        }
    }

    func cleanResult() {
        result.loadHTMLString("", baseURL: nil)
    }
}
