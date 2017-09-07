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
import static java.util.Arrays.asList;
import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.model.cmodel.CInterface;
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

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private Interface anInterface;

  @Mock private FInterface francaInterface;

  @Mock private FMethod francaMethod;
  @Mock private FArgument francaArgument1;
  @Mock private FTypeRef francaTypeRef1;
  @Mock private FArgument francaArgument2;
  @Mock private FTypeRef francaTypeRef2;
  private final ArrayEList<FMethod> methods = new ArrayEList<>();
  private final ArrayEList<FArgument> inputArguments = new ArrayEList<>();
  private final ArrayEList<FArgument> outputArguments = new ArrayEList<>();

  private final CBridgeGenerator generator = new CBridgeGenerator(new CBridgeNameRules());

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

    when(francaMethod.getName()).thenReturn(FUNCTION_NAME);
    when(francaMethod.getInArgs()).thenReturn(inputArguments);
    when(francaMethod.getOutArgs()).thenReturn(outputArguments);
    methods.add(francaMethod);
  }

  @Test
  public void generatesHeaderAndImplementation() {
    List<GeneratedFile> files = generator.generate(anInterface);

    assertEquals("Should generate header and implementation file", 2, files.size());
  }

  @Test
  public void nonStaticFunctionAreNotGenerated() {
    when(anInterface.isStatic(any())).thenReturn(false);

    String expectedHeader = "";
    String expectedImplementation =
        String.join(
            "\n",
            "#include \"TestInterface.h\"",
            "#include <cpp/cbridge/test/TestInterface.h>",
            "");

    CInterface cModel = generator.buildCBridgeModel(anInterface);

    assertContentAsExpected(cModel, expectedHeader, expectedImplementation);
  }

  @Test
  public void createFunctionWithoutArguments() throws IOException {

    String expectedHeader = "void cbridge_test_TestInterface_functionName();\n";

    String expectedImplementation =
        String.join(
            "\n",
            "#include \"TestInterface.h\"",
            "#include <cpp/cbridge/test/TestInterface.h>",
            "void cbridge_test_TestInterface_functionName() {",
            "    cbridge::test::TestInterface::functionName();",
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
        String.join("\n", "void cbridge_test_TestInterface_functionName(const char* input);", "");

    String expectedImplementation =
        String.join(
            "\n",
            "#include \"TestInterface.h\"",
            "#include <string>",
            "#include \"StringHandleImpl.h\"",
            "#include <cpp/cbridge/test/TestInterface.h>",
            "void cbridge_test_TestInterface_functionName(const char* input) {",
            "    auto&& cpp_input = std::string(input);",
            "    cbridge::test::TestInterface::functionName(cpp_input);",
            "}",
            "");

    CInterface cModel = generator.buildCBridgeModel(anInterface);

    assertContentAsExpected(cModel, expectedHeader, expectedImplementation);
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
            "#include <StringHandle.h>",
            "std_stringRef cbridge_test_TestInterface_functionName(const char* input);",
            "");

    String expectedImplementation =
        String.join(
            "\n",
            "#include \"TestInterface.h\"",
            "#include <string>",
            "#include \"StringHandleImpl.h\"",
            "#include <cpp/cbridge/test/TestInterface.h>",
            "#include <utility>",
            "std_stringRef cbridge_test_TestInterface_functionName(const char* input) {",
            "    auto&& cpp_input = std::string(input);",
            "    {",
            "        auto&& cpp_result = cbridge::test::TestInterface::functionName(cpp_input);",
            "        return std_stringRef{new std::string(std::move(cpp_result))};",
            "    }",
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
            "void cbridge_test_TestInterface_functionName(const uint8_t* input_ptr, int64_t input_size);",
            "");

    String expectedImplementation =
        String.join(
            "\n",
            "#include \"TestInterface.h\"",
            "#include \"ByteArrayHandleImpl.h\"",
            "#include <vector>",
            "#include <cpp/cbridge/test/TestInterface.h>",
            "void cbridge_test_TestInterface_functionName(const uint8_t* input_ptr, int64_t input_size) {",
            "    auto&& cpp_input = std::vector<uint8_t>(input_ptr, input_ptr + input_size);",
            "    cbridge::test::TestInterface::functionName(cpp_input);",
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
            "#include <ByteArrayHandle.h>",
            "#include <stdint.h>",
            "byteArrayRef cbridge_test_TestInterface_functionName(const uint8_t* input_ptr, int64_t input_size);",
            "");

    String expectedImplementation =
        String.join(
            "\n",
            "#include \"TestInterface.h\"",
            "#include \"ByteArrayHandleImpl.h\"",
            "#include <vector>",
            "#include <cpp/cbridge/test/TestInterface.h>",
            "#include <utility>",
            "byteArrayRef cbridge_test_TestInterface_functionName(const uint8_t* input_ptr, int64_t input_size) {",
            "    auto&& cpp_input = std::vector<uint8_t>(input_ptr, input_ptr + input_size);",
            "    {",
            "        auto&& cpp_result = cbridge::test::TestInterface::functionName(cpp_input);",
            "        return byteArrayRef{new std::vector<uint8_t>(std::move(cpp_result))};",
            "    }",
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
            "%1$s cbridge_test_TestInterface_functionName(%1$s input);",
            "");

    String expectedImplementationWithTypePlaceholders =
        String.join(
            "\n",
            "#include \"TestInterface.h\"",
            "#include <cpp/cbridge/test/TestInterface.h>",
            "%1$s cbridge_test_TestInterface_functionName(%1$s input) {",
            "    auto&& cpp_input = input;",
            "    {",
            "        auto&& cpp_result = cbridge::test::TestInterface::functionName(cpp_input);",
            "        return cpp_result;",
            "    }",
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
        String.join("\n", "%1$s cbridge_test_TestInterface_functionName(%1$s input);", "");

    String expectedImplementationWithTypePlaceholders =
        String.join(
            "\n",
            "#include \"TestInterface.h\"",
            "#include <cpp/cbridge/test/TestInterface.h>",
            "%1$s cbridge_test_TestInterface_functionName(%1$s input) {",
            "    auto&& cpp_input = input;",
            "    {",
            "        auto&& cpp_result = cbridge::test::TestInterface::functionName(cpp_input);",
            "        return cpp_result;",
            "    }",
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
            "bool cbridge_test_TestInterface_functionName(bool input);",
            "");

    String expectedImplementation =
        String.join(
            "\n",
            "#include \"TestInterface.h\"",
            "#include <cpp/cbridge/test/TestInterface.h>",
            "bool cbridge_test_TestInterface_functionName(bool input) {",
            "    auto&& cpp_input = input;",
            "    {",
            "        auto&& cpp_result = cbridge::test::TestInterface::functionName(cpp_input);",
            "        return cpp_result;",
            "    }",
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

  private void assertContentAsExpected(
      CInterface cModel, String expectedHeader, String expectedImplementation) {
    final String generatedImplementation = CBridgeGenerator.generateImplementationContent(cModel);
    assertEqualImplementationContent(expectedImplementation, generatedImplementation);
    final String generatedHeader = CBridgeGenerator.generateHeaderContent(cModel);
    assertEqualHeaderContent(expectedHeader, generatedHeader);
  }
}
