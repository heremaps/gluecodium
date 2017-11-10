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

import static org.mockito.Mockito.when;

import com.here.ivi.api.generator.cbridge.CArrayGenerator;
import com.here.ivi.api.generator.cbridge.CArrayMapper;
import com.here.ivi.api.generator.cbridge.CppTypeInfo;
import com.here.ivi.api.model.cmodel.*;
import com.here.ivi.api.test.TemplateComparison;
import java.util.Collections;
import java.util.Map;
import org.franca.core.franca.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(FBasicTypeId.class)
public class CBridgeArrayTemplateTest {

  @Mock private FBasicTypeId francaBasic;
  @Mock private FTypeRef francaTypeRef;

  @Test
  public void generateSimpleArrayHeader() {
    CArrayGenerator cbridgeArrayGenerator = new CArrayGenerator();
    CppTypeInfo arrayType = getStringArray();
    Map<String, CArray> arrays =
        Collections.singletonMap(arrayType.functionReturnType.name, new CArray(arrayType));
    cbridgeArrayGenerator.collect(arrays);
    final String generated = cbridgeArrayGenerator.generate().get(0).content;
    final String expected =
        "#include \"cbridge/ArrayCollectionRef.h\"\n"
            + "#include \"cbridge/StringHandle.h\"\n"
            + "#include <stdint.h>\n"
            + "arrayCollection_String arrayCollection_String_create();\n"
            + "void arrayCollection_String_release(arrayCollection_String handle);\n"
            + "uint64_t arrayCollection_String_count(arrayCollection_String handle);\n"
            + "std_stringRef arrayCollection_String_get(arrayCollection_String handle, uint64_t index);\n"
            + "void arrayCollection_String_append(arrayCollection_String handle, const char* item);\n";

    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }

