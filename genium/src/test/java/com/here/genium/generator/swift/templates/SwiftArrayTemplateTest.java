/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.generator.swift.templates;

import static java.util.Collections.singletonList;
import static org.powermock.api.mockito.PowerMockito.when;

import com.here.genium.generator.swift.SwiftArrayGenerator;
import com.here.genium.generator.swift.SwiftArrayMapper;
import com.here.genium.model.swift.*;
import com.here.genium.model.swift.SwiftType.TypeCategory;
import com.here.genium.test.TemplateComparator;
import com.here.genium.test.TemplateComparison;
import java.util.Collections;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FTypeRef;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(FBasicTypeId.class)
public class SwiftArrayTemplateTest {

  @Mock private FBasicTypeId francaBasic;
  @Mock private FTypeRef francaTypeRef;

  @Test
  public void simpleArrayGeneration() {
    SwiftArrayGenerator swiftArrayGenerator = new SwiftArrayGenerator();
    SwiftArray arrayType = getStringArray();
    swiftArrayGenerator.collect(Collections.singletonMap(arrayType.underlyingType.name, arrayType));
    final String expected =
        "import Foundation\n"
            + "internal class StringList: CollectionOf<String> {\n"
            + "    let c_element: _baseRef\n"
            + "    init(_ c_element: _baseRef) {\n"
            + "        self.c_element = c_element\n"
            + "        super.init(nil)\n"
            + "        self.startIndex = 0\n"
            + "        self.endIndex = Int(arrayCollection_String_count(c_element))\n"
            + "    }\n"
            + "    deinit {\n"
            + "        arrayCollection_String_release(c_element)\n"
            + "    }\n"
            + "    public override subscript(index: Int) -> String {\n"
            + "        let handle = arrayCollection_String_get(c_element, UInt64(index))\n"
            + "        defer {\n"
            + "            std_string_release(handle)\n"
            + "        }\n"
            + "        return String(data: Data(bytes: std_string_data_get(handle),\n"
            + "                      count: Int(std_string_size_get(handle))), encoding: .utf8)!\n"
            + "    }\n"
            + "}\n"
            + "extension Collection where Element == String  {\n"
            + "    public func c_conversion()-> (c_type: _baseRef, cleanup: () ->Void) {\n"
            + "        let handle = arrayCollection_String_create()\n"
            + "        for item in self {\n"
            + "            arrayCollection_String_append(handle, item)\n"
            + "        }\n"
            + "        let cleanup_function = { () -> Void in\n"
            + "            arrayCollection_String_release(handle)\n"
            + "        }\n"
            + "        return (handle, cleanup_function)\n"
            + "    }\n"
            + "}\n";
    final String generated = swiftArrayGenerator.generate().get(0).content;
    TemplateComparison.assertEqualContent(expected, generated);
  }

  @Test
  public void nestedArrayGeneration() {
    SwiftArrayGenerator swiftArrayGenerator = new SwiftArrayGenerator();
    SwiftArray arrayType = getNestedStringArray();
    swiftArrayGenerator.collect(Collections.singletonMap(arrayType.underlyingType.name, arrayType));
    final String expected =
        "import Foundation\n"
            + "internal class StringListList: CollectionOf<CollectionOf<String>> {\n"
            + "    let c_element: _baseRef\n"
            + "    init(_ c_element: _baseRef) {\n"
            + "        self.c_element = c_element\n"
            + "        super.init(nil)\n"
            + "        self.startIndex = 0\n"
            + "        self.endIndex = Int(arrayCollection_NestedStringArray_count(c_element))\n"
            + "    }\n"
            + "    deinit {\n"
            + "        arrayCollection_NestedStringArray_release(c_element)\n"
            + "    }\n"
            + "    public override subscript(index: Int) -> CollectionOf<String> {\n"
            + "        let handle = arrayCollection_NestedStringArray_get(c_element, UInt64(index))\n"
            + "        return StringList(handle)\n"
            + "    }\n"
            + "}\n"
            + "extension Collection where Element: Collection, Element.Element == String  {\n"
            + "    public func c_conversion()-> (c_type: _baseRef, cleanup: () ->Void) {\n"
            + "        let handle = arrayCollection_NestedStringArray_create()\n"
            + "        for item in self {\n"
            + "            let conversion = item.c_conversion()\n"
            + "            arrayCollection_NestedStringArray_append(handle, conversion.c_type)\n"
            + "            conversion.cleanup()\n"
            + "        }\n"
            + "        let cleanup_function = { () -> Void in\n"
            + "            arrayCollection_NestedStringArray_release(handle)\n"
            + "        }\n"
            + "        return (handle, cleanup_function)\n"
            + "    }\n"
            + "}\n";
    final String generated = swiftArrayGenerator.generate().get(0).content;
    TemplateComparison.assertEqualContent(expected, generated);
  }

