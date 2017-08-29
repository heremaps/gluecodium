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

import static junit.framework.Assert.assertEquals;

import com.here.ivi.api.model.swift.SwiftStruct;
import com.here.ivi.api.model.swift.SwiftStructField;
import com.here.ivi.api.model.swift.SwiftType;
import java.util.ArrayList;
import java.util.Collections;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
public class SwiftStructTemplateTest {

  @Test
  public void generateEmptyStruct() {
    SwiftStruct struct = new SwiftStruct("SomeStruct");
    String expected =
        "public struct SomeStruct {\n"
            + "\n"
            + "    public init() {\n"
            + "    }\n"
            + "\n"
            + "    internal init?(cStruct : SomeStructRef) {\n"
            + "    }\n"
            + "\n"
            + "    internal func convertToCType() -> SomeStructRef {\n"
            + "        let result = hello_test_SomeStruct_create()\n"
            + "        fillFunction(result)\n"
            + "        return result\n"
            + "    }\n"
            + "}";
    struct.cPrefix = "hello_test_SomeStruct";
    struct.cType = "SomeStructRef";
    String actual = SwiftStructTemplate.generate(struct);
    assertEquals("it should generate empty structs", expected, actual);
  }

  @Test
  public void generateBasicStruct() {
    SwiftStruct struct = new SwiftStruct("BasicStruct");
    struct.fields =
        Collections.singletonList(new SwiftStructField("counter", new SwiftType("Integer")));
    struct.cPrefix = "hello_HelloWorldPlainDataStructures_GeoCoordinate";
    struct.cType = "GeoCoordinateRef";
    String expected =
        "public struct BasicStruct {\n"
            + "    public var counter: Integer\n"
            + "\n"
            + "    public init(counter : Integer) {\n"
            + "    self.counter = counter\n"
            + "    }\n"
            + "\n"
            + "    internal init?(cStruct : GeoCoordinateRef) {\n"
            + "    counter = hello_HelloWorldPlainDataStructures_GeoCoordinate_counter_get(cStruct)\n"
            + "    }\n"
            + "\n"
            + "    internal func convertToCType() -> GeoCoordinateRef {\n"
            + "        let result = hello_HelloWorldPlainDataStructures_GeoCoordinate_create()\n"
            + "        fillFunction(result)\n"
            + "        return result\n"
            + "    }\n"
            + "}";
    String actual = SwiftStructTemplate.generate(struct);
    assertEquals("it should generate a struct for integer", expected, actual);
  }

  @Test
  public void generateStructWithThreeFields() {
    SwiftStruct struct = new SwiftStruct("GeoCoordinate");
    struct.fields = new ArrayList<>();
    struct.fields.add(new SwiftStructField("latitude", new SwiftType("Double")));
    struct.fields.add(new SwiftStructField("longitude", new SwiftType("Double")));
    struct.fields.add(new SwiftStructField("altitude", new SwiftType("Double")));
    struct.cPrefix = "hello_HelloWorldPlainDataStructures_GeoCoordinate";
    struct.cType = "GeoCoordinateRef";
    String expected =
        "public struct GeoCoordinate {\n"
            + "    public var latitude: Double\n"
            + "    public var longitude: Double\n"
            + "    public var altitude: Double\n"
            + "\n"
            + "    public init(latitude : Double, longitude : Double, altitude : Double) {\n"
            + "    self.latitude = latitude\n"
            + "    self.longitude = longitude\n"
            + "    self.altitude = altitude\n"
            + "    }\n"
            + "\n"
            + "    internal init?(cStruct : GeoCoordinateRef) {\n"
            + "    latitude = hello_HelloWorldPlainDataStructures_GeoCoordinate_latitude_get(cStruct)\n"
            + "    longitude = hello_HelloWorldPlainDataStructures_GeoCoordinate_longitude_get(cStruct)\n"
            + "    altitude = hello_HelloWorldPlainDataStructures_GeoCoordinate_altitude_get(cStruct)\n"
            + "    }\n"
            + "\n"
            + "    internal func convertToCType() -> GeoCoordinateRef {\n"
            + "        let result = hello_HelloWorldPlainDataStructures_GeoCoordinate_create()\n"
            + "        fillFunction(result)\n"
            + "        return result\n"
            + "    }\n"
            + "}";
    String actual = SwiftStructTemplate.generate(struct);
    assertEquals("it should generate a struct with two fields", expected, actual);
  }
}
