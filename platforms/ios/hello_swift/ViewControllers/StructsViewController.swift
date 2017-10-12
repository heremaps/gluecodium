//
//  StructsViewController.swift
//  hello_swift
//
//  Copyright © 2017 HERE. All rights reserved.
//

import UIKit
import hello

class StructsViewController: UIViewController {

    @IBOutlet var numberOfTimesSyncedTextField: UITextField!
    @IBOutlet var extendedNumberOfTimesSyncedTextField: UITextField!

    var syncResult: HelloWorldPlainDataStructures.SyncResult
    var extendedSyncResult: HelloWorldPlainDataStructures.IdentifiableSyncResult

    required init?(coder aDecoder: NSCoder) {
        syncResult = HelloWorldPlainDataStructures.SyncResult(lastUpdatedTimeStamp: 0, numberOfChanges: 0)
        extendedSyncResult = HelloWorldPlainDataStructures.IdentifiableSyncResult(id: 42, syncResult: syncResult)
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        populateFields()
    }

    func populateFields() {
        numberOfTimesSyncedTextField.text = String(syncResult.numberOfChanges)
        extendedNumberOfTimesSyncedTextField.text = String(extendedSyncResult.syncResult.numberOfChanges)
    }

    @IBAction func didPressSync(_ sender: Any) {
        if let result = HelloWorldPlainDataStructures.methodWithNonNestedType(input: syncResult) {
            syncResult = result
            populateFields()
        }
    }

    @IBAction func disPressExtendedSync(_ sender: Any) {
        if let identifiableResult = HelloWorldPlainDataStructures.methodWithNestedType(input: extendedSyncResult) {
            extendedSyncResult = identifiableResult
            populateFields()
        }
    }
}