  @Test
  public void generateSimpleArrayImplementation() {
    CArrayGenerator cbridgeArrayGenerator = new CArrayGenerator();
    CppTypeInfo arrayType = getStringArray();
    Map<String, CArray> arrays =
        Collections.singletonMap(arrayType.functionReturnType.name, new CArray(arrayType));
    cbridgeArrayGenerator.collect(arrays);
    final String generated = cbridgeArrayGenerator.generate().get(1).content;
    final String expected =
        "#include \"cbridge/ArrayCollection.h\"\n"
            + "#include \"cbridge_internal/ArrayCollectionImpl.h\"\n"
            + "#include \"cbridge_internal/StringHandleImpl.h\"\n"
            + "#include <string>\n"
            + "#include <vector>\n"
            + "arrayCollection_String arrayCollection_String_create() {\n"
            + "    return { new std::vector<std::string>()};;\n"
            + "}\n"
            + "void arrayCollection_String_release(arrayCollection_String handle) {\n"
            + "    delete get_pointer(arrayCollection_String(handle));\n"
            + "}\n"
            + "uint64_t arrayCollection_String_count(arrayCollection_String handle) {\n"
            + "    return get_pointer(handle)->size();\n"
            + "}\n"
            + "std_stringRef arrayCollection_String_get(arrayCollection_String handle, uint64_t index) {\n"
            + "    return std_stringRef {\n"
            + "        new std::string {\n"
            + "            (*get_pointer(handle))[index]\n"
            + "        }\n"
            + "    };\n"
            + "}\n"
            + "void arrayCollection_String_append(arrayCollection_String handle, const char* item) {\n"
            + "    get_pointer(handle)->push_back(std::string(item));\n"
            + "}\n";

    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void generateSimpleArrayReferences() {
    CArrayGenerator cbridgeArrayGenerator = new CArrayGenerator();
    CppTypeInfo arrayType = getStringArray();
    Map<String, CArray> arrays =
        Collections.singletonMap(arrayType.functionReturnType.name, new CArray(arrayType));
    cbridgeArrayGenerator.collect(arrays);
    final String generated = cbridgeArrayGenerator.generate().get(2).content;
    final String expected =
        "#pragma once\n"
            + "#ifdef __cplusplus\n"
            + "extern \"C\" {\n"
            + "#endif\n"
            + "typedef struct {\n"
            + "    void* const private_pointer;\n"
            + "} arrayCollection_String;\n"
            + "#ifdef __cplusplus\n"
            + "}\n"
            + "#endif";

    TemplateComparison.assertEqualPrivateHeaderContent(expected, generated);
  }

  @Test
  public void generateSimpleArrayPrivateHeader() {
    CArrayGenerator cbridgeArrayGenerator = new CArrayGenerator();
    CppTypeInfo arrayType = getStringArray();
    Map<String, CArray> arrays =
        Collections.singletonMap(arrayType.functionReturnType.name, new CArray(arrayType));
    cbridgeArrayGenerator.collect(arrays);
    final String generated = cbridgeArrayGenerator.generate().get(3).content;
    final String expected =
        "#pragma once\n"
            + "#include \"cbridge_internal/ArrayCollectionImpl.h\"\n"
            + "#include \"cbridge_internal/StringHandleImpl.h\"\n"
            + "#include <string>\n"
            + "#include <vector>\n"
            + "inline std::vector<std::string>* get_pointer(arrayCollection_String handle) {\n"
            + "  return static_cast<std::vector<std::string>*>(handle.private_pointer);\n"
            + "}\n";

    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void generateNestedArrayHeader() {
    CArrayGenerator cbridgeArrayGenerator = new CArrayGenerator();
    CppTypeInfo arrayType = getNestedStringArray();
    Map<String, CArray> arrays =
        Collections.singletonMap(arrayType.functionReturnType.name, new CArray(arrayType));
    cbridgeArrayGenerator.collect(arrays);
    final String generated = cbridgeArrayGenerator.generate().get(0).content;
    final String expected =
        "#include \"cbridge/ArrayCollectionRef.h\"\n"
            + "#include \"cbridge/StringHandle.h\"\n"
            + "#include <stdint.h>\n"
            + "arrayCollection_NestedStringArray arrayCollection_NestedStringArray_create();\n"
            + "void arrayCollection_NestedStringArray_release(arrayCollection_NestedStringArray handle);\n"
            + "uint64_t arrayCollection_NestedStringArray_count(arrayCollection_NestedStringArray handle);\n"
            + "arrayCollection_String arrayCollection_NestedStringArray_get(arrayCollection_NestedStringArray handle, uint64_t index);\n"
            + "void arrayCollection_NestedStringArray_append(arrayCollection_NestedStringArray handle, arrayCollection_String item);\n";

    TemplateComparison.assertEqualHeaderContent(expected, generated);
  }

  @Test
  public void generateNestedArrayImplementation() {
    CArrayGenerator cbridgeArrayGenerator = new CArrayGenerator();
    CppTypeInfo arrayType = getNestedStringArray();
    Map<String, CArray> arrays =
        Collections.singletonMap(arrayType.functionReturnType.name, new CArray(arrayType));
    cbridgeArrayGenerator.collect(arrays);
    final String generated = cbridgeArrayGenerator.generate().get(1).content;
    final String expected =
        "#include \"cbridge/ArrayCollection.h\"\n"
            + "#include \"cbridge_internal/ArrayCollectionImpl.h\"\n"
            + "#include \"cbridge_internal/StringHandleImpl.h\"\n"
            + "#include <string>\n"
            + "#include <vector>\n"
            + "arrayCollection_NestedStringArray arrayCollection_NestedStringArray_create() {\n"
            + "    return { new std::vector<std::vector<std::string>>()};;\n"
            + "}\n"
            + "void arrayCollection_NestedStringArray_release(arrayCollection_NestedStringArray handle) {\n"
            + "    delete get_pointer(arrayCollection_NestedStringArray(handle));\n"
            + "}\n"
            + "uint64_t arrayCollection_NestedStringArray_count(arrayCollection_NestedStringArray handle) {\n"
            + "    return get_pointer(handle)->size();\n"
            + "}\n"
            + "arrayCollection_String arrayCollection_NestedStringArray_get(arrayCollection_NestedStringArray handle, uint64_t index) {\n"
            + "    return arrayCollection_String {\n"
            + "        new std::vector<std::string> {\n"
            + "            (*get_pointer(handle))[index]\n"
            + "        }\n"
            + "    };\n"
            + "}\n"
            + "void arrayCollection_NestedStringArray_append(arrayCollection_NestedStringArray handle, arrayCollection_String item) {\n"
            + "    get_pointer(handle)->push_back(*get_pointer(item));\n"
            + "}\n";

    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void generateNestedArrayReferences() {
    CArrayGenerator cbridgeArrayGenerator = new CArrayGenerator();
    CppTypeInfo arrayType = getNestedStringArray();
    Map<String, CArray> arrays =
        Collections.singletonMap(arrayType.functionReturnType.name, new CArray(arrayType));
    cbridgeArrayGenerator.collect(arrays);
    final String generated = cbridgeArrayGenerator.generate().get(2).content;
    final String expected =
        "#pragma once\n"
            + "#ifdef __cplusplus\n"
            + "extern \"C\" {\n"
            + "#endif\n"
            + "typedef struct {\n"
            + "    void* const private_pointer;\n"
            + "} arrayCollection_NestedStringArray;\n"
            + "#ifdef __cplusplus\n"
            + "}\n"
            + "#endif";

    TemplateComparison.assertEqualPrivateHeaderContent(expected, generated);
  }

  @Test
  public void generateNestedArrayPrivateHeader() {
    CArrayGenerator cbridgeArrayGenerator = new CArrayGenerator();
    CppTypeInfo arrayType = getNestedStringArray();
    Map<String, CArray> arrays =
        Collections.singletonMap(arrayType.functionReturnType.name, new CArray(arrayType));
    cbridgeArrayGenerator.collect(arrays);
    final String generated = cbridgeArrayGenerator.generate().get(3).content;
    final String expected =
        "#pragma once\n"
            + "#include \"cbridge_internal/ArrayCollectionImpl.h\"\n"
            + "#include \"cbridge_internal/StringHandleImpl.h\"\n"
            + "#include <string>\n"
            + "#include <vector>\n"
            + "inline std::vector<std::vector<std::string>>* get_pointer(arrayCollection_NestedStringArray handle) {\n"
            + "  return static_cast<std::vector<std::vector<std::string>>*>(handle.private_pointer);\n"
            + "}\n";

    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  private CppTypeInfo getStringArray() {
    CppTypeInfo arrayInnerType = CppTypeInfo.STRING;
    when(francaBasic.getName()).thenReturn("String");
    when(francaTypeRef.getPredefined()).thenReturn(francaBasic);
    return CArrayMapper.create(arrayInnerType, francaTypeRef);
  }

  private CppTypeInfo getNestedStringArray() {
    CppTypeInfo arrayInnerType = getStringArray();
    when(francaBasic.getName()).thenReturn("NestedString");
    when(francaTypeRef.getPredefined()).thenReturn(francaBasic);
    return CArrayMapper.create(arrayInnerType, francaTypeRef);
  }
}
