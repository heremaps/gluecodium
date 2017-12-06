//
//  ErrorsViewController.swift
//  hello_swift
//
//  Copyright © 2017 HERE. All rights reserved.
//

import UIKit
import hello

class ErrorsViewControler: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    typealias MethodSignature = (Bool) throws -> Any

    @IBOutlet weak var methodPicker: UIPickerView!
    @IBOutlet weak var throwSwitch: UISwitch!
    @IBOutlet weak var callMethodButton: UIButton!
    @IBOutlet weak var callResult: UITextView!

    var indexSelected = 0
    let methodLabelTemplate =
    """
        <center><span style='font-family: monospace;font-size: 18px'> method(flag:
        <span style='color: #5C2699;'>Bool</span>) <span style='color: #b40062;'>
        throws</span> &rarr; <span style='color: #5C2699;'>%@</span>%@</span></center>
        """
    lazy var dataSource:[(label: String, errorMethod: MethodSignature)] = [
        (createLabel(returnType: "Void"), HelloWorldErrors.helloWorldMethodWithError),
        (createLabel(returnType: "String", isReturnOptional: true), HelloWorldErrors.helloWorldMethodWithErrorAndString)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    private func callThrowingMethod(functionToCall: MethodSignature) -> String {
        do {
            return "function has finished returning\n" +
                String(reflecting: try functionToCall(throwSwitch.isOn))
        } catch {
            return "function has thrown folllowing value\n" +
                String(reflecting: error)
        }
    }

    @IBAction func callMethod(_ sender: Any) {
        callResult.text = callThrowingMethod(functionToCall: dataSource[indexSelected].errorMethod)
    }

    @IBAction func boolFlagChanged(_ sender: Any) {
        callResult.text = ""
    }

    private func createLabel(returnType: String, isReturnOptional: Bool = false) -> String {
        return String(format: methodLabelTemplate, returnType, isReturnOptional ? "?" : "")
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 36
    }

    public func pickerView(_ pickerView: UIPickerView,
                           viewForRow row: Int,
                           forComponent component: Int,
                           reusing view: UIView?) -> UIView {
        var webView = view as? UIWebView
        if webView == nil {
            webView = UIWebView()
        }
        webView!.loadHTMLString(dataSource[row].label, baseURL: nil)
        return webView!
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataSource.count
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        indexSelected = row
        callResult.text = ""
    }
}
