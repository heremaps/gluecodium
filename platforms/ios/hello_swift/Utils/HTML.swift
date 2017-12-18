//
//  HTML.swift
//  hello_swift
///
//  Copyright © 2017 HERE. All rights reserved.
//

import Foundation

private let structHTMLTemplate = """
    <center> <span style="font-family: monospace;"><table><tbody>
    <tr><td><span style="color: #3366ff;">struct</span> %@ {</td></tr>
    %@
    <tr><td>}</td></tr>
    </tbody></table> </span></center>
    """

private let structFieldHTMLTemplate = """
    <tr><td><span style="color: #3366ff;">&nbsp;&nbsp;var</span> %@: <span style="color: #3495af;">%@</span> &rarr; %@
    </td></tr>
    """

public protocol StructToHTML {
    var html: String {get}
}

public extension StructToHTML {
    var html: String {
        let fields = Mirror(reflecting: self).children
            .map({field in String(format: structFieldHTMLTemplate,
                                  field.label!,
                                  String(describing: type(of: field.value)),
                                  String(describing: field.value))})
            .reduce("", {$0 + $1})
        let structName = String(describing: type(of: self))
        return String(format: structHTMLTemplate, structName, fields)
    }
}
