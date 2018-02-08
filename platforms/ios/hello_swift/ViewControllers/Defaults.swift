//
//  Defaults.swift
//  hello_swift
///
//  Copyright © 2017 HERE. All rights reserved.
//

import UIKit
import hello

class StructsWithDefaultsViewController: UIViewController {
    @IBOutlet weak var expected: UIWebView!
    @IBOutlet weak var nativeDefault: UIWebView!
    @IBOutlet weak var baseLayerDefault: UIWebView!
    @IBOutlet weak var retireveDefault: UIButton!

    private let expectedValue = HelloWorldDefaults.StructWithDefaults(
        intField: 42,
        floatField: 3.14,
        boolField: true,
        stringField: "some string",
        enumField: .barValue)

    @IBAction func buttonPressed(_ sender: Any) {
        nativeDefault.loadHTMLString(
            HTML.renderStruct(HelloWorldDefaults.StructWithDefaults()), baseURL: nil)
        baseLayerDefault.loadHTMLString(
            HTML.renderStruct(HelloWorldDefaults.getStructWithDefaults()!), baseURL: nil)
    }
    override func viewDidLoad() {
        expected.loadHTMLString(
            HTML.renderStruct(expectedValue),
            baseURL: nil)
    }
}
