// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2019 HERE Europe B.V.
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

class MapsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    var inputMap: HelloWorldMaps.ErrorCodeToMessageMap = [:]
    var resultMap: HelloWorldMaps.ErrorCodeToMessageMap = [:]
    @IBOutlet weak var inputMapView: UITableView!
    @IBOutlet weak var resultMapView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        inputMapView.isEditing = true
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return isInputMapView(tableView) ? inputMap.count + 1 : resultMap.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isInputMapView(tableView) {
            return createCellForInputMapView(tableView, indexPath)
        } else {
            return createCellForOutputMapView(tableView, indexPath)
        }
    }

    func createCellForInputMapView(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "EditableCell", for: indexPath)
                    as? MapsTableViewCell {
                cell.keyTextField.text = ""
                cell.valueTextField.text = ""
                return cell
            }
        } else {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MapsTableViewCell {
                return fillCellWithValues(cell, index: indexPath.row - 1, map: inputMap )
            }
        }
        fatalError("Wrong cell type")
    }

    func createCellForOutputMapView(_ tableView: UITableView, _ indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? MapsTableViewCell {
            return fillCellWithValues(cell, index: indexPath.row, map: resultMap )
        }
        fatalError("Wrong cell type")
    }

    func fillCellWithValues(_ cell: MapsTableViewCell, index: Int,
                            map: HelloWorldMaps.ErrorCodeToMessageMap) -> UITableViewCell {
        let asArray = Array(map)
        cell.keyTextField.text = String(asArray[index].key)
        cell.valueTextField.text = asArray[index].value
        return cell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return isInputMapView(tableView)
            ? "Input dictionary of type [Int32:String]"
            : "Resulting dictionary from cpp layer"
    }

    func tableView(_ tableView: UITableView,
                   editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        if isInputMapView(tableView) {
            return (indexPath.row == 0) ? .insert : .delete
        } else {
            return .none
        }
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let keyToRemove = Array(inputMap)[indexPath.row - 1].key
            inputMap.removeValue(forKey: keyToRemove)
            clearResultMap()
            tableView.reloadData()
        } else if editingStyle == .insert {
            guard let cell = tableView.cellForRow(at: indexPath) as? MapsTableViewCell else {
                fatalError("Wrong cell type")
            }
            if let key = Int32(cell.keyTextField.text ?? ""), let value = cell.valueTextField.text {
                inputMap[key] = value
                cell.keyTextField.text = ""
                cell.valueTextField.text = ""
                clearResultMap()
                tableView.reloadData()
            }
        }
    }

    @IBAction func callBaseApi(_ sender: Any) {
        resultMap = HelloWorldMaps.methodWithMap(input: inputMap)
        resultMapView.reloadData()
    }

    func isInputMapView(_ view: UITableView) -> Bool {
        return view == inputMapView
    }

    func clearResultMap() {
        resultMap = [:]
        resultMapView.reloadData()
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {
        return Int32(string) != nil
    }
}
