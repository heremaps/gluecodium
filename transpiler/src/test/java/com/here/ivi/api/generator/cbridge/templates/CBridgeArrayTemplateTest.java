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

package com.here.ivi.api.generator.cbridge.templates;

import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.when;

import com.here.ivi.api.generator.cbridge.CArrayGenerator;
import com.here.ivi.api.generator.cbridge.CArrayMapper;
import com.here.ivi.api.generator.cbridge.CppArrayTypeInfo;
import com.here.ivi.api.generator.cbridge.CppTypeInfo;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.model.cbridge.*;
import com.here.ivi.api.test.TemplateComparison;
import java.util.*;
import org.franca.core.franca.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(FBasicTypeId.class)
public final class CBridgeArrayTemplateTest {

  @Mock private FBasicTypeId francaBasic;
  @Mock private FTypeRef francaTypeRef;

  @Test
  public void generateSimpleArrayHeader() {
    String arrayName = "arrayCollection_String";
    Map<String, CArray> arrays =
        Collections.singletonMap(arrayName, new CArray(arrayName, getStringArray()));
    final String generated = generateFileContent(arrays, CArrayGenerator.CBRIDGE_ARRAY_HEADER);
    final String expected =
        "#include \"cbridge/include/StringHandle.h\"\n"
            + "#include <stdint.h>\n"
            + "_baseRef arrayCollection_String_create();\n"
            + "void arrayCollection_String_release(_baseRef handle);\n"
            + "uint64_t arrayCollection_String_count(_baseRef handle);\n"
            + "_baseRef arrayCollection_String_get(_baseRef handle, uint64_t index);\n"
            + "void arrayCollection_String_append(_baseRef handle, const char* item);\n";

    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }

