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

import Foundation

class HTML {
    private static let CHECK: String = "✅"
    private static let CROSS: String = "❌"
    private static let QUESTION: String = "❔"

    private static let structHTMLTemplate = """
    <center> <span style="font-family: monospace;"><table><tbody>
    <tr><td><span style="color: #3366ff;">struct</span> %@ {</td></tr>
    %@
    <tr><td>}</td></tr>
    </tbody></table> </span></center>
    """

    private static let structFieldHTMLTemplate = """
    <tr><td><span style="color: #3366ff;">&nbsp;&nbsp;var</span> %@: <span style="color: #3495af;">%@</span> &rarr; %@
    </td></tr>
    """

    private static let nestedStructFieldSeparator = "<br>&nbsp;&nbsp;&nbsp;&nbsp;"

    public static func renderStruct(_ object: Any) -> String {
        let fields = Mirror(reflecting: object).children
            .map({field in
                let fieldType = String(describing: type(of: field.value))
                let fieldValue = String(describing: field.value)
                return String(
                    format: structFieldHTMLTemplate,
                    field.label!, fieldType,
                    splitFieldIfStruct(fieldType, fieldValue))})
            .reduce("", {$0 + $1})
        let structName = String(describing: type(of: object))
        return String(format: structHTMLTemplate, structName, fields)
    }

    public static func renderInheritanceTable(
            _ inheritanceTable: InheritanceViewController.InheritanceTable) -> String {
        var html = "<center><span style='font-family: monospace;'><table cellspacing='10'><tbody><tr><td></td>"
        for clazz in inheritanceTable.colsHeaders {
            html += "<th scope='col'><span style='writing-mode: tb-rl; color: #3495af;'>" +
                String(describing: clazz) + "</span></th>"
        }
        html += "</tr>"
        for (row, object) in inheritanceTable.rowsHeaders.enumerated() {
            html += "<tr><th scope='row' style='text-align:left;'>" + object.label + "</th>"
            for col in inheritanceTable.colsHeaders.indices {
                html += "<td>"
                if row < inheritanceTable.values.count &&
                    col < inheritanceTable.values[row].count {
                    html += inheritanceTable.values[row][col] ? CHECK : CROSS
                } else {
                    html += QUESTION
                }
            }
            html += "</tr>"
        }

        html += "</tbody></table></span></center>"
        return html
    }

    private static func splitFieldIfStruct(_ fieldType: String, _ fieldValue: String) -> String {
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

    public static func renderLog(_ log: String) -> String {
        return "<span style='font-family: monospace;'>" +
            log.replacingOccurrences(of: "\n", with: "<hr>", options: .literal, range: nil) +
            "</span>"
    }
}
