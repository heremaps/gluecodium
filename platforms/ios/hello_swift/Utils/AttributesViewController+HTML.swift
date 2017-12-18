//
//  TypedefsViewController.swift
//  hello_swift
///
//  Copyright © 2017 HERE. All rights reserved.
//

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
