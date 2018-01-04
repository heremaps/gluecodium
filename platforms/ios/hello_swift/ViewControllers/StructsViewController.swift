//
//  StructsViewController.swift
//  hello_swift
//
//  Copyright © 2017 HERE. All rights reserved.
//

import UIKit
import hello

class StructsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var structPicker: UIPickerView!
    @IBOutlet weak var resultView: UIWebView!

    typealias Structs = HelloWorldPlainDataStructures
    typealias SyncFunction = () -> Void
    typealias StructStateFunction = () -> StructToHTML
    typealias DemoCase = (label: String, currentState: StructStateFunction, syncFunction: SyncFunction)

    var syncResult: Structs.SyncResult
    var extendedSyncResult: Structs.IdentifiableSyncResult
    var numericSync: Structs.NumericSyncResult

    private var indexSelected = 0

    lazy var dataSource: [DemoCase] = [
        ("Class defined structure", {return self.syncResult}, {
            self.syncResult.lastUpdatedTimeStamp = UInt64(Date().timeIntervalSinceReferenceDate)
            self.syncResult =  Structs.methodWithNonNestedType(input: self.syncResult)!}),
        ("Nested class defined structure", {return self.extendedSyncResult}, {
            self.extendedSyncResult.syncResult.lastUpdatedTimeStamp = UInt64(Date().timeIntervalSinceReferenceDate)
            self.extendedSyncResult = Structs.methodWithNestedType(input: self.extendedSyncResult)!}),
        ("Inherited class defined structure", {return self.numericSync}, {
            self.numericSync.lastUpdatedTimeStamp = UInt64(Date().timeIntervalSinceReferenceDate)
            self.numericSync = Structs.methodWithInheritedStruct(input: self.numericSync)!})
    ]

    required init?(coder aDecoder: NSCoder) {
        syncResult = Structs.SyncResult(lastUpdatedTimeStamp: 0, numberOfChanges: 0)
        extendedSyncResult = Structs.IdentifiableSyncResult(id: 42, syncResult: syncResult)
        numericSync = Structs.NumericSyncResult(lastUpdatedTimeStamp: 0, numberOfChanges: 0, resultInChildStruct: 5)
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
        let html = dataSource[indexSelected].currentState().html
        resultView.loadHTMLString(html, baseURL: nil)
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

extension HelloWorldPlainDataStructures.SyncResult: StructToHTML {}
extension HelloWorldPlainDataStructures.IdentifiableSyncResult: StructToHTML {}
extension HelloWorldPlainDataStructures.NumericSyncResult: StructToHTML {}
