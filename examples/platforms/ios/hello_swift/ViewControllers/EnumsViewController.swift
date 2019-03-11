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

extension HelloWorldEnums.InternalError {
    public var description: String {
        if self == HelloWorldEnums.InternalError.errorNone {
            return "errorNone"
        } else {
            return "errorFatal"
        }
    }
}

class EnumsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    lazy var dataSource = [(HelloWorldEnums.InternalError.errorFatal, 0), (HelloWorldEnums.InternalError.errorNone, 1)]
    var indexSelected = 0

    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var resultField: UITextField!

    override func viewDidLoad() {
        picker.dataSource = self
        picker.delegate = self
        super.viewDidLoad()
    }
    @IBAction func didPress(_ sender: Any) {
        let enumVal = dataSource[indexSelected]
        resultField.text = HelloWorldEnums.methodWithEnumeration(input: enumVal.0).description
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
        indexSelected = row
        return dataSource[row].0.description
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        resultField.text = ""
    }
}
