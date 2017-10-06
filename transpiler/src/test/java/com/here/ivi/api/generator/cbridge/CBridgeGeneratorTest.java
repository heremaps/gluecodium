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
import static org.mockito.MockitoAnnotations.initMocks;

import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.model.cmodel.CInterface;
import com.here.ivi.api.model.cmodel.IncludeResolver;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.test.ArrayEList;
import java.io.IOException;
import java.math.BigInteger;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.eclipse.emf.common.util.EList;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FBasicTypeId;
import org.franca.core.franca.FEnumerationType;
import org.franca.core.franca.FEnumerator;
import org.franca.core.franca.FField;
import org.franca.core.franca.FIntegerConstant;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FModelElement;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeCollection;
import org.franca.core.franca.FTypeRef;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Answers;
import org.mockito.Mock;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@SuppressWarnings("PMD.TooManyFields")
@RunWith(PowerMockRunner.class)
@PrepareForTest(CBridgeNameRules.class)
public class CBridgeGeneratorTest {

  private static final List<String> PACKAGES = asList("cbridge", "test");
  private static final String INTERFACE_NAME = "TestInterface";
  private static final String TYPE_COLLECTION_NAME = "TestTypeCollection";
  private static final String FUNCTION_NAME = "functionName";
  private static final String PRIVATE_HEADER_NAME = "CBRIDGE_PRIVATE_HEADER of TestInterface";
  private static final String PRIVATE_HEADER_INCLUDE = "#include \"" + PRIVATE_HEADER_NAME + "\"\n";
  private static final String PUBLIC_HEADER_NAME = "CBRIDGE_PUBLIC_HEADER of TestInterface";
  private static final String CBRIDGE_HEADER_INCLUDE = "#include \"" + PUBLIC_HEADER_NAME + "\"\n";
  private static final String BASEAPI_HEADER_INCLUDE =
      "#include \"BASE_API_HEADER of TestInterface\"\n";
  private static final String INSTANCE_REF =
      "typedef struct {\n"
          + "    void* const private_pointer;\n"
          + "} cbridge_test_TestInterfaceRef;\n"
          + "void cbridge_test_TestInterface_release(cbridge_test_TestInterfaceRef handle);\n";
  private static final String INSTANCE_RELEASE =
      "void cbridge_test_TestInterface_release(cbridge_test_TestInterfaceRef handle) {\n"
          + "    delete get_pointer(handle);\n"
          + "}\n";

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private Interface anInterface;

  @Mock private FModel francaModel;
  @Mock private FInterface francaInterface;
  @Mock private FTypeCollection francaTypeCollction;

  @Mock private FMethod francaMethod;
  @Mock private FArgument francaArgument1;
  @Mock private FTypeRef francaTypeRef1;
  @Mock private FArgument francaArgument2;
  @Mock private FTypeRef francaTypeRef2;

  @Mock private IncludeResolver resolver;
  private final ArrayEList<FType> interfaceTypes = new ArrayEList<>();
  private final ArrayEList<FMethod> methods = new ArrayEList<>();
  private final ArrayEList<FArgument> inputArguments = new ArrayEList<>();
  private final ArrayEList<FArgument> outputArguments = new ArrayEList<>();

  private CBridgeGenerator generator;