  @Test
  public void enumsArrayGeneration() {
    SwiftArrayGenerator swiftArrayGenerator = new SwiftArrayGenerator();
    SwiftArray arrayType = getEnumArray();
    swiftArrayGenerator.collect(Collections.singletonMap(arrayType.underlyingType.name, arrayType));
    final String expected =
        "import Foundation\n"
            + "internal class : CollectionOf<EnumSwift> {\n"
            + "    let c_element: _baseRef\n"
            + "    init(_ c_element: _baseRef) {\n"
            + "        self.c_element = c_element\n"
            + "        super.init(nil)\n"
            + "        self.startIndex = 0\n"
            + "        self.endIndex = Int(arrayCollection_Enums_count(c_element))\n"
            + "    }\n"
            + "    deinit {\n"
            + "        arrayCollection_Enums_release(c_element)\n"
            + "    }\n"
            + "    public override subscript(index: Int) -> EnumSwift {\n"
            + "        let handle = arrayCollection_Enums_get(c_element, UInt64(index))\n"
            + "        return EnumSwift(rawValue: handle)!\n"
            + "    }\n"
            + "}\n"
            + "extension Collection where Element == EnumSwift  {\n"
            + "    public func c_conversion()-> (c_type: _baseRef, cleanup: () ->Void) {\n"
            + "        let handle = arrayCollection_Enums_create()\n"
            + "        for item in self {\n"
            + "            arrayCollection_Enums_append(handle, item.rawValue)\n"
            + "        }\n"
            + "        let cleanup_function = { () -> Void in\n"
            + "            arrayCollection_Enums_release(handle)\n"
            + "        }\n"
            + "        return (handle, cleanup_function)\n"
            + "    }\n"
            + "}\n";
    final String generated = swiftArrayGenerator.generate().get(0).content;
    TemplateComparison.assertEqualContent(expected, generated);
  }

  @Test
  public void protocolArrayGeneration() {
    SwiftArrayGenerator swiftArrayGenerator = new SwiftArrayGenerator();
    SwiftArray arrayType =
        new SwiftArray(
            SwiftContainerType.builder("SomeType")
                .implementingClass("_SomeType")
                .category(TypeCategory.CLASS)
                .build(),
            null,
            "cBridgeFunction");
    swiftArrayGenerator.collect(Collections.singletonMap(arrayType.underlyingType.name, arrayType));

    TemplateComparator.expect(
            "    public override subscript(index: Int) -> SomeType {\n"
                + "        let handle = cBridgeFunction_get(c_element, UInt64(index))\n"
                + "        guard let result = _SomeType(cSomeType: handle) else {\n"
                + "            fatalError(\"Nullptr entries for arrays of SomeType are not supported\")\n"
                + "        }\n"
                + "        return result\n"
                + "    }\n")
        .expect(
            "    public func c_conversion()-> (c_type: _baseRef, cleanup: () ->Void) {\n"
                + "        let handle = cBridgeFunction_create()\n"
                + "        for item in self {\n"
                + "            cBridgeFunction_append(handle, getRef(item).ref)\n"
                + "        }\n"
                + "        let cleanup_function = { () -> Void in\n"
                + "            cBridgeFunction_release(handle)\n"
                + "        }\n"
                + "        return (handle, cleanup_function)\n"
                + "    }\n")
        .build()
        .assertMatches(swiftArrayGenerator.generate().get(0).content);
  }

  @Test
  public void classArrayGeneration() {
    SwiftArrayGenerator swiftArrayGenerator = new SwiftArrayGenerator();
    SwiftArray arrayType =
        new SwiftArray(
            SwiftContainerType.builder("SomeType")
                .implementingClass("SomeType")
                .category(TypeCategory.CLASS)
                .build(),
            null,
            "cBridgeFunction");
    swiftArrayGenerator.collect(Collections.singletonMap(arrayType.underlyingType.name, arrayType));

    TemplateComparator.expect("        guard let result = SomeType(cSomeType: handle) else {\n")
        .expect("            cBridgeFunction_append(handle, getRef(item).ref)\n")
        .build()
        .assertMatches(swiftArrayGenerator.generate().get(0).content);
  }

  private SwiftArray getStringArray() {
    SwiftType arrayInnerType = SwiftType.STRING;
    when(francaBasic.getName()).thenReturn("String");
    when(francaTypeRef.getPredefined()).thenReturn(francaBasic);
    return SwiftArrayMapper.create(arrayInnerType, francaTypeRef);
  }

  private SwiftArray getNestedStringArray() {
    SwiftArray arrayInnerType = getStringArray();
    when(francaBasic.getName()).thenReturn("NestedString");
    when(francaTypeRef.getPredefined()).thenReturn(francaBasic);
    return SwiftArrayMapper.create(arrayInnerType, francaTypeRef);
  }

  private SwiftArray getEnumArray() {
    SwiftEnumItem enumItem =
        SwiftEnumItem.builder("ItemName").value(new SwiftValue("VALUE")).build();
    SwiftEnum swiftEnum = SwiftEnum.builder("EnumSwift").items(singletonList(enumItem)).build();
    return new SwiftArray(swiftEnum, null, "arrayCollection_Enums");
  }
}
