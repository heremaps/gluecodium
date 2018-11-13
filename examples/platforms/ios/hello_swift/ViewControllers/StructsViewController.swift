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

class StructsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var structPicker: UIPickerView!
    @IBOutlet weak var resultView: UIWebView!

    typealias Structs = HelloWorldPlainDataStructures
    typealias SyncFunction = () -> Void
    typealias StructStateFunction = () -> String
    typealias DemoCase = (label: String, currentState: StructStateFunction, syncFunction: SyncFunction)

    var syncResult: Structs.SyncResult
    var extendedSyncResult: Structs.IdentifiableSyncResult

    private var indexSelected = 0

    lazy var dataSource: [DemoCase] = [
        ("Class defined structure", {return HTML.renderStruct(self.syncResult)}, {
            self.syncResult.lastUpdatedTimeStamp = UInt64(Date().timeIntervalSinceReferenceDate)
            self.syncResult =  Structs.methodWithNonNestedType(input: self.syncResult)}),
        ("Nested class defined structure", {return HTML.renderStruct(self.extendedSyncResult)}, {
            self.extendedSyncResult.syncResult.lastUpdatedTimeStamp = UInt64(Date().timeIntervalSinceReferenceDate)
            self.extendedSyncResult = Structs.methodWithNestedType(input: self.extendedSyncResult)})
    ]

    required init?(coder aDecoder: NSCoder) {
        syncResult = Structs.SyncResult(lastUpdatedTimeStamp: 0, numberOfChanges: 0)
        extendedSyncResult = Structs.IdentifiableSyncResult(id: 42, syncResult: syncResult)
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        populateField()
    }

    @IBAction func syncPressed(_ sender: Any) {
        dataSource[indexSelected].syncFunction()
        populateField()
    }

    func populateField() {
        resultView.loadHTMLString(dataSource[indexSelected].currentState(), baseURL: nil)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row].label
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        indexSelected = row
        populateField()
    }
}
