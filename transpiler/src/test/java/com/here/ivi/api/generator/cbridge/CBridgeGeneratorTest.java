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

package com.here.ivi.api.generator.cbridge;

import static com.here.ivi.api.test.TemplateComparison.assertEqualHeaderContent;
import static com.here.ivi.api.test.TemplateComparison.assertEqualImplementationContent;
import static com.here.ivi.api.test.TemplateComparison.assertEqualPrivateHeaderContent;
import static java.util.Arrays.asList;
import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.model.cmodel.CInterface;
import com.here.ivi.api.model.cmodel.IncludeResolver;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.test.ArrayEList;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeRef;
import org.junit.Before;
import org.junit.Test;
import org.mockito.Answers;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

public class CBridgeGeneratorTest {

  private static final List<String> PACKAGES = asList("cbridge", "test");
  private static final String INTERFACE_NAME = "TestInterface";
  private static final String FUNCTION_NAME = "functionName";
  private static final String PRIVATE_HEADER_NAME = "CBRIDGE_PRIVATE_HEADER of TestInterface";
  private static final String PRIVATE_HEADER_INCLUDE = "#include \"" + PRIVATE_HEADER_NAME + "\"\n";
  private static final String PUBLIC_HEADER_NAME = "CBRIDGE_PUBLIC_HEADER of TestInterface";
  private static final String CBRIDGE_HEADER_INCLUDE = "#include \"" + PUBLIC_HEADER_NAME + "\"\n";
  private static final String BASEAPI_HEADER_INCLUDE =
      "#include \"BASE_API_HEADER of TestInterface\"\n";

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private Interface anInterface;

  @Mock private FModel francaModel;
  @Mock private FInterface francaInterface;

  @Mock private FMethod francaMethod;
  @Mock private FArgument francaArgument1;
  @Mock private FTypeRef francaTypeRef1;
  @Mock private FArgument francaArgument2;
  @Mock private FTypeRef francaTypeRef2;

  @Mock private IncludeResolver resolver;
  @Mock private CBridgeNameRules nameRules;
  private final ArrayEList<FType> structs = new ArrayEList<>();
  private final ArrayEList<FMethod> methods = new ArrayEList<>();
  private final ArrayEList<FArgument> inputArguments = new ArrayEList<>();
  private final ArrayEList<FArgument> outputArguments = new ArrayEList<>();

  private CBridgeGenerator generator;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(anInterface.isStatic(any())).thenReturn(true);
    when(anInterface.getPackageNames()).thenReturn(PACKAGES);
    when(anInterface.getName()).thenReturn(INTERFACE_NAME);
    when(anInterface.getFrancaInterface()).thenReturn(francaInterface);
    when(anInterface.getFrancaTypeCollection()).thenReturn(francaInterface);

    when(francaInterface.getName()).thenReturn(INTERFACE_NAME);
    when(francaInterface.getMethods()).thenReturn(methods);
    when(francaInterface.eContainer()).thenReturn(francaModel);
    when(francaInterface.getTypes()).thenReturn(structs);
    when(francaMethod.getName()).thenReturn(FUNCTION_NAME);
    when(francaMethod.getInArgs()).thenReturn(inputArguments);
    when(francaMethod.getOutArgs()).thenReturn(outputArguments);
    when(francaMethod.eContainer()).thenReturn(francaInterface);
    methods.add(francaMethod);

    when(francaModel.getName()).thenReturn(String.join(".", PACKAGES));
    when(resolver.resolveInclude(any(), any()))
        .then(
            invocation -> {
              IncludeResolver.HeaderType type =
                  (IncludeResolver.HeaderType) (invocation.getArguments()[1]);
              return Include.createInternalInclude(type.toString() + " of " + INTERFACE_NAME);
            });

    generator = new CBridgeGenerator(resolver, nameRules);

