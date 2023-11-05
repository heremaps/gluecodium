// Copyright (C) 2016-2023 HERE Europe B.V.
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

import SwiftUI
import mylibrary

struct ContentView: View {
    
    @State private var number1: Int32?
    @State private var number2: Int32?

    @State private var resultText: String = "Here result is printed"
    @State private var resultColor: Color = Color.black
    
    private let calculator = Calculator()
    
    var body: some View {
        VStack {
            TextField("Number 1", value: $number1, format: .number)
                .textFieldStyle(.roundedBorder)
            TextField("Number 2", value: $number2, format: .number)
                .textFieldStyle(.roundedBorder)
            Text(resultText).foregroundColor(resultColor)
            Grid {
                GridRow {
                    Button(action: summarize) {
                        Text("+").frame(maxWidth: .infinity)
                    }.buttonStyle(.bordered).controlSize(.large)
                    Button(action: subtract) {
                        Text("-").frame(maxWidth: .infinity)
                    }.buttonStyle(.bordered).controlSize(.large)
                }
                Divider()
                GridRow {
                    Button(action: multiply) {
                        Text("x").frame(maxWidth: .infinity)
                    }.buttonStyle(.bordered).controlSize(.large)
                    Button(action: divide) {
                        Text("/").frame(maxWidth: .infinity)
                    }.buttonStyle(.bordered).controlSize(.large)
                }
                Divider()
                GridRow {
                    Button(action: min) {
                        Text("min").frame(maxWidth: .infinity)
                    }.buttonStyle(.bordered).controlSize(.large)
                    Button(action: max) {
                        Text("max").frame(maxWidth: .infinity)
                    }.buttonStyle(.bordered).controlSize(.large)
                }
            }
        }
        .padding()
    }
    
    private func summarize() {
        guard let number1 = number1, let number2 = number2 else {
            showError(text: "Input is empty")
            return
        }
        
        do {
            let result = try calculator.summarize(first: number1, second: number2)
            showResult(text: "\(number1) + \(number2) = \(result)")
        } catch let error as Calculator.CalculatorExceptionError {
            showError(text: "\(error)")
        } catch {
            showError(text: "\(error)")
        }
    }
    
    private func subtract() {
        guard let number1 = number1, let number2 = number2 else {
            showError(text: "Input is empty")
            return
        }
        
        calculator.subtract(minuend: number1, subtrahend: number2) { (error, result) in
            if let error = error {
                showError(text: "\(error)")
            } else if let result = result {
                showResult(text: "\(number1) - \(number2) = \(result)")
            }
        }
    }
    
    private func multiply() {
        guard let number1 = number1, let number2 = number2 else {
            showError(text: "Input is empty")
            return
        }
        
        class MultiplyCallbackImpl: MultiplyCallback {
            var showError: (String) -> ()
            var showResult: (Int32) -> ()
            
            init(showError: @escaping (String) -> Void, showResult: @escaping (Int32) -> Void) {
                self.showError = showError
                self.showResult = showResult
            }
            
            func onError(error: Calculator.CalculatorError) {
                showError("\(error)")
            }
            
            func onResult(result: Int32) {
                showResult(result)
            }
        }
        
        calculator.multiply(first: number1, second: number2,
                            multiplyCallback: MultiplyCallbackImpl(
                                showError: {error in self.showError(text: error)},
                                showResult: {result in self.showResult(text: "\(number1) x \(number2) = \(result)")}))
    }
    
    private func divide() {
        guard let number1 = number1, let number2 = number2 else {
            showError(text: "Input is empty")
            return
        }
        
        let result = calculator.divide(divideArguments: Calculator.DivideArguments(dividend: number1,
                                                                                   divider: number2))
        
        if let error = result.error {
            showError(text: "\(error)")
        } else if let result = result.result {
            showResult(text: "\(number1) / \(number2) = \(result)")
        }
    }
    
    private func min() {
        guard let number1 = number1, let number2 = number2 else {
            showError(text: "Input is empty")
            return
        }
        
        let resultRetriever = calculator.min(first: number1, second: number2)
        let result = resultRetriever.getResult()
        showResult(text: "min(\(number1), \(number2)) = \(result)")
    }
    
    private func max() {
        if let result = calculator.max(first: number1, second: number2) {
            // let number1: Int32 = number1 ?
            if let number1 = number1, let number2 = number2 {
                showResult(text: "max(\(number1), \(number2)) = \(result)")
            } else if let number = number1 ?? number2 {
                showResult(text: "max(\(number)) = \(result)")
            }
        } else {
            showResult(text: "nil")
        }
    }
    
    private func showError(text: String) {
        resultText = text
        resultColor = Color.red
    }
    
    private func showResult(text: String) {
        resultText = text
        resultColor = Color.black
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
