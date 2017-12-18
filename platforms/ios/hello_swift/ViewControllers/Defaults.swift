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

    private let extractedValue = HelloWorldDefaults.StructWithDefaults(
        intField: 42,
        floatField: 3.14,
        boolField: true,
        stringField: "some string",
        enumField: .barValue)

    @IBAction func buttonPressed(_ sender: Any) {
        nativeDefault.loadHTMLString(
            HelloWorldDefaults.StructWithDefaults().html, baseURL: nil)
        baseLayerDefault.loadHTMLString(
            HelloWorldDefaults.getStructWithDefaults()!.html, baseURL: nil)
    }
    override func viewDidLoad() {
        expected.loadHTMLString(
            extractedValue.html,
            baseURL: nil)
    }
}

extension HelloWorldDefaults.StructWithDefaults: StructToHTML {
}
