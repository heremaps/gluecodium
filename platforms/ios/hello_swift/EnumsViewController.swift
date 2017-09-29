//
//  StructsViewController.swift
//  hello_swift
//
//  Copyright © 2017 HERE. All rights reserved.
//

import UIKit
import hello

extension HelloWorldEnums.InternalError {
    public var description: String {
        if (self == HelloWorldEnums.InternalError.error_none) {
            return "errorNone"
        } else {
            return "errorFatal"
        }
    }
}

class EnumsViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var resultField: UITextField!

    func getEnum(val: Int) -> HelloWorldEnums.InternalError
    {
        if (val == 0) {
            return HelloWorldEnums.InternalError.error_none
        } else {
            return HelloWorldEnums.InternalError.error_fatal
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        picker.dataSource = self
        picker.delegate = self
    }
    @IBAction func didPress(_ sender: Any) {
        let val = picker.selectedRow(inComponent: 0)
        let enumVal = getEnum(val: val)
        resultField.text = HelloWorldEnums.methodWithEnumeration(input: enumVal).description
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 2
    }

    public func pickerView(
        _ pickerView: UIPickerView,
        titleForRow row: Int,
        forComponent component: Int) -> String? {

        return getEnum(val: row).description
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        resultField.text = ""
    }


}

