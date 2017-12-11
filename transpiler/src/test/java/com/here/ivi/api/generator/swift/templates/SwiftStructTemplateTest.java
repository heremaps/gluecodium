/*
 * Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.generator.swift.templates;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.swift.SwiftContainerType;
import com.here.ivi.api.model.swift.SwiftField;
import com.here.ivi.api.model.swift.SwiftType;
import com.here.ivi.api.model.swift.SwiftValue;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
public class SwiftStructTemplateTest {

  private final SwiftContainerType swiftStruct =
      SwiftContainerType.builder("SomeStruct").cPrefix("C_PREFIX").cType("SomeStructRef").build();

  private static String generate(SwiftContainerType struct) {
    return TemplateEngine.render("swift/Struct", struct);
  }

  @Test
  public void generateEmptyStruct() {
    String expected =
        "public struct SomeStruct {\n"
            + "\n"
            + "    public init() {\n"
            + "    }\n"
            + "\n"
            + "    internal init?(cSomeStruct: SomeStructRef) {\n"
            + "    }\n"
            + "\n"
            + "    internal func convertToCType() -> SomeStructRef {\n"
            + "        let result = C_PREFIX_create()\n"
            + "        fillFunction(result)\n"
            + "        return result\n"
            + "    }\n"
            + "\n"
            + "    internal func fillFunction(_ cSomeStruct: SomeStructRef) -> Void {\n"
            + "    }\n"
            + "}";
    String actual = generate(swiftStruct);
    assertEqualsTrimmed("it should generate empty structs", expected, actual);
  }

  @Test
  public void generateBasicStruct() {
    swiftStruct.fields.add(new SwiftField("counter", new SwiftType("Integer"), null));
    String expected =
        "public struct SomeStruct {\n"
            + "    public var counter: Integer\n"
            + "\n"
            + "    public init(counter: Integer) {\n"
            + "        self.counter = counter\n"
            + "    }\n"
            + "\n"
            + "    internal init?(cSomeStruct: SomeStructRef) {\n"
            + "        counter = C_PREFIX_counter_get(cSomeStruct)\n"
            + "    }\n"
            + "\n"
            + "    internal func convertToCType() -> SomeStructRef {\n"
            + "        let result = C_PREFIX_create()\n"
            + "        fillFunction(result)\n"
            + "        return result\n"
            + "    }\n"
            + "\n"
            + "    internal func fillFunction(_ cSomeStruct: SomeStructRef) -> Void {\n"
            + "        C_PREFIX_counter_set(cSomeStruct, counter)\n"
            + "    }\n"
            + "}";
    String actual = generate(swiftStruct);
    assertEqualsTrimmed("it should generate a struct for integer", expected, actual);
  }

  @Test
  public void generateStructWithThreeFields() {
    swiftStruct.fields.add(new SwiftField("latitude", new SwiftType("Double"), null));
    swiftStruct.fields.add(new SwiftField("longitude", new SwiftType("Double"), null));
    swiftStruct.fields.add(new SwiftField("altitude", new SwiftType("Double"), null));
    String expected =
        "public struct SomeStruct {\n"
            + "    public var latitude: Double\n"
            + "    public var longitude: Double\n"
            + "    public var altitude: Double\n"
            + "\n"
            + "    public init(latitude: Double, longitude: Double, altitude: Double) {\n"
            + "        self.latitude = latitude\n"
            + "        self.longitude = longitude\n"
            + "        self.altitude = altitude\n"
            + "    }\n"
            + "\n"
            + "    internal init?(cSomeStruct: SomeStructRef) {\n"
            + "        latitude = C_PREFIX_latitude_get(cSomeStruct)\n"
            + "        longitude = C_PREFIX_longitude_get(cSomeStruct)\n"
            + "        altitude = C_PREFIX_altitude_get(cSomeStruct)\n"
            + "    }\n"
            + "\n"
            + "    internal func convertToCType() -> SomeStructRef {\n"
            + "        let result = C_PREFIX_create()\n"
            + "        fillFunction(result)\n"
            + "        return result\n"
            + "    }\n"
            + "\n"
            + "    internal func fillFunction(_ cSomeStruct: SomeStructRef) -> Void {\n"
            + "        C_PREFIX_latitude_set(cSomeStruct, latitude)\n"
            + "        C_PREFIX_longitude_set(cSomeStruct, longitude)\n"
            + "        C_PREFIX_altitude_set(cSomeStruct, altitude)\n"
            + "    }\n"
            + "}";
    String actual = generate(swiftStruct);
    assertEqualsTrimmed("it should generate a struct with two fields", expected, actual);
  }

  @Test
  public void generateStructWithStringField() {
    swiftStruct.fields.add(
        new SwiftField(
            "name", new SwiftType("String", SwiftType.TypeCategory.BUILTIN_STRING), null));
    String expected =
        "public struct SomeStruct {\n"
            + "    public var name: String\n"
            + "\n"
            + "    public init(name: String) {\n"
            + "        self.name = name\n"
            + "    }\n"
            + "\n"
            + "    internal init?(cSomeStruct: SomeStructRef) {\n"
            + "        do {\n"
            + "            let nameHandle = C_PREFIX_name_get(cSomeStruct)\n"
            + "            name = String(cString:std_string_data_get(nameHandle))\n"
            + "        }\n"
            + "    }\n"
            + "\n"
            + "    internal func convertToCType() -> SomeStructRef {\n"
            + "        let result = C_PREFIX_create()\n"
            + "        fillFunction(result)\n"
            + "        return result\n"
            + "    }\n"
            + "\n"
            + "    internal func fillFunction(_ cSomeStruct: SomeStructRef) -> Void {\n"
            + "        C_PREFIX_name_set(cSomeStruct, name)\n"
            + "    }\n"
            + "}";
    String actual = generate(swiftStruct);
    assertEqualsTrimmed("it should generate a struct with field of type String", expected, actual);
  }

  @Test
  public void generateStructWithDataField() {
    swiftStruct.fields.add(
        new SwiftField(
            "icon", new SwiftType("Data", SwiftType.TypeCategory.BUILTIN_BYTEBUFFER), null));
    String expected =
        "public struct SomeStruct {\n"
            + "    public var icon: Data\n"
            + "\n"
            + "    public init(icon: Data) {\n"
            + "        self.icon = icon\n"
            + "    }\n"
            + "\n"
            + "    internal init?(cSomeStruct: SomeStructRef) {\n"
            + "        do {\n"
            + "            let iconFieldHandle = C_PREFIX_icon_get(cSomeStruct)\n"
            + "            guard\n"
            + "                let dataHandle = byteArray_data_get(iconFieldHandle)\n"
            + "            else {\n"
            + "                return nil\n"
            + "            }\n"
            + "            icon = Data(bytes: dataHandle, count: Int(byteArray_size_get(iconFieldHandle)))\n"
            + "        }\n"
            + "    }\n"
            + "\n"
            + "    internal func convertToCType() -> SomeStructRef {\n"
            + "        let result = C_PREFIX_create()\n"
            + "        fillFunction(result)\n"
            + "        return result\n"
            + "    }\n"
            + "\n"
            + "    internal func fillFunction(_ cSomeStruct: SomeStructRef) -> Void {\n"
            + "        icon.withUnsafeBytes { (icon_ptr: UnsafePointer<UInt8>) in\n"
            + "            C_PREFIX_icon_set(cSomeStruct, icon_ptr, Int64(icon.count))\n"
            + "        }\n"
            + "    }\n"
            + "}";
    String actual = generate(swiftStruct);
    assertEqualsTrimmed("it should generate a struct with field of type String", expected, actual);
  }

  @Test
  public void generateStructWithStructField() {
    swiftStruct.fields.add(
        new SwiftField("nested", SwiftContainerType.builder("NestedStruct").build(), null));
    String expected =
        "public struct SomeStruct {\n"
            + "    public var nested: NestedStruct\n"
            + "\n"
            + "    public init(nested: NestedStruct) {\n"
            + "        self.nested = nested\n"
            + "    }\n"
            + "\n"
            + "    internal init?(cSomeStruct: SomeStructRef) {\n"
            + "        do {\n"
            + "            guard\n"
            + "                let nestedUnwrapped = NestedStruct(cNestedStruct: C_PREFIX_nested_get(cSomeStruct))\n"
            + "            else {\n"
            + "                return nil\n"
            + "            }\n"
            + "            nested = nestedUnwrapped\n"
            + "        }\n"
            + "    }\n"
            + "\n"
            + "    internal func convertToCType() -> SomeStructRef {\n"
            + "        let result = C_PREFIX_create()\n"
            + "        fillFunction(result)\n"
            + "        return result\n"
            + "    }\n"
            + "\n"
            + "    internal func fillFunction(_ cSomeStruct: SomeStructRef) -> Void {\n"
            + "        let nestedHandle = C_PREFIX_nested_get(cSomeStruct)\n"
            + "        nested.fillFunction(nestedHandle)\n"
            + "    }\n"
            + "}";
    String actual = generate(swiftStruct);
    assertEqualsTrimmed("it should generate a struct with field of type String", expected, actual);
  }

  @Test
  public void generateStructWithInstanceField() {
    swiftStruct.fields.add(
        new SwiftField(
            "instanceField", new SwiftType("SomeClass", SwiftType.TypeCategory.CLASS), null));
    String expected =
        "public struct SomeStruct {\n"
            + "    public var instanceField: SomeClass\n"
            + "\n"
            + "    public init(instanceField: SomeClass) {\n"
            + "        self.instanceField = instanceField\n"
            + "    }\n"
            + "\n"
            + "    internal init?(cSomeStruct: SomeStructRef) {\n"
            + "        do {\n"
            + "            guard\n"
            + "                let instanceFieldUnwrapped = SomeClass(cSomeClass: C_PREFIX_instanceField_get(cSomeStruct))\n"
            + "            else {\n"
            + "                return nil\n"
            + "            }\n"
            + "            instanceField = instanceFieldUnwrapped\n"
            + "        }\n"
            + "    }\n"
            + "\n"
            + "    internal func convertToCType() -> SomeStructRef {\n"
            + "        let result = C_PREFIX_create()\n"
            + "        fillFunction(result)\n"
            + "        return result\n"
            + "    }\n"
            + "\n"
            + "    internal func fillFunction(_ cSomeStruct: SomeStructRef) -> Void {\n"
            + "        C_PREFIX_instanceField_set(cSomeStruct, getRef(instanceField).ref)\n"
            + "    }\n"
            + "}";
    String actual = generate(swiftStruct);
    assertEqualsTrimmed("it should generate a struct with field of type String", expected, actual);
  }

  @Test
  public void generateStructWithStringFieldWithDefault() {
    swiftStruct.fields.add(new SwiftField("name", SwiftType.STRING, new SwiftValue("\"foo\"")));
    String expected =
        "public struct SomeStruct {\n"
            + "    public var name: String\n"
            + "\n"
            + "    public init(name: String = \"foo\") {\n"
            + "        self.name = name\n"
            + "    }\n"
            + "\n"
            + "    internal init?(cSomeStruct: SomeStructRef) {\n"
            + "        do {\n"
            + "            let nameHandle = C_PREFIX_name_get(cSomeStruct)\n"
            + "            name = String(cString:std_string_data_get(nameHandle))\n"
            + "        }\n"
            + "    }\n"
            + "\n"
            + "    internal func convertToCType() -> SomeStructRef {\n"
            + "        let result = C_PREFIX_create()\n"
            + "        fillFunction(result)\n"
            + "        return result\n"
            + "    }\n"
            + "\n"
            + "    internal func fillFunction(_ cSomeStruct: SomeStructRef) -> Void {\n"
            + "        C_PREFIX_name_set(cSomeStruct, name)\n"
            + "    }\n"
            + "}";
    String actual = generate(swiftStruct);
    assertEqualsTrimmed("it should generate a struct with field of type String", expected, actual);
  }

  private void assertEqualsTrimmed(String message, String expected, String actual) {
    assertEquals(message, expected.trim(), actual.trim());
  }
}
