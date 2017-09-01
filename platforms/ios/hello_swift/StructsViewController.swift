//
//  StructsViewController.swift
//  hello_swift
//
//  Copyright © 2017 HERE. All rights reserved.
//

import UIKit
import hello

class StructsViewController: UIViewController {

    @IBOutlet var lastSyncTextField: UITextField!
    @IBOutlet var numberOfTimesSyncedTextField: UITextField!
    @IBOutlet var extendedNumberOfTimesSyncedTextField: UITextField!

    var syncResult: HelloWorldPlainDataStructures.SyncResult
    var extendedSyncResult: HelloWorldPlainDataStructures.IdentifiableSyncResult

    let dateFormater = DateFormatter()

    required init?(coder aDecoder: NSCoder) {
        syncResult = HelloWorldPlainDataStructures.SyncResult(lastUpdatedTimeStamp: 0, numberOfChanges: 0)
        extendedSyncResult = HelloWorldPlainDataStructures.IdentifiableSyncResult(id: 42, syncResult: syncResult)
        super.init(coder: aDecoder)

    }

    override func viewDidLoad() {
        lastSyncTextField.text = "unknown"
        numberOfTimesSyncedTextField.text = "n/a"
        extendedNumberOfTimesSyncedTextField.text = "n/a"
    }

    @IBAction func didPressSync(_ sender: Any) {

        if let result = HelloWorldPlainDataStructures.methodWithNonNestedType(input: syncResult) {
            syncResult = result
            lastSyncTextField.text = dateFormater.string(from: Date(timeIntervalSince1970: TimeInterval(syncResult.lastUpdatedTimeStamp)))
            numberOfTimesSyncedTextField.text = String(syncResult.numberOfChanges)
        }
    }

    @IBAction func disPressExtendedSync(_ sender: Any) {
        if let identifiableResult = HelloWorldPlainDataStructures.methodWithNestedType(input: extendedSyncResult) {
            extendedSyncResult = identifiableResult
            extendedNumberOfTimesSyncedTextField.text = String(extendedSyncResult.syncResult.numberOfChanges)
        }
    }
}
