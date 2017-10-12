//
//  UIApplication+Version.swift
//  hello_swift
///
//  Copyright © 2017 HERE. All rights reserved.
//

import UIKit

extension UIApplication {

 func applicationVersion() -> String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? "0.0.1"
    }

    func applicationBuild() -> String {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as? String ?? "1"
    }

    func versionBuild() -> String {
        let version = self.applicationVersion()
        let build = self.applicationBuild()
        return "v\(version)(\(build))"
    }
}
