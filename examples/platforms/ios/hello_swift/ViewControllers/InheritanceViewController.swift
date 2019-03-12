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

import hello
import UIKit

class InheritanceViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    struct InheritanceTable {
        var colsHeaders: [Any]
        var rowsHeaders: [ObjectWithLabel]
        var values: [[Bool]] = []
        init(colsHeaders: [Any], rowsHeaders: [ObjectWithLabel], values: [[Bool]] = []) {
            self.colsHeaders = colsHeaders
            self.rowsHeaders = rowsHeaders
            self.values = values
        }
    }

    class SwiftCircle: Circle {
        func scale(factor: Double) {
            HelloWorldStaticLogger.append(log: "Scaling SwiftCircle with factor=" + String(factor) + "\n")
        }
    }

    class SwiftRectangle: Rectangle {
        func scale(factor: Double) {
            HelloWorldStaticLogger.append(log: "Scaling SwiftRectangle with factor=" + String(factor) + "\n")
        }
    }

    class SwiftChildRectangle: SwiftRectangle {
        override func scale(factor: Double) {
            HelloWorldStaticLogger.append(log: "Scaling SwiftChildRectangle with factor=" + String(factor) + "\n")
        }
    }

    typealias ObjectWithLabel = (object: Shape, label: String)
    typealias ActionFunction = () -> Void
    typealias DemoCase = (label: String, actionToExecute: ActionFunction, clearFunction: () -> Void)

    @IBOutlet weak var inheritanceTableWebView: UIWebView!
    @IBOutlet weak var demoCasePicker: UIPickerView!

    var objects: [ObjectWithLabel] = [
        (SwiftCircle(), "swiftCircle"),
        (InheritanceHelper.createCircle()!, "nativeImplCircle"),
        (InheritanceHelper.createRectangle()!, "nativeImplRectangle"),
        (SwiftRectangle(), "swiftParentRectangle"),
        (SwiftChildRectangle(), "swiftChildRectangle"),
        (InheritanceHelper.createSquare()!, "nativeImplSquare")]
    var types: [Any] = [Shape.self, Circle.self, Rectangle.self, Square.self]

    lazy var emptyInheritanceTable: String = HTML.renderInheritanceTable(
        InheritanceTable(colsHeaders: types, rowsHeaders: objects))
    let legendForCheckingInheritance = """
        <center>Table contains result of calling 'is' operator on each <span style='font-family: monospace;'>
        <b>variable</b></span> against all availiable <span style='font-family: monospace;color: #3495af;''>
        <b>Types</b></span></center>
        """
    lazy var legendForCallingMethod: String = """
        Field will contain logs from static logger after execution of:<br><br>
        <span style="font-family: monospace;">
        <span style="color: #b40062;">var</span> objects: [<span style="color: #3495af;">Shape</span>] = [<br>
        """ + objects.flatMap({(_, label) -> String in
            return "&nbsp;&nbsp;<span style='color: #3495af;'>" + label + "</span>,<br>"
        }) + """
        ]<br><br><span style="color: #3495af;">InheritanceHelper</span>.applyScaleOn(<br>
        &nbsp;&nbsp;scaleFactor: <span style="color: #3366ff;">2.0</span>,<br>
        &nbsp;&nbsp;shapes: <span style="color: #3495af;">objects</span>) </span>
        """

    var indexSelected = 0
    lazy var dataSource: [DemoCase] = [
        ("Inheritance cross checking", crosscheckInheritance, {
            self.inheritanceTableWebView.loadHTMLString(
                self.legendForCheckingInheritance + self.emptyInheritanceTable, baseURL: nil)}),
        ("Calling method on array of objects", callMethodOnAllObjects, {
            self.inheritanceTableWebView.loadHTMLString(self.legendForCallingMethod, baseURL: nil)})
    ]

    private func crosscheckInheritance() {
        var inherit: [[Bool]] = []
        for objectWithLabel in objects {
            inherit.append([
                objectWithLabel.object is Shape,
                objectWithLabel.object is Circle,
                objectWithLabel.object is Rectangle,
                objectWithLabel.object is Square])
        }

        inheritanceTableWebView.loadHTMLString(legendForCheckingInheritance + HTML.renderInheritanceTable(
            InheritanceTable(colsHeaders: types, rowsHeaders: objects, values: inherit)), baseURL: nil)
    }

    private func callMethodOnAllObjects() {
        HelloWorldStaticLogger.clearLog()
        InheritanceHelper.applyScaleOn(scaleFactor: 2.0, shapes: objects.flatMap {$0.object})
        inheritanceTableWebView.loadHTMLString(HTML.renderLog(HelloWorldStaticLogger.getLog()), baseURL: nil)
    }

    private func clearResultFiled() {
        dataSource[indexSelected].clearFunction()
    }

    override func viewDidLoad() {
        clearResultFiled()
    }

    @IBAction func executeDemoCase(_ sender: Any) {
        dataSource[indexSelected].actionToExecute()
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
        clearResultFiled()
    }

}
