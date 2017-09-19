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

import static java.util.Collections.singletonList;
import static junit.framework.Assert.assertEquals;

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.swift.SwiftContainerType;
import com.here.ivi.api.model.swift.SwiftField;
import com.here.ivi.api.model.swift.SwiftType;
import java.util.ArrayList;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
public class SwiftStructTemplateTest {

  private static String generate(SwiftContainerType struct) {
    return TemplateEngine.render("swift/Struct", struct);
  }

  @Test
  public void generateEmptyStruct() {
    SwiftContainerType struct = new SwiftContainerType("SomeStruct");
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
            + "        let result = hello_test_SomeStruct_create()\n"
            + "        fillFunction(result)\n"
            + "        return result\n"
            + "    }\n"
            + "\n"
            + "    internal func fillFunction(_ cSomeStruct: SomeStructRef) -> Void {\n"
            + "    }\n"
            + "}";
    struct.cPrefix = "hello_test_SomeStruct";
    struct.cType = "SomeStructRef";
    String actual = generate(struct);
    assertEqualsTrimmed("it should generate empty structs", expected, actual);
  }

  @Test
  public void generateBasicStruct() {
    SwiftContainerType struct = new SwiftContainerType("BasicStruct");
    struct.fields = singletonList(new SwiftField("counter", new SwiftType("Integer")));
    struct.cPrefix = "hello_HelloWorldPlainDataStructures_GeoCoordinate";
    struct.cType = "GeoCoordinateRef";
    String expected =
        "public struct BasicStruct {\n"
            + "    public var counter: Integer\n"
            + "\n"
            + "    public init(counter: Integer) {\n"
            + "        self.counter = counter\n"
            + "    }\n"
            + "\n"
            + "    internal init?(cBasicStruct: GeoCoordinateRef) {\n"
            + "        counter = hello_HelloWorldPlainDataStructures_GeoCoordinate_counter_get(cBasicStruct)\n"
            + "    }\n"
            + "\n"
            + "    internal func convertToCType() -> GeoCoordinateRef {\n"
            + "        let result = hello_HelloWorldPlainDataStructures_GeoCoordinate_create()\n"
            + "        fillFunction(result)\n"
            + "        return result\n"
            + "    }\n"
            + "\n"
            + "    internal func fillFunction(_ cBasicStruct: GeoCoordinateRef) -> Void {\n"
            + "        hello_HelloWorldPlainDataStructures_GeoCoordinate_counter_set(cBasicStruct, counter)\n"
            + "    }\n"
            + "}";
    String actual = generate(struct);
    assertEqualsTrimmed("it should generate a struct for integer", expected, actual);
  }

  @Test
  public void generateStructWithThreeFields() {
    SwiftContainerType struct = new SwiftContainerType("GeoCoordinate");
    struct.fields = new ArrayList<>();
    struct.fields.add(new SwiftField("latitude", new SwiftType("Double")));
    struct.fields.add(new SwiftField("longitude", new SwiftType("Double")));
    struct.fields.add(new SwiftField("altitude", new SwiftType("Double")));
    struct.cPrefix = "hello_HelloWorldPlainDataStructures_GeoCoordinate";
    struct.cType = "GeoCoordinateRef";
    String expected =
        "public struct GeoCoordinate {\n"
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
            + "    internal init?(cGeoCoordinate: GeoCoordinateRef) {\n"
            + "        latitude = hello_HelloWorldPlainDataStructures_GeoCoordinate_latitude_get(cGeoCoordinate)\n"
            + "        longitude = hello_HelloWorldPlainDataStructures_GeoCoordinate_longitude_get(cGeoCoordinate)\n"
            + "        altitude = hello_HelloWorldPlainDataStructures_GeoCoordinate_altitude_get(cGeoCoordinate)\n"
            + "    }\n"
            + "\n"
            + "    internal func convertToCType() -> GeoCoordinateRef {\n"
            + "        let result = hello_HelloWorldPlainDataStructures_GeoCoordinate_create()\n"
            + "        fillFunction(result)\n"
            + "        return result\n"
            + "    }\n"
            + "\n"
            + "    internal func fillFunction(_ cGeoCoordinate: GeoCoordinateRef) -> Void {\n"
            + "        hello_HelloWorldPlainDataStructures_GeoCoordinate_latitude_set(cGeoCoordinate, latitude)\n"
            + "        hello_HelloWorldPlainDataStructures_GeoCoordinate_longitude_set(cGeoCoordinate, longitude)\n"
            + "        hello_HelloWorldPlainDataStructures_GeoCoordinate_altitude_set(cGeoCoordinate, altitude)\n"
            + "    }\n"
            + "}";
    String actual = generate(struct);
    assertEqualsTrimmed("it should generate a struct with two fields", expected, actual);
  }

  @Test
  public void generateStructWithStringField() {
    SwiftContainerType struct = new SwiftContainerType("SomeStruct");
    struct.fields =
        singletonList(
            new SwiftField("name", new SwiftType("String", SwiftType.TypeCategory.BUILTIN_STRING)));
    struct.cPrefix = "C_PREFIX";
    struct.cType = "SomeStructRef";
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
    String actual = generate(struct);
    assertEqualsTrimmed("it should generate a struct with field of type String", expected, actual);
  }

  @Test
  public void generateStructWithDataField() {
    SwiftContainerType struct = new SwiftContainerType("SomeStruct");
    struct.fields =
        singletonList(
            new SwiftField(
                "icon", new SwiftType("Data", SwiftType.TypeCategory.BUILTIN_BYTEBUFFER)));
    struct.cPrefix = "C_PREFIX";
    struct.cType = "SomeStructRef";
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
            + "            let iconHandle = C_PREFIX_icon_get(cSomeStruct)\n"
            + "            guard\n"
            + "                let dataHandle = byteArray_data_get(iconHandle)\n"
            + "            else {\n"
            + "                return nil\n"
            + "            }\n"
            + "            icon = Data(bytes: dataHandle, count: Int(byteArray_size_get(iconHandle)))\n"
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
    String actual = generate(struct);
    assertEqualsTrimmed("it should generate a struct with field of type String", expected, actual);
  }

  @Test
  public void generateStructWithStructField() {
    SwiftContainerType struct = new SwiftContainerType("SomeStruct");
    struct.fields = singletonList(new SwiftField("nested", new SwiftContainerType("NestedStruct")));
    struct.cPrefix = "C_PREFIX";
    struct.cType = "SomeStructRef";
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
    String actual = generate(struct);
    assertEqualsTrimmed("it should generate a struct with field of type String", expected, actual);
  }

  private void assertEqualsTrimmed(String message, String expected, String actual) {
    assertEquals(message, expected.trim(), actual.trim());
  }
}
