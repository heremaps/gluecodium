//
//  ArraysViewController.swift
//  hello_swift
///
//  Copyright © 2017 HERE. All rights reserved.
//

import UIKit
import hello

class ArraysViewController: UIViewController {
    @IBOutlet weak var arrayInput2: UITextField!
    @IBOutlet weak var arrayInput1: UITextField!
    @IBOutlet weak var methodPicker: UIPickerView!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var resultLabel: UILabel!

    var indexSelected: Int = 0
    let source = ["Simple Array", "Nested Array"]

    override func viewDidLoad() {
        methodPicker.delegate = self
        methodPicker.dataSource = self
        super.viewDidLoad()
    }
    @IBAction func injectArray(_ sender: Any) {
        dismissKeyboard()
        resultView.isHidden = false
        if indexSelected == 0 {
            let result: CollectionOf<Int64> = HelloWorldArrays.methodWithSimpleArray(input: arrayInput1.intArray)
            resultLabel.text = result.stringRepresentation
        } else {
            let result: CollectionOf<CollectionOf<Int64>> =
                HelloWorldArrays.methodWithNestedArraysInline(input: [arrayInput1.intArray, arrayInput2.intArray])
            resultLabel.text = result.stringRepresentation
        }
    }
}

extension ArraysViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return source.count
    }
}

extension ArraysViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return source[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        indexSelected = row
        UIView.animate(withDuration: 0.3) {
            self.arrayInput2.isHidden = (row == 0)
        }
    }
}

extension UITextField {
    var intArray: [Int64] {
        return self.text?.split(separator: ",").flatMap {Int64($0)} ?? []
    }
}

extension CollectionOf {
    var stringRepresentation: String {
        let representation = self.map { value -> String in
            if let array = value as? CollectionOf<Int64> {
                return array.stringRepresentation
            } else {
                return String(describing: value)
            }
        }.joined(separator: ",")
        return "["+representation+"]"
    }
}
