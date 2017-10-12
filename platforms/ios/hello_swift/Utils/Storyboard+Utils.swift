//
//  Storyboard+Utils.swift
//  hello_swift
///
//  Copyright © 2017 HERE. All rights reserved.
//

import UIKit

extension UIStoryboard {
    static func mainInstance(name: String) -> UIViewController {
        guard let viewController = UIStoryboard(name: name, bundle: nil).instantiateInitialViewController() else {
            fatalError("Cannot instantiate view controller in the storyboard" + name)
        }
        return viewController
    }
}