  @Test
  public void generateSimpleArrayImplementation() {
    String arrayName = "arrayCollection_String";
    Map<String, CArray> arrays =
        Collections.singletonMap(arrayName, new CArray(arrayName, getStringArray()));
    final String generated = generateFileContent(arrays, CArrayGenerator.CBRIDGE_ARRAY_IMPL);
    final String expected =
        "#include \"cbridge/include/ArrayCollection.h\"\n"
            + "#include \"cbridge/include/StringHandle.h\"\n"
            + "#include \"cbridge_internal/include/BaseHandleImpl.h\"\n"
            + "#include <new>\n"
            + "#include <string>\n"
            + "#include <vector>\n"
            + "_baseRef arrayCollection_String_create() {\n"
            + "    return reinterpret_cast<_baseRef>( new std::vector<std::string>() );\n"
            + "}\n"
            + "void arrayCollection_String_release(_baseRef handle) {\n"
            + "    delete get_pointer<std::vector<std::string>>(handle);\n"
            + "}\n"
            + "uint64_t arrayCollection_String_count(_baseRef handle) {\n"
            + "    return get_pointer<std::vector<std::string>>(handle)->size();\n"
            + "}\n"
            + "_baseRef arrayCollection_String_get(_baseRef handle, uint64_t index) {\n"
            + "    return reinterpret_cast<_baseRef>(\n"
            + "        new std::string {\n"
            + "            (*get_pointer<std::vector<std::string>>(handle))[index]\n"
            + "        }\n"
            + "    );\n"
            + "}\n"
            + "void arrayCollection_String_append(_baseRef handle, const char* item) {\n"
            + "    get_pointer<std::vector<std::string>>(handle)->push_back(std::string(item));\n"
            + "}\n";

    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void generateNestedArrayHeader() {
    String arrayName = "arrayCollection_NestedStringArray";
    Map<String, CArray> arrays =
        Collections.singletonMap(arrayName, new CArray(arrayName, getNestedStringArray()));
    final String generated = generateFileContent(arrays, CArrayGenerator.CBRIDGE_ARRAY_HEADER);
    final String expected =
        "#include \"cbridge/include/StringHandle.h\"\n"
            + "#include <stdint.h>\n"
            + "_baseRef arrayCollection_NestedStringArray_create();\n"
            + "void arrayCollection_NestedStringArray_release(_baseRef handle);\n"
            + "uint64_t arrayCollection_NestedStringArray_count(_baseRef handle);\n"
            + "_baseRef arrayCollection_NestedStringArray_get(_baseRef handle, uint64_t index);\n"
            + "void arrayCollection_NestedStringArray_append(_baseRef handle, _baseRef item);\n";

    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }

  @Test
  public void generateNestedArrayImplementation() {
    String arrayName = "arrayCollection_NestedStringArray";
    Map<String, CArray> arrays =
        Collections.singletonMap(arrayName, new CArray(arrayName, getNestedStringArray()));
    final String generated = generateFileContent(arrays, CArrayGenerator.CBRIDGE_ARRAY_IMPL);
    final String expected =
        "#include \"cbridge/include/ArrayCollection.h\"\n"
            + "#include \"cbridge/include/StringHandle.h\"\n"
            + "#include \"cbridge_internal/include/BaseHandleImpl.h\"\n"
            + "#include <new>\n"
            + "#include <string>\n"
            + "#include <vector>\n"
            + "_baseRef arrayCollection_NestedStringArray_create() {\n"
            + "    return reinterpret_cast<_baseRef>( new std::vector<std::vector<std::string>>() );\n"
            + "}\n"
            + "void arrayCollection_NestedStringArray_release(_baseRef handle) {\n"
            + "    delete get_pointer<std::vector<std::vector<std::string>>>(handle);\n"
            + "}\n"
            + "uint64_t arrayCollection_NestedStringArray_count(_baseRef handle) {\n"
            + "    return get_pointer<std::vector<std::vector<std::string>>>(handle)->size();\n"
            + "}\n"
            + "_baseRef arrayCollection_NestedStringArray_get(_baseRef handle, uint64_t index) {\n"
            + "    return reinterpret_cast<_baseRef>(\n"
            + "        new std::vector<std::string> {\n"
            + "            (*get_pointer<std::vector<std::vector<std::string>>>(handle))[index]\n"
            + "        }\n"
            + "    );\n"
            + "}\n"
            + "void arrayCollection_NestedStringArray_append(_baseRef handle, _baseRef item) {\n"
            + "    get_pointer<std::vector<std::vector<std::string>>>(handle)->push_back(*get_pointer<std::vector<std::string>>(item));\n"
            + "}\n";

    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void generateEnumArrayImplementation() {
    String arrayName = "arrayCollection_Enums";
    Map<String, CArray> arrays =
        Collections.singletonMap(arrayName, new CArray(arrayName, getEnumArray()));
    final String generated = generateFileContent(arrays, CArrayGenerator.CBRIDGE_ARRAY_IMPL);
    final String expected =
        "#include \"cbridge/include/ArrayCollection.h\"\n"
            + "#include \"cbridge_internal/include/BaseHandleImpl.h\"\n"
            + "#include <vector>\n"
            + "_baseRef arrayCollection_Enums_create() {\n"
            + "    return reinterpret_cast<_baseRef>( new std::vector<EnumType>() );\n"
            + "}\n"
            + "void arrayCollection_Enums_release(_baseRef handle) {\n"
            + "    delete get_pointer<std::vector<EnumType>>(handle);\n"
            + "}\n"
            + "uint64_t arrayCollection_Enums_count(_baseRef handle) {\n"
            + "    return get_pointer<std::vector<EnumType>>(handle)->size();\n"
            + "}\n"
            + "EnumType arrayCollection_Enums_get(_baseRef handle, uint64_t index) {\n"
            + "    return static_cast<EnumType>((*get_pointer<std::vector<EnumType>>(handle))[index]);\n"
            + "}\n"
            + "void arrayCollection_Enums_append(_baseRef handle, EnumType item) {\n"
            + "    get_pointer<std::vector<EnumType>>(handle)->push_back(static_cast<EnumType>(item));\n"
            + "}\n";

    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  private String generateFileContent(Map<String, CArray> arrays, String filename) {
    CArrayGenerator cbridgeArrayGenerator = new CArrayGenerator();
    cbridgeArrayGenerator.collect(arrays);
    List<GeneratedFile> generatedFiles = cbridgeArrayGenerator.generate();
    Optional<GeneratedFile> file =
        generatedFiles
            .stream()
            .filter(f -> Objects.equals(f.targetFile.getPath(), filename))
            .findAny();
    assertTrue(file.isPresent());
    return file.get().content;
  }

  private CppArrayTypeInfo getStringArray() {
    CppTypeInfo arrayInnerType = CppTypeInfo.STRING;
    when(francaBasic.getName()).thenReturn("String");
    when(francaTypeRef.getPredefined()).thenReturn(francaBasic);
    return CArrayMapper.createArrayReference(arrayInnerType);
  }

  private CppArrayTypeInfo getNestedStringArray() {
    CppTypeInfo arrayInnerType = getStringArray();
    when(francaBasic.getName()).thenReturn("NestedString");
    when(francaTypeRef.getPredefined()).thenReturn(francaBasic);
    return CArrayMapper.createArrayReference(arrayInnerType);
  }

  private CppArrayTypeInfo getEnumArray() {
    CppTypeInfo arrayInnerType =
        new CppTypeInfo(new CType("EnumType"), CppTypeInfo.TypeCategory.ENUM);
    when(francaBasic.getName()).thenReturn("Enums");
    when(francaTypeRef.getPredefined()).thenReturn(francaBasic);
    return CArrayMapper.createArrayReference(arrayInnerType);
  }
}