    when(nameRules.getPrivateHeaderFileNameWithPath(any())).thenReturn(PRIVATE_HEADER_NAME);
    when(nameRules.getHeaderFileNameWithPath(any(FrancaElement.class)))
        .thenReturn(PUBLIC_HEADER_NAME);
    when(nameRules.getImplementationFileNameWithPath(any())).thenReturn("");
  }

  @Test
  public void generatesHeaderAndImplementation() {
    List<GeneratedFile> files = generator.generate(anInterface);

    assertEquals("Should generate header and implementation file", 2, files.size());
  }

  @Test
  public void instantiableClassesAreGenerated() {
    when(anInterface.isStatic(any())).thenReturn(false);

    String expectedHeader =
        "typedef struct {\n"
            + "    void* const private_pointer;\n"
            + "} cbridge_test_TestInterfaceRef\n"
            + "void cbridge_test_TestInterface_release(cbridge_test_TestInterfaceRef handle);\n"
            + "\n"
            + "typedef struct {\n"
            + "    void* swift_pointer;\n"
            + "    void(*release)(void* swift_pointer);\n"
            + "    void(*cbridge_test_TestInterface_functionName)(cbridge_test_TestInterfaceRef _instance);\n"
            + "} cbridge_test_TestInterface_FunctionTable;\n"
            + "void cbridge_test_TestInterface_functionName(cbridge_test_TestInterfaceRef _instance);\n";
    String expectedImplementation =
        String.join(
            "\n",
            BASEAPI_HEADER_INCLUDE,
            CBRIDGE_HEADER_INCLUDE,
            "void cbridge_test_TestInterface_functionName(cbridge_test_TestInterfaceRef _instance) {\n"
                + "    return get_pointer(_instance)->get()->functionName();\n"
                + "}\n");
    String expectedPrivateHeader =
        "#pragma once\n"
            + "inline std::shared_ptr<cbridge::test::TestInterface>* get_pointer(cbridge_test_TestInterfaceRef handle) {\n"
            + "    return static_cast<std::shared_ptr<cbridge::test::TestInterface>*>(handle.private_pointer);\n"
            + "}\n";

    CInterface cModel = generator.buildCBridgeModel(anInterface);

    assertContentAsExpected(cModel, expectedHeader, expectedImplementation, expectedPrivateHeader);
  }

  @Test
  public void createFunctionWithoutArguments() throws IOException {

    String expectedHeader =
        String.join(
            "\n",
            "typedef struct {",
            "    void* swift_pointer;",
            "    void(*release)(void* swift_pointer);",
            "    void(*cbridge_test_TestInterface_functionName)();",
            "} cbridge_test_TestInterface_FunctionTable;",
            "void cbridge_test_TestInterface_functionName();",
            "");

    String expectedImplementation =
        String.join(
            "\n",
            BASEAPI_HEADER_INCLUDE,
            CBRIDGE_HEADER_INCLUDE,
            "void cbridge_test_TestInterface_functionName() {",
            "    return cbridge::test::TestInterface::functionName();",
            "}",
            "");

    CInterface cModel = generator.buildCBridgeModel(anInterface);

    assertContentAsExpected(cModel, expectedHeader, expectedImplementation);
  }

  @Test
  public void createFunctionTakingString() throws IOException {
    when(francaArgument1.getName()).thenReturn("input");
    when(francaArgument1.getType()).thenReturn(francaTypeRef1);
    when(francaTypeRef1.getPredefined()).thenReturn(FBasicTypeId.STRING);
    inputArguments.add(francaArgument1);

    String expectedHeader =
        String.join(
            "\n",
            "typedef struct {",
            "    void* swift_pointer;",
            "    void(*release)(void* swift_pointer);",
            "    void(*cbridge_test_TestInterface_functionName)(const char* input);",
            "} cbridge_test_TestInterface_FunctionTable;",
            "void cbridge_test_TestInterface_functionName(const char* input);",
            "");

    String expectedImplementation =
        String.join(
            "\n",
            "#include <string>",
            BASEAPI_HEADER_INCLUDE,
            CBRIDGE_HEADER_INCLUDE,
            "void cbridge_test_TestInterface_functionName(const char* input) {",
            "    return cbridge::test::TestInterface::functionName(std::string(input));",
            "}",
            "");

    CInterface cModel = generator.buildCBridgeModel(anInterface);

    assertContentAsExpected(cModel, expectedHeader, expectedImplementation);
  }

  @Test
  public void createInstanceFunctionTakingMultipleStrings() throws IOException {
    when(anInterface.isStatic(any())).thenReturn(false);
    when(francaArgument1.getName()).thenReturn("input");
    when(francaArgument1.getType()).thenReturn(francaTypeRef1);
    when(francaTypeRef1.getPredefined()).thenReturn(FBasicTypeId.STRING);
    inputArguments.add(francaArgument1);
    when(francaArgument2.getName()).thenReturn("input2");
    when(francaArgument2.getType()).thenReturn(francaTypeRef1);
    inputArguments.add(francaArgument2);

    String expectedHeader =
        "typedef struct {\n"
            + "    void* const private_pointer;\n"
            + "} cbridge_test_TestInterfaceRef\n"
            + "void cbridge_test_TestInterface_release(cbridge_test_TestInterfaceRef handle);\n"
            + "typedef struct {\n"
            + "    void* swift_pointer;\n"
            + "    void(*release)(void* swift_pointer);\n"
            + "    void(*cbridge_test_TestInterface_functionName)"
            + "(cbridge_test_TestInterfaceRef _instance, const char* input, const char* input2);\n"
            + "} cbridge_test_TestInterface_FunctionTable;\n"
            + "void cbridge_test_TestInterface_functionName"
            + "(cbridge_test_TestInterfaceRef _instance, const char* input, const char* input2);\n";

    String expectedImplementation =
        "#include <string>\n"
            + "#include \"BASE_API_HEADER of TestInterface\"\n"
            + "#include \"CBRIDGE_PUBLIC_HEADER of TestInterface\"\n"
            + "void cbridge_test_TestInterface_functionName"
            + "(cbridge_test_TestInterfaceRef _instance, const char* input, const char* input2) {\n"
            + "    return get_pointer(_instance)->get()->functionName(std::string(input), std::string(input2));\n"
            + "}\n";

    String expectedPrivateHeader =
        "#pragma once\n"
            + "inline std::shared_ptr<cbridge::test::TestInterface>* get_pointer(cbridge_test_TestInterfaceRef handle) {\n"
            + "    return static_cast<std::shared_ptr<cbridge::test::TestInterface>*>(handle.private_pointer);\n"
            + "}\n";

    CInterface cModel = generator.buildCBridgeModel(anInterface);

    assertContentAsExpected(cModel, expectedHeader, expectedImplementation, expectedPrivateHeader);
  }

  @Test
  public void createInstanceFunctionTakingMultipleStringsWithReturnValue() throws IOException {
    when(anInterface.isStatic(any())).thenReturn(false);
    when(francaArgument1.getName()).thenReturn("input");
    when(francaArgument1.getType()).thenReturn(francaTypeRef1);
    when(francaTypeRef1.getPredefined()).thenReturn(FBasicTypeId.STRING);
    inputArguments.add(francaArgument1);
    when(francaArgument2.getName()).thenReturn("input2");
    when(francaArgument2.getType()).thenReturn(francaTypeRef1);
    inputArguments.add(francaArgument2);
    outputArguments.add(francaArgument1);

    String expectedHeader =
        String.join(
            "\n",
            "#include \"cbridge/StringHandle.h\"\n"
                + "typedef struct {\n"
                + "    void* const private_pointer;\n"
                + "} cbridge_test_TestInterfaceRef\n"
                + "void cbridge_test_TestInterface_release(cbridge_test_TestInterfaceRef handle);"
                + "\n"
                + "typedef struct {\n"
                + "    void* swift_pointer;\n"
                + "    void(*release)(void* swift_pointer);\n"
                + "    std_stringRef(*cbridge_test_TestInterface_functionName)"
                + "(cbridge_test_TestInterfaceRef _instance, const char* input, const char* input2);\n"
                + "} cbridge_test_TestInterface_FunctionTable;\n"
                + "\n"
                + "std_stringRef cbridge_test_TestInterface_functionName"
                + "(cbridge_test_TestInterfaceRef _instance, const char* input, const char* input2);\n",
            "");

    String expectedImplementation =
        "#include <string>\n"
            + "#include \"BASE_API_HEADER of TestInterface\"\n"
            + "#include \"CBRIDGE_PUBLIC_HEADER of TestInterface\"\n"
            + "std_stringRef cbridge_test_TestInterface_functionName"
            + "(cbridge_test_TestInterfaceRef _instance, const char* input, const char* input2) {\n"
            + "    return {new std::string(get_pointer(_instance)->get()"
            + "->functionName(std::string(input), std::string(input2)))};\n"
            + "}\n";

    String expectedPrivateHeader =
        "#pragma once\n"
            + "inline std::shared_ptr<cbridge::test::TestInterface>* get_pointer(cbridge_test_TestInterfaceRef handle) {\n"
            + "    return static_cast<std::shared_ptr<cbridge::test::TestInterface>*>(handle.private_pointer);\n"
            + "}\n";

    CInterface cModel = generator.buildCBridgeModel(anInterface);

    assertContentAsExpected(cModel, expectedHeader, expectedImplementation, expectedPrivateHeader);
  }

  @Test
  public void createFunctionTakingAndReturningString() throws IOException {
    when(francaArgument1.getName()).thenReturn("input");
    when(francaArgument1.getType()).thenReturn(francaTypeRef1);
    when(francaTypeRef1.getPredefined()).thenReturn(FBasicTypeId.STRING);
    inputArguments.add(francaArgument1);

    when(francaArgument2.getName()).thenReturn("output");
    when(francaArgument2.getType()).thenReturn(francaTypeRef2);
    when(francaTypeRef2.getPredefined()).thenReturn(FBasicTypeId.STRING);
    outputArguments.add(francaArgument1);

    String expectedHeader =
        String.join(
            "\n",
            "#include \"cbridge/StringHandle.h\"",
            "typedef struct {",
            "    void* swift_pointer;",
            "    void(*release)(void* swift_pointer);",
            "    std_stringRef(*cbridge_test_TestInterface_functionName)(const char* input);",
            "} cbridge_test_TestInterface_FunctionTable;",
            "std_stringRef cbridge_test_TestInterface_functionName(const char* input);",
            "");

    String expectedImplementation =
        String.join(
            "\n",
            "#include <string>",
            BASEAPI_HEADER_INCLUDE,
            CBRIDGE_HEADER_INCLUDE,
            "std_stringRef cbridge_test_TestInterface_functionName(const char* input) {",
            "    return {new std::string(cbridge::test::TestInterface::functionName(std::string(input)))};",
            "}",
            "");

    CInterface cModel = generator.buildCBridgeModel(anInterface);

    assertContentAsExpected(cModel, expectedHeader, expectedImplementation);
  }

  @Test
  public void createFunctionTakingByteArray() throws IOException {
    when(francaArgument1.getName()).thenReturn("input");
    when(francaArgument1.getType()).thenReturn(francaTypeRef1);
    when(francaTypeRef1.getPredefined()).thenReturn(FBasicTypeId.BYTE_BUFFER);
    inputArguments.add(francaArgument1);

    String expectedHeader =
        String.join(
            "\n",
            "#include <stdint.h>",
            "typedef struct {",
            "    void* swift_pointer;",
            "    void(*release)(void* swift_pointer);",
            "    void(*cbridge_test_TestInterface_functionName)(const uint8_t* input_ptr, int64_t input_size);",
            "} cbridge_test_TestInterface_FunctionTable;",
            "void cbridge_test_TestInterface_functionName(const uint8_t* input_ptr, int64_t input_size);",
            "");

    String expectedImplementation =
        String.join(
            "\n",
            "#include <vector>",
            BASEAPI_HEADER_INCLUDE,
            CBRIDGE_HEADER_INCLUDE,
            "void cbridge_test_TestInterface_functionName(const uint8_t* input_ptr, int64_t input_size) {",
            "    return cbridge::test::TestInterface::functionName(std::vector<uint8_t>(input_ptr, input_ptr + input_size));",
            "}",
            "");

    CInterface cModel = generator.buildCBridgeModel(anInterface);

    assertContentAsExpected(cModel, expectedHeader, expectedImplementation);
  }

  @Test
  public void createFunctionTakingAndReturningByteBuffer() throws IOException {
    when(francaArgument1.getName()).thenReturn("input");
    when(francaArgument1.getType()).thenReturn(francaTypeRef1);
    when(francaTypeRef1.getPredefined()).thenReturn(FBasicTypeId.BYTE_BUFFER);
    inputArguments.add(francaArgument1);

    when(francaArgument2.getName()).thenReturn("output");
    when(francaArgument2.getType()).thenReturn(francaTypeRef2);
    when(francaTypeRef2.getPredefined()).thenReturn(FBasicTypeId.BYTE_BUFFER);
    outputArguments.add(francaArgument2);

    String expectedHeader =
        String.join(
            "\n",
            "#include <stdint.h>",
            "#include \"cbridge/ByteArrayHandle.h\"",
            "typedef struct {",
            "    void* swift_pointer;",
            "    void(*release)(void* swift_pointer);",
            "    byteArrayRef(*cbridge_test_TestInterface_functionName)(const uint8_t* input_ptr, int64_t input_size);",
            "} cbridge_test_TestInterface_FunctionTable;",
            "byteArrayRef cbridge_test_TestInterface_functionName(const uint8_t* input_ptr, int64_t input_size);",
            "");

    String expectedImplementation =
        String.join(
            "\n",
            "#include <vector>",
            BASEAPI_HEADER_INCLUDE,
            CBRIDGE_HEADER_INCLUDE,
            "byteArrayRef cbridge_test_TestInterface_functionName(const uint8_t* input_ptr, int64_t input_size) {",
            "    return {new std::vector<uint8_t>(cbridge::test::TestInterface::functionName(std::vector<uint8_t>(input_ptr, input_ptr + input_size)))};",
            "}",
            "");

    CInterface cModel = generator.buildCBridgeModel(anInterface);

    assertContentAsExpected(cModel, expectedHeader, expectedImplementation);
  }

  @Test
  public void createFunctionTakingAndReturningBasicIntegralTypes() throws IOException {
    Map<FBasicTypeId, String> expectedCTypes = new HashMap<>();
    expectedCTypes.put(FBasicTypeId.INT8, "int8_t");
    expectedCTypes.put(FBasicTypeId.UINT8, "uint8_t");
    expectedCTypes.put(FBasicTypeId.INT16, "int16_t");
    expectedCTypes.put(FBasicTypeId.UINT16, "uint16_t");
    expectedCTypes.put(FBasicTypeId.INT32, "int32_t");
    expectedCTypes.put(FBasicTypeId.UINT32, "uint32_t");
    expectedCTypes.put(FBasicTypeId.INT64, "int64_t");
    expectedCTypes.put(FBasicTypeId.UINT64, "uint64_t");

    when(francaArgument1.getName()).thenReturn("input");
    when(francaArgument1.getType()).thenReturn(francaTypeRef1);
    inputArguments.add(francaArgument1);

    when(francaArgument2.getName()).thenReturn("output");
    when(francaArgument2.getType()).thenReturn(francaTypeRef2);
    outputArguments.add(francaArgument2);

    String expectedHeaderWithTypePlaceholders =
        String.join(
            "\n",
            "#include <stdint.h>",
            "typedef struct {",
            "    void* swift_pointer;",
            "    void(*release)(void* swift_pointer);",
            "    %1$s(*cbridge_test_TestInterface_functionName)(%1$s input);",
            "} cbridge_test_TestInterface_FunctionTable;",
            "%1$s cbridge_test_TestInterface_functionName(%1$s input);",
            "");
    String expectedImplementationWithTypePlaceholders =
        String.join(
            "\n",
            BASEAPI_HEADER_INCLUDE,
            CBRIDGE_HEADER_INCLUDE,
            "%1$s cbridge_test_TestInterface_functionName(%1$s input) {",
            "    return cbridge::test::TestInterface::functionName(input);",
            "}",
            "");
    for (Map.Entry<FBasicTypeId, String> entry : expectedCTypes.entrySet()) {
      testFunctionCreationForBasicType(
          entry.getKey(),
          entry.getValue(),
          expectedHeaderWithTypePlaceholders,
          expectedImplementationWithTypePlaceholders);
    }
  }

  @Test
  public void createFunctionTakingAndReturningFloatTypes() throws IOException {
    Map<FBasicTypeId, String> expectedCTypes = new HashMap<>();
    expectedCTypes.put(FBasicTypeId.FLOAT, "float");
    expectedCTypes.put(FBasicTypeId.DOUBLE, "double");

    when(francaArgument1.getName()).thenReturn("input");
    when(francaArgument1.getType()).thenReturn(francaTypeRef1);
    inputArguments.add(francaArgument1);

    when(francaArgument2.getName()).thenReturn("output");
    when(francaArgument2.getType()).thenReturn(francaTypeRef2);
    outputArguments.add(francaArgument2);

    String expectedHeaderWithTypePlaceholders =
        String.join(
            "\n",
            "typedef struct {",
            "    void* swift_pointer;",
            "    void(*release)(void* swift_pointer);",
            "    %1$s(*cbridge_test_TestInterface_functionName)(%1$s input);",
            "} cbridge_test_TestInterface_FunctionTable;",
            "%1$s cbridge_test_TestInterface_functionName(%1$s input);",
            "");

    String expectedImplementationWithTypePlaceholders =
        String.join(
            "\n",
            BASEAPI_HEADER_INCLUDE,
            CBRIDGE_HEADER_INCLUDE,
            "%1$s cbridge_test_TestInterface_functionName(%1$s input) {",
            "    return cbridge::test::TestInterface::functionName(input);",
            "}",
            "");
    for (Map.Entry<FBasicTypeId, String> entry : expectedCTypes.entrySet()) {
      testFunctionCreationForBasicType(
          entry.getKey(),
          entry.getValue(),
          expectedHeaderWithTypePlaceholders,
          expectedImplementationWithTypePlaceholders);
    }
  }

  @Test
  public void createFunctionTakingAndReturningBool() throws IOException {
    when(francaArgument1.getName()).thenReturn("input");
    when(francaArgument1.getType()).thenReturn(francaTypeRef1);
    when(francaTypeRef1.getPredefined()).thenReturn(FBasicTypeId.BOOLEAN);
    inputArguments.add(francaArgument1);

    when(francaArgument2.getName()).thenReturn("output");
    when(francaArgument2.getType()).thenReturn(francaTypeRef2);
    when(francaTypeRef2.getPredefined()).thenReturn(FBasicTypeId.BOOLEAN);
    outputArguments.add(francaArgument2);

    String expectedHeader =
        String.join(
            "\n",
            "#include <stdbool.h>",
            "typedef struct {",
            "    void* swift_pointer;",
            "    void(*release)(void* swift_pointer);",
            "    bool(*cbridge_test_TestInterface_functionName)(bool input);",
            "} cbridge_test_TestInterface_FunctionTable;",
            "bool cbridge_test_TestInterface_functionName(bool input);",
            "");

    String expectedImplementation =
        String.join(
            "\n",
            BASEAPI_HEADER_INCLUDE,
            CBRIDGE_HEADER_INCLUDE,
            "bool cbridge_test_TestInterface_functionName(bool input) {",
            "    return cbridge::test::TestInterface::functionName(input);",
            "}",
            "");

    CInterface cModel = generator.buildCBridgeModel(anInterface);

    assertContentAsExpected(cModel, expectedHeader, expectedImplementation);
  }

  private void testFunctionCreationForBasicType(
      FBasicTypeId francaType,
      String cType,
      String expectedHeaderWithTypePlaceholders,
      String expectedImplementationWithTypePlaceholders) {
    String expectedHeader = String.format(expectedHeaderWithTypePlaceholders, cType);
    String expectedImplementation =
        String.format(expectedImplementationWithTypePlaceholders, cType);
    when(francaTypeRef1.getPredefined()).thenReturn(francaType);
    when(francaTypeRef2.getPredefined()).thenReturn(francaType);

    CInterface cModel = generator.buildCBridgeModel(anInterface);

    assertContentAsExpected(cModel, expectedHeader, expectedImplementation);
  }

  @Test
  public void createStructDefinition() {
    methods.clear();
    FStructType struct = mock(FStructType.class);
    when(struct.getName()).thenReturn("SomeStruct");
    when(struct.eContainer()).thenReturn(francaInterface);
    structs.add(struct);

    String expectedHeader =
        "typedef struct {\n"
            + "    void* const private_pointer;\n"
            + "} cbridge_test_TestInterface_SomeStructRef;\n"
            + "cbridge_test_TestInterface_SomeStructRef cbridge_test_TestInterface_SomeStruct_create();\n"
            + "void cbridge_test_TestInterface_SomeStruct_release(cbridge_test_TestInterface_SomeStructRef handle);\n"
            + "typedef struct {\n"
            + "    void* swift_pointer;\n"
            + "    void(*release)(void* swift_pointer);\n"
            + "} cbridge_test_TestInterface_FunctionTable;\n";

    String expectedPrivateHeader =
        "#pragma once\n"
            + CBRIDGE_HEADER_INCLUDE
            + BASEAPI_HEADER_INCLUDE
            + "inline cbridge::test::TestInterface::SomeStruct* get_pointer(cbridge_test_TestInterface_SomeStructRef handle) {\n"
            + "    return static_cast<cbridge::test::TestInterface::SomeStruct*>(handle.private_pointer);\n"
            + "}\n";

    String expectedImplementation =
        CBRIDGE_HEADER_INCLUDE
            + BASEAPI_HEADER_INCLUDE
            + PRIVATE_HEADER_INCLUDE
            + "cbridge_test_TestInterface_SomeStructRef cbridge_test_TestInterface_SomeStruct_create() {\n"
            + "    return {new cbridge::test::TestInterface::SomeStruct()};\n"
            + "}\n"
            + "void cbridge_test_TestInterface_SomeStruct_release(cbridge_test_TestInterface_SomeStructRef handle) {\n"
            + "    delete get_pointer(handle);\n"
            + "}\n";

    CInterface cModel = generator.buildCBridgeModel(anInterface);

    assertContentAsExpected(cModel, expectedHeader, expectedImplementation, expectedPrivateHeader);
  }

  private void assertContentAsExpected(
      CInterface cModel,
      String expectedHeader,
      String expectedImplementation,
      String expectedPrivateHeader) {
    final String generatedImplementation = CBridgeGenerator.generateImplementationContent(cModel);
    assertEqualImplementationContent(expectedImplementation, generatedImplementation);
    final String generatedHeader = CBridgeGenerator.generateHeaderContent(cModel);
    assertEqualHeaderContent(expectedHeader, generatedHeader);
    final String generatedPrivateHeader = CBridgeGenerator.generatePrivateHeaderContent(cModel);
    assertEqualPrivateHeaderContent(expectedPrivateHeader, generatedPrivateHeader);
  }

  private void assertContentAsExpected(
      CInterface cModel, String expectedHeader, String expectedImplementation) {
    assertContentAsExpected(cModel, expectedHeader, expectedImplementation, "");
  }
}
