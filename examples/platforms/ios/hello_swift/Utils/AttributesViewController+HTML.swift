// -------------------------------------------------------------------------------------------------
// Copyright (C) 2016-2018 HERE Europe B.V.
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

public class AttributesLabels {
    public static let protocolHTML = """
        <span style="font-family: monospace;">
          <span style="color: #3366ff;">
            public protocol</span> HelloWorldAttributes {
          <br />&nbsp;
          <span style="color: #3366ff;">
            var</span> builtInTypeAttribute:
          <span style="color: #3495AF;">UInt32</span>
          {
          <span style="color: #3366ff;">get set</span> }
          <br />&nbsp;
          <span style="color: #3366ff;">
            var</span> readonlyAttribute:
          <span style="color: #3495AF;">Float</span>
          {
          <span style="color: #3366ff;">get</span> }
          <br />&nbsp;
          <span style="color: #3366ff;">var</span> structAttribute: ExampleStruct
          {
          <span style="color: #3366ff;">get set</span> }
          <br />}
        </span>
    """

    public static let getBuiltInAttrHTML = """
        <center>
          <span style="font-family: monospace;">
            <span style="color: #3366ff;">let</span> result =
            <span style="color: #0F7001;">
              testClass</span>.builtInTypeAttribute
            <br><br> result &rarr; %d
          </span>
        </center>
    """

    public static let setBuiltInAttrHTML = """
        <center>
          <span style="font-family: monospace;">
          <span style="color: #0F7001;">testClass</span>.builtInTypeAttribute = %d
          </span>
        </center>
    """

    public static let getReadonlyAttributeHTML = """
        <center>
          <span style="font-family: monospace;">
                        <span style="color: #3366ff;">let</span> result =
          <span style="color: #0F7001;">
                        testClass</span>.readonlyAttribute
          <br><br> result &rarr; %f
          </span>
        </center>
    """

    public static let getStructAttrHTML = """
        <center>
          <span style="font-family: monospace;"><table><tbody>
            <tr><td colspan="2">
              <span style="color: #3366ff;">let</span> result =
              <span style="color: #0f7001;">testClass</span>.structAttribute
              <br><br>
            </td></tr>
            <tr>
              <td>result &rarr; </td>
              <td>%@</td>
            </tr>
          </tbody></table></span>
        </center>
    """

    public static let setStructAttrHTML = """
        <center>
          <span style="font-family: monospace;">
            <span style="color: #0F7001;">
              testClass</span>.structAttribute&nbsp;= ExampleStruct(value:&nbsp;%f)
          </span>
        </center>
    """
}
