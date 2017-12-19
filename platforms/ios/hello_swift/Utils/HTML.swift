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

private let nestedStructFieldSeparator = "<br>&nbsp;&nbsp;&nbsp;&nbsp;"

public protocol StructToHTML {
    var html: String {get}
}

public extension StructToHTML {
    var html: String {
        let fields = Mirror(reflecting: self).children
            .map({field in
                let fieldType = String(describing: type(of: field.value))
                let fieldValue = String(describing: field.value)
                return String(
                    format: structFieldHTMLTemplate,
                    field.label!, fieldType,
                    splitFieldIfStruct(fieldType, fieldValue))})
            .reduce("", {$0 + $1})
        let structName = String(describing: type(of: self))
        return String(format: structHTMLTemplate, structName, fields)
    }

    private func splitFieldIfStruct(_ fieldType: String, _ fieldValue: String) -> String {
        if fieldValue.starts(with: fieldType) {
            return fieldValue
                .dropFirst(fieldType.count + 1)
                .split(separator: ",")
                .map({$0.trimmingCharacters(in: .whitespaces)})
                .reduce(fieldType + "(", {$0 + nestedStructFieldSeparator + $1})
        } else {
            return fieldValue
        }
    }
}