  @Before
  public void setUp() throws Exception {
    initMocks(this);

    when(anInterface.isStatic(any())).thenReturn(true);
    when(anInterface.getPackageNames()).thenReturn(PACKAGES);
    when(anInterface.getName()).thenReturn(INTERFACE_NAME);
    when(anInterface.getFrancaInterface()).thenReturn(francaInterface);
    when(anInterface.getFrancaTypeCollection()).thenReturn(francaInterface);

    when(francaTypeCollction.getName()).thenReturn(TYPE_COLLECTION_NAME);
    when(francaTypeCollction.eContainer()).thenReturn(francaModel);

    when(francaInterface.getName()).thenReturn(INTERFACE_NAME);
    when(francaInterface.getMethods()).thenReturn(methods);
    when(francaInterface.eContainer()).thenReturn(francaModel);
    when(francaInterface.getTypes()).thenReturn(interfaceTypes);
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
              FModelElement modelElement = (FModelElement) (invocation.getArguments()[0]);
              return Include.createInternalInclude(
                  type.toString()
                      + " of "
                      + DefinedBy.findDefiningTypeCollection(modelElement).getName());
            });

    generator = new CBridgeGenerator(resolver);

    PowerMockito.spy(CBridgeNameRules.class);
    PowerMockito.doReturn(PRIVATE_HEADER_NAME)
        .when(CBridgeNameRules.class, "getPrivateHeaderFileNameWithPath", any());
    PowerMockito.doReturn(PUBLIC_HEADER_NAME)
        .when(CBridgeNameRules.class, "getHeaderFileNameWithPath", any(FrancaElement.class));
    PowerMockito.doReturn("")
        .when(CBridgeNameRules.class, "getImplementationFileNameWithPath", any());
  }

  @Test
  public void generatesHeaderImplementationAndPrivateHeader() {
    List<GeneratedFile> files = generator.generate(anInterface);

    assertEquals("Should generate header, implementation and private header file", 3, files.size());
  }

  @Test
  public void instantiableClassesAreGenerated() {
    when(anInterface.isStatic(any())).thenReturn(false);

    String expectedHeader =
        INSTANCE_REF
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
            PRIVATE_HEADER_INCLUDE,
            "#include <memory>",
            INSTANCE_RELEASE,
            "void cbridge_test_TestInterface_functionName(cbridge_test_TestInterfaceRef _instance) {\n"
                + "    return get_pointer(_instance)->get()->functionName();\n"
                + "}\n");
    String expectedPrivateHeader =
        "#pragma once\n"
            + CBRIDGE_HEADER_INCLUDE
            + BASEAPI_HEADER_INCLUDE
            + "#include <memory>\n"
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
            INSTANCE_REF,
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
            PRIVATE_HEADER_INCLUDE,
            "#include <memory>",
            INSTANCE_RELEASE,
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
            INSTANCE_REF,
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
            PRIVATE_HEADER_INCLUDE,
            "#include <memory>",
            INSTANCE_RELEASE,
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
        INSTANCE_REF
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
            + BASEAPI_HEADER_INCLUDE
            + CBRIDGE_HEADER_INCLUDE
            + PRIVATE_HEADER_INCLUDE
            + "#include <memory>\n"
            + INSTANCE_RELEASE
            + "void cbridge_test_TestInterface_functionName"
            + "(cbridge_test_TestInterfaceRef _instance, const char* input, const char* input2) {\n"
            + "    return get_pointer(_instance)->get()->functionName(std::string(input), std::string(input2));\n"
            + "}\n";

    String expectedPrivateHeader =
        "#pragma once\n"
            + CBRIDGE_HEADER_INCLUDE
            + BASEAPI_HEADER_INCLUDE
            + "#include <memory>\n"
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
                + INSTANCE_REF
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
            + BASEAPI_HEADER_INCLUDE
            + CBRIDGE_HEADER_INCLUDE
            + PRIVATE_HEADER_INCLUDE
            + "#include <memory>\n"
            + INSTANCE_RELEASE
            + "std_stringRef cbridge_test_TestInterface_functionName"
            + "(cbridge_test_TestInterfaceRef _instance, const char* input, const char* input2) {\n"
            + "    return {new std::string(get_pointer(_instance)->get()"
            + "->functionName(std::string(input), std::string(input2)))};\n"
            + "}\n";

    String expectedPrivateHeader =
        "#pragma once\n"
            + CBRIDGE_HEADER_INCLUDE
            + BASEAPI_HEADER_INCLUDE
            + "#include <memory>\n"
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
    outputArguments.add(francaArgument2);

    String expectedHeader =
        String.join(
            "\n",
            "#include \"cbridge/StringHandle.h\"",
            INSTANCE_REF,
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
            PRIVATE_HEADER_INCLUDE,
            "#include <memory>",
            INSTANCE_RELEASE,
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
            INSTANCE_REF,
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
            PRIVATE_HEADER_INCLUDE,
            "#include <memory>",
            INSTANCE_RELEASE,
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
            INSTANCE_REF,
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
            PRIVATE_HEADER_INCLUDE,
            "#include <memory>",
            INSTANCE_RELEASE,
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
            INSTANCE_REF,
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
            PRIVATE_HEADER_INCLUDE,
            "#include <memory>",
            INSTANCE_RELEASE,
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
            INSTANCE_REF,
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
            PRIVATE_HEADER_INCLUDE,
            "#include <memory>",
            INSTANCE_RELEASE,
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
            INSTANCE_REF,
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
            PRIVATE_HEADER_INCLUDE,
            "#include <memory>",
            INSTANCE_RELEASE,
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
    interfaceTypes.add(struct);

    String expectedHeader =
        "typedef struct {\n"
            + "    void* const private_pointer;\n"
            + "} cbridge_test_TestInterface_SomeStructRef;\n"
            + "cbridge_test_TestInterface_SomeStructRef cbridge_test_TestInterface_SomeStruct_create();\n"
            + "void cbridge_test_TestInterface_SomeStruct_release(cbridge_test_TestInterface_SomeStructRef handle);\n"
            + INSTANCE_REF
            + "typedef struct {\n"
            + "    void* swift_pointer;\n"
            + "    void(*release)(void* swift_pointer);\n"
            + "} cbridge_test_TestInterface_FunctionTable;\n";

    String expectedPrivateHeader =
        "#pragma once\n"
            + CBRIDGE_HEADER_INCLUDE
            + BASEAPI_HEADER_INCLUDE
            + "#include <memory>\n"
            + "inline cbridge::test::TestInterface::SomeStruct* get_pointer(cbridge_test_TestInterface_SomeStructRef handle) {\n"
            + "    return static_cast<cbridge::test::TestInterface::SomeStruct*>(handle.private_pointer);\n"
            + "}\n"
            + "inline std::shared_ptr<cbridge::test::TestInterface>* get_pointer(cbridge_test_TestInterfaceRef handle) {\n"
            + "    return static_cast<std::shared_ptr<cbridge::test::TestInterface>*>(handle.private_pointer);\n"
            + "}\n";

    String expectedImplementation =
        CBRIDGE_HEADER_INCLUDE
            + BASEAPI_HEADER_INCLUDE
            + PRIVATE_HEADER_INCLUDE
            + "#include <memory>\n"
            + INSTANCE_RELEASE
            + "cbridge_test_TestInterface_SomeStructRef cbridge_test_TestInterface_SomeStruct_create() {\n"
            + "    return {new cbridge::test::TestInterface::SomeStruct()};\n"
            + "}\n"
            + "void cbridge_test_TestInterface_SomeStruct_release(cbridge_test_TestInterface_SomeStructRef handle) {\n"
            + "    delete get_pointer(handle);\n"
            + "}\n";

    CInterface cModel = generator.buildCBridgeModel(anInterface);

    assertContentAsExpected(cModel, expectedHeader, expectedImplementation, expectedPrivateHeader);
  }

  @Test
  public void createEnumDefinition() {
    methods.clear();
    FEnumerationType francaEnum = mockEnumType();
    interfaceTypes.add(francaEnum);

    String expectedHeader =
        "#include <stdint.h>\n"
            + "typedef uint32_t cbridge_test_TestInterface_TestEnum;\n"
            + INSTANCE_REF
            + "typedef struct {\n"
            + "    void* swift_pointer;\n"
            + "    void(*release)(void* swift_pointer);\n"
            + "} cbridge_test_TestInterface_FunctionTable;\n";

    String expectedImplementation =
        CBRIDGE_HEADER_INCLUDE
            + PRIVATE_HEADER_INCLUDE
            + BASEAPI_HEADER_INCLUDE
            + "#include <memory>\n"
            + INSTANCE_RELEASE;

    CInterface cModel = generator.buildCBridgeModel(anInterface);

    assertContentAsExpected(cModel, expectedHeader, expectedImplementation);
  }

  @Test
  public void createStructWithExternalEnum() {
    methods.clear();
    FEnumerationType francaEnum = mockEnumType();
    when(francaEnum.eContainer()).thenReturn(francaTypeCollction);

    FStructType struct = mock(FStructType.class);
    when(struct.getName()).thenReturn("SomeStruct");
    when(struct.eContainer()).thenReturn(francaInterface);
    interfaceTypes.add(struct);

    FField field = mock(FField.class);
    EList<FField> fields = new ArrayEList<>();
    when(field.getName()).thenReturn("STRUCT_FILED");
    when(field.getType()).thenReturn(francaTypeRef1);
    when(francaTypeRef1.getDerived()).thenReturn(francaEnum);
    fields.add(field);
    when(struct.getElements()).thenReturn(fields);

    String expectedHeader =
        "#include \"CBRIDGE_PUBLIC_HEADER of TestTypeCollection\"\n"
            + "typedef struct {\n"
            + "    void* const private_pointer;\n"
            + "} cbridge_test_TestInterface_SomeStructRef;\n"
            + "\n"
            + "cbridge_test_TestInterface_SomeStructRef cbridge_test_TestInterface_SomeStruct_create();\n"
            + "void cbridge_test_TestInterface_SomeStruct_release(cbridge_test_TestInterface_SomeStructRef handle);\n"
            + "cbridge_test_TestTypeCollection_TestEnum cbridge_test_TestInterface_SomeStruct_STRUCT_FILED_get(cbridge_test_TestInterface_SomeStructRef handle);\n"
            + "void cbridge_test_TestInterface_SomeStruct_STRUCT_FILED_set(cbridge_test_TestInterface_SomeStructRef handle, cbridge_test_TestTypeCollection_TestEnum STRUCT_FILED);\n"
            + "\n"
            + INSTANCE_REF
            + "typedef struct {\n"
            + "    void* swift_pointer;\n"
            + "    void(*release)(void* swift_pointer);\n"
            + "} cbridge_test_TestInterface_FunctionTable;\n";

    String expectedImplementation =
        CBRIDGE_HEADER_INCLUDE
            + BASEAPI_HEADER_INCLUDE
            + PRIVATE_HEADER_INCLUDE
            + "#include <memory>\n"
            + INSTANCE_RELEASE
            + "cbridge_test_TestInterface_SomeStructRef cbridge_test_TestInterface_SomeStruct_create() {\n"
            + "    return {new cbridge::test::TestInterface::SomeStruct()};\n"
            + "}\n"
            + "void cbridge_test_TestInterface_SomeStruct_release(cbridge_test_TestInterface_SomeStructRef handle) {\n"
            + "    delete get_pointer(handle);\n"
            + "}\n"
            + "cbridge_test_TestTypeCollection_TestEnum cbridge_test_TestInterface_SomeStruct_STRUCT_FILED_get(cbridge_test_TestInterface_SomeStructRef handle) {\n"
            + "    return static_cast<cbridge_test_TestTypeCollection_TestEnum>(get_pointer(handle)->STRUCT_FILED);\n"
            + "}\n"
            + "void cbridge_test_TestInterface_SomeStruct_STRUCT_FILED_set(cbridge_test_TestInterface_SomeStructRef handle, cbridge_test_TestTypeCollection_TestEnum STRUCT_FILED) {\n"
            + "    get_pointer(handle)->STRUCT_FILED = static_cast<cbridge::test::TestEnum>(STRUCT_FILED);\n"
            + "}\n";

    CInterface cModel = generator.buildCBridgeModel(anInterface);

    assertContentAsExpected(cModel, expectedHeader, expectedImplementation);
  }

  @Test
  public void createsMethodWithExternalEnum() {
    FEnumerationType francaEnum = mockEnumType();
    when(francaEnum.eContainer()).thenReturn(francaTypeCollction);

    when(francaArgument1.getName()).thenReturn("input");
    when(francaArgument1.getType()).thenReturn(francaTypeRef1);
    when(francaTypeRef1.getDerived()).thenReturn(francaEnum);
    inputArguments.add(francaArgument1);

    when(francaArgument2.getName()).thenReturn("output");
    when(francaArgument2.getType()).thenReturn(francaTypeRef2);
    when(francaTypeRef2.getDerived()).thenReturn(francaEnum);
    outputArguments.add(francaArgument2);

    String expectedHeader =
        "#include \"CBRIDGE_PUBLIC_HEADER of TestTypeCollection\"\n"
            + INSTANCE_REF
            + "typedef struct {\n"
            + "    void* swift_pointer;\n"
            + "    void(*release)(void* swift_pointer);\n"
            + "    cbridge_test_TestTypeCollection_TestEnum(*cbridge_test_TestInterface_functionName)(cbridge_test_TestTypeCollection_TestEnum input);\n"
            + "} cbridge_test_TestInterface_FunctionTable;\n"
            + "cbridge_test_TestTypeCollection_TestEnum cbridge_test_TestInterface_functionName(cbridge_test_TestTypeCollection_TestEnum input);\n";

    String expectedImplementation =
        BASEAPI_HEADER_INCLUDE
            + CBRIDGE_HEADER_INCLUDE
            + PRIVATE_HEADER_INCLUDE
            + "#include <memory>\n"
            + INSTANCE_RELEASE
            + "cbridge_test_TestTypeCollection_TestEnum cbridge_test_TestInterface_functionName(cbridge_test_TestTypeCollection_TestEnum input) {\n"
            + "    return static_cast<cbridge_test_TestTypeCollection_TestEnum>(cbridge::test::TestInterface::functionName(static_cast<cbridge::test::TestEnum>(input)));\n"
            + "}\n";

    CInterface cModel = generator.buildCBridgeModel(anInterface);

    assertContentAsExpected(cModel, expectedHeader, expectedImplementation);
  }

  private FEnumerationType mockEnumType() {
    ArrayEList<FEnumerator> enumItems = new ArrayEList<>();
    FEnumerationType francaEnum = mock(FEnumerationType.class);
    when(francaEnum.getName()).thenReturn("TestEnum");
    when(francaEnum.eContainer()).thenReturn(francaInterface);
    when(francaEnum.getEnumerators()).thenReturn(enumItems);

    FIntegerConstant enumVal = mock(FIntegerConstant.class);
    when(enumVal.getVal()).thenReturn(BigInteger.TEN);
    FEnumerator enumItem = mock(FEnumerator.class);
    when(enumItem.getValue()).thenReturn(enumVal).thenReturn(null);
    when(enumItem.eContainer()).thenReturn(francaEnum);
    when(enumItem.getName()).thenReturn("field_1").thenReturn("field_2");
    enumItems.add(enumItem);
    enumItems.add(enumItem);
    return francaEnum;
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
    final String generatedImplementation = CBridgeGenerator.generateImplementationContent(cModel);
    assertEqualImplementationContent(expectedImplementation, generatedImplementation);
    final String generatedHeader = CBridgeGenerator.generateHeaderContent(cModel);
    assertEqualHeaderContent(expectedHeader, generatedHeader);
  }
}
