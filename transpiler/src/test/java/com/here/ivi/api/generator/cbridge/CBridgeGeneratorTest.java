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

import static java.util.stream.Collectors.toList;
import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.cpp.CppNameRules;
import com.here.ivi.api.generator.swift.SwiftNameRules;
import com.here.ivi.api.model.cbridge.CInterface;
import com.here.ivi.api.test.ArrayEList;
import com.here.ivi.api.test.TemplateComparator;
import java.math.BigInteger;
import java.util.stream.Stream;
import org.eclipse.emf.common.util.EList;
import org.franca.core.franca.*;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
public class CBridgeGeneratorTest extends CBridgeGeneratorTestBase {

  public CBridgeGeneratorTest() throws Exception {
    super();
  }

  @Test
  public void generatesHeaderImplementationAndPrivateHeader() {
    Stream<GeneratedFile> files = generator.generate(francaInterface);

    assertEquals(
        "Should generate header and implementation files", 2, files.collect(toList()).size());
  }

  @Test
  public void instantiableClassesAreGenerated() {
    when(deploymentModel.isStatic(any())).thenReturn(false);

    TemplateComparator expectedHeader =
        TemplateComparator.expect("void cbridge_test_TestInterface_release(_baseRef handle);\n")
            .build();

    TemplateComparator expectedImplementation =
        TemplateComparator.expect(
                "void cbridge_test_TestInterface_release(_baseRef handle) {\n"
                    + "    delete get_pointer<std::shared_ptr<cbridge::test::TestInterface>>(handle);\n"
                    + "}\n")
            .build();

    CInterface cModel = generator.buildCBridgeModel(francaInterface);

    expectedHeader.assertMatches(CBridgeGenerator.generateHeaderContent(cModel));
    expectedImplementation.assertMatches(CBridgeGenerator.generateImplementationContent(cModel));
  }

  @Test
  public void instanceIncludes() {
    when(deploymentModel.isStatic(any())).thenReturn(false);

    TemplateComparator expectedImplementation =
        TemplateComparator.expect(PRIVATE_HEADER_INCLUDE).build();

    CInterface cModel = generator.buildCBridgeModel(francaInterface);

    expectedImplementation.assertMatches(CBridgeGenerator.generateImplementationContent(cModel));
  }

  @Test
  public void instanceMethodsAreGenerated() {
    when(deploymentModel.isStatic(any())).thenReturn(false);

    TemplateComparator expectedHeader =
        TemplateComparator.expect(
                "void cbridge_test_TestInterface_functionName(_baseRef _instance);\n")
            .build();

    TemplateComparator expectedImplementation =
        TemplateComparator.expect(
                "void cbridge_test_TestInterface_functionName(_baseRef _instance) {\n"
                    + "    return get_pointer<std::shared_ptr<cbridge::test::TestInterface>>(_instance)->get()->function_name();\n"
                    + "}\n")
            .build();

    CInterface cModel = generator.buildCBridgeModel(francaInterface);

    expectedHeader.assertMatches(CBridgeGenerator.generateHeaderContent(cModel));
    expectedImplementation.assertMatches(CBridgeGenerator.generateImplementationContent(cModel));
  }

  @Test
  public void functionTableIsGenerated() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);
    CInterface cModel = generator.buildCBridgeModel(francaInterface);

    TemplateComparator.expect(
            "typedef struct {\n"
                + "    void* swift_pointer;\n"
                + "    void(*release)(void* swift_pointer);\n"
                + "    void(*cbridge_test_TestInterface_functionName)(void* swift_pointer);\n"
                + "} cbridge_test_TestInterface_FunctionTable;\n")
        .build()
        .assertMatches(CBridgeGenerator.generateHeaderContent(cModel));
  }

  @Test
  public void createFunctionWithoutArguments() {
    TemplateComparator expectedHeader =
        TemplateComparator.expect("void cbridge_test_TestInterface_functionName();").build();

    TemplateComparator expectedImplementation =
        TemplateComparator.expect(
                "void cbridge_test_TestInterface_functionName() {\n"
                    + "    return ::cbridge::test::TestInterface::function_name();\n"
                    + "}\n")
            .build();

    CInterface cModel = generator.buildCBridgeModel(francaInterface);

    expectedHeader.assertMatches(CBridgeGenerator.generateHeaderContent(cModel));
    expectedImplementation.assertMatches(CBridgeGenerator.generateImplementationContent(cModel));
  }

  @Test
  public void functionWithoutArgumentsInFunctionTable() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);
    CInterface cModel = generator.buildCBridgeModel(francaInterface);

    TemplateComparator.expect(
            "typedef struct {\n"
                + "    void* swift_pointer;\n"
                + "    void(*release)(void* swift_pointer);\n"
                + "    void(*cbridge_test_TestInterface_functionName)(void* swift_pointer);\n"
                + "} cbridge_test_TestInterface_FunctionTable;\n")
        .build()
        .assertMatches(CBridgeGenerator.generateHeaderContent(cModel));
  }

  @Test
  public void createFunctionTakingString() {
    when(francaArgument1.getName()).thenReturn("input");
    when(francaArgument1.getType()).thenReturn(francaTypeRef1);
    when(francaTypeRef1.getPredefined()).thenReturn(FBasicTypeId.STRING);
    inputArguments.add(francaArgument1);

    TemplateComparator expectedHeader =
        TemplateComparator.expect(
                "void cbridge_test_TestInterface_functionName(const char* input);")
            .build();

    TemplateComparator expectedImplementation =
        TemplateComparator.expect(
                "void cbridge_test_TestInterface_functionName(const char* input) {\n"
                    + "    return ::cbridge::test::TestInterface::function_name(std::string(input));\n"
                    + "}\n")
            .build();

    CInterface cModel = generator.buildCBridgeModel(francaInterface);

    expectedHeader.assertMatches(CBridgeGenerator.generateHeaderContent(cModel));
    expectedImplementation.assertMatches(CBridgeGenerator.generateImplementationContent(cModel));
  }

  @Test
  public void createFunctionTakingStringInFunctionTable() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);
    when(francaArgument1.getName()).thenReturn("input");
    when(francaArgument1.getType()).thenReturn(francaTypeRef1);
    when(francaTypeRef1.getPredefined()).thenReturn(FBasicTypeId.STRING);
    inputArguments.add(francaArgument1);

    CInterface cModel = generator.buildCBridgeModel(francaInterface);

    TemplateComparator.expect(
            "typedef struct {\n"
                + "    void* swift_pointer;\n"
                + "    void(*release)(void* swift_pointer);\n"
                + "    void(*cbridge_test_TestInterface_functionName)(void* swift_pointer, _baseRef input);\n"
                + "} cbridge_test_TestInterface_FunctionTable;\n")
        .build()
        .assertMatches(CBridgeGenerator.generateHeaderContent(cModel));
  }

  @Test
  public void createInstanceFunctionTakingMultipleStrings() {
    when(deploymentModel.isStatic(any())).thenReturn(false);
    when(francaArgument1.getName()).thenReturn("input");
    when(francaArgument1.getType()).thenReturn(francaTypeRef1);
    when(francaTypeRef1.getPredefined()).thenReturn(FBasicTypeId.STRING);
    inputArguments.add(francaArgument1);
    when(francaArgument2.getName()).thenReturn("input2");
    when(francaArgument2.getType()).thenReturn(francaTypeRef1);
    inputArguments.add(francaArgument2);

    TemplateComparator expectedHeader =
        TemplateComparator.expect(
                "void cbridge_test_TestInterface_functionName"
                    + "(_baseRef _instance, const char* input, const char* input2);\n")
            .build();

    TemplateComparator expectedImplementation =
        TemplateComparator.expect(
                "void cbridge_test_TestInterface_functionName"
                    + "(_baseRef _instance, const char* input, const char* input2) {\n"
                    + "    return get_pointer<std::shared_ptr<cbridge::test::TestInterface>>(_instance)->get()->function_name(std::string(input), std::string(input2));\n"
                    + "}\n")
            .build();

    CInterface cModel = generator.buildCBridgeModel(francaInterface);

    expectedHeader.assertMatches(CBridgeGenerator.generateHeaderContent(cModel));
    expectedImplementation.assertMatches(CBridgeGenerator.generateImplementationContent(cModel));
  }

  @Test
  public void createInstanceFunctionTakingMultipleStringsWithReturnValue() {
    when(deploymentModel.isStatic(any())).thenReturn(false);
    when(francaArgument1.getName()).thenReturn("input");
    when(francaArgument1.getType()).thenReturn(francaTypeRef1);
    when(francaTypeRef1.getPredefined()).thenReturn(FBasicTypeId.STRING);
    inputArguments.add(francaArgument1);
    when(francaArgument2.getName()).thenReturn("input2");
    when(francaArgument2.getType()).thenReturn(francaTypeRef1);
    inputArguments.add(francaArgument2);
    outputArguments.add(francaArgument1);

    TemplateComparator expectedHeader =
        TemplateComparator.expect(STRING_INCLUDE)
            .expect(
                "_baseRef cbridge_test_TestInterface_functionName"
                    + "(_baseRef _instance, const char* input, const char* input2);\n")
            .build();

    TemplateComparator expectedImplementation =
        TemplateComparator.expect(STD_STRING_INCLUDE)
            .expect(STD_NEW_INCLUDE)
            .expect(
                "_baseRef cbridge_test_TestInterface_functionName"
                    + "(_baseRef _instance, const char* input, const char* input2) {\n"
                    + "    return {new std::string(get_pointer<std::shared_ptr<cbridge::test::TestInterface>>(_instance)->get()"
                    + "->function_name(std::string(input), std::string(input2)))};\n"
                    + "}\n")
            .build();

    CInterface cModel = generator.buildCBridgeModel(francaInterface);

    expectedHeader.assertMatches(CBridgeGenerator.generateHeaderContent(cModel));
    expectedImplementation.assertMatches(CBridgeGenerator.generateImplementationContent(cModel));
  }

  @Test
  public void createFunctionTakingAndReturningString() {
    when(francaArgument1.getName()).thenReturn("input");
    when(francaArgument1.getType()).thenReturn(francaTypeRef1);
    when(francaTypeRef1.getPredefined()).thenReturn(FBasicTypeId.STRING);
    inputArguments.add(francaArgument1);

    when(francaArgument2.getName()).thenReturn("output");
    when(francaArgument2.getType()).thenReturn(francaTypeRef2);
    when(francaTypeRef2.getPredefined()).thenReturn(FBasicTypeId.STRING);
    outputArguments.add(francaArgument2);

    TemplateComparator expectedHeader =
        TemplateComparator.expect(STRING_INCLUDE)
            .expect("_baseRef cbridge_test_TestInterface_functionName(const char* input);\n")
            .build();

    TemplateComparator expectedImplementation =
        TemplateComparator.expect(STD_STRING_INCLUDE)
            .expect(STD_NEW_INCLUDE)
            .expect(
                "_baseRef cbridge_test_TestInterface_functionName(const char* input) {\n"
                    + "    return {new std::string(::cbridge::test::TestInterface::function_name(std::string(input)))};\n"
                    + "}\n")
            .build();

    CInterface cModel = generator.buildCBridgeModel(francaInterface);

    expectedHeader.assertMatches(CBridgeGenerator.generateHeaderContent(cModel));
    expectedImplementation.assertMatches(CBridgeGenerator.generateImplementationContent(cModel));
  }

  @Test
  public void createFunctionTakingByteArray() {
    when(francaArgument1.getName()).thenReturn("input");
    when(francaArgument1.getType()).thenReturn(francaTypeRef1);
    when(francaTypeRef1.getPredefined()).thenReturn(FBasicTypeId.BYTE_BUFFER);
    inputArguments.add(francaArgument1);

    TemplateComparator expectedHeader =
        TemplateComparator.expect(STD_INT_INCLUDE)
            .expect(
                "void cbridge_test_TestInterface_functionName(const uint8_t* input_ptr, int64_t input_size);\n")
            .build();

    TemplateComparator expectedImplementation =
        TemplateComparator.expect(STD_VECTOR_INCLUDE)
            .expect(
                "void cbridge_test_TestInterface_functionName(const uint8_t* input_ptr, int64_t input_size) {\n"
                    + "    return ::cbridge::test::TestInterface::function_name(std::vector<uint8_t>(input_ptr, input_ptr + input_size));\n"
                    + "}\n")
            .build();

    CInterface cModel = generator.buildCBridgeModel(francaInterface);

    expectedHeader.assertMatches(CBridgeGenerator.generateHeaderContent(cModel));
    expectedImplementation.assertMatches(CBridgeGenerator.generateImplementationContent(cModel));
  }

  @Test
  public void functionOverloadsHaveDifferentName() {
    ArrayEList<FArgument> inputArguments1 = new ArrayEList<>();
    when(francaArgument1.getName()).thenReturn("input");
    when(francaArgument1.getType()).thenReturn(francaTypeRef1);
    when(francaTypeRef1.getPredefined()).thenReturn(FBasicTypeId.STRING);
    inputArguments1.add(francaArgument1);

    when(francaMethod.getInArgs()).thenReturn(inputArguments1);
    when(francaMethod.getSelector()).thenReturn("one");

    FMethod otherMethod = mock(FMethod.class);
    ArrayEList<FArgument> inputArguments2 = new ArrayEList<>();
    when(francaArgument2.getName()).thenReturn("input");
    when(francaArgument2.getType()).thenReturn(francaTypeRef2);
    when(francaTypeRef2.getPredefined()).thenReturn(FBasicTypeId.BOOLEAN);
    inputArguments2.add(francaArgument2);

    when(otherMethod.getName()).thenReturn(FUNCTION_NAME);
    when(otherMethod.eContainer()).thenReturn(francaInterface);
    when(otherMethod.getInArgs()).thenReturn(inputArguments2);
    when(otherMethod.getOutArgs()).thenReturn(outputArguments);
    when(otherMethod.getSelector()).thenReturn("other");

    methods.add(otherMethod);

    TemplateComparator expectedHeader =
        TemplateComparator.expect(
                "void cbridge_test_TestInterface_functionName_one(const char* input);\n")
            .expect("void cbridge_test_TestInterface_functionName_other(bool input);\n")
            .build();

    TemplateComparator expectedImplementation =
        TemplateComparator.expect(
                "void cbridge_test_TestInterface_functionName_one(const char* input) {\n"
                    + "    return ::cbridge::test::TestInterface::function_name(std::string(input));\n"
                    + "}\n")
            .expect(
                "void cbridge_test_TestInterface_functionName_other(bool input) {\n"
                    + "    return ::cbridge::test::TestInterface::function_name(input);\n"
                    + "}\n")
            .build();

    CInterface cModel = generator.buildCBridgeModel(francaInterface);

    expectedHeader.assertMatches(CBridgeGenerator.generateHeaderContent(cModel));
    expectedImplementation.assertMatches(CBridgeGenerator.generateImplementationContent(cModel));
  }

  @Test
  public void createFunctionTakingAndReturningByteBuffer() {
    when(francaArgument1.getName()).thenReturn("input");
    when(francaArgument1.getType()).thenReturn(francaTypeRef1);
    when(francaTypeRef1.getPredefined()).thenReturn(FBasicTypeId.BYTE_BUFFER);
    inputArguments.add(francaArgument1);

    when(francaArgument2.getName()).thenReturn("output");
    when(francaArgument2.getType()).thenReturn(francaTypeRef2);
    when(francaTypeRef2.getPredefined()).thenReturn(FBasicTypeId.BYTE_BUFFER);
    outputArguments.add(francaArgument2);

    TemplateComparator expectedHeader =
        TemplateComparator.expect(BYTE_ARRAY_INCLUDE)
            .expect(
                "_baseRef cbridge_test_TestInterface_functionName(const uint8_t* input_ptr, int64_t input_size);\n")
            .build();

    TemplateComparator expectedImplementation =
        TemplateComparator.expect(STD_VECTOR_INCLUDE)
            .expect(STD_NEW_INCLUDE)
            .expect(
                "_baseRef cbridge_test_TestInterface_functionName(const uint8_t* input_ptr, int64_t input_size) {\n"
                    + "    return {new std::vector<uint8_t>(::cbridge::test::TestInterface::function_name(std::vector<uint8_t>(input_ptr, input_ptr + input_size)))};\n"
                    + "}\n")
            .build();

    CInterface cModel = generator.buildCBridgeModel(francaInterface);

    expectedHeader.assertMatches(CBridgeGenerator.generateHeaderContent(cModel));
    expectedImplementation.assertMatches(CBridgeGenerator.generateImplementationContent(cModel));
  }

  @Test
  public void createFunctionTakingAndReturningBool() {
    when(francaArgument1.getName()).thenReturn("input");
    when(francaArgument1.getType()).thenReturn(francaTypeRef1);
    when(francaTypeRef1.getPredefined()).thenReturn(FBasicTypeId.BOOLEAN);
    inputArguments.add(francaArgument1);

    when(francaArgument2.getName()).thenReturn("output");
    when(francaArgument2.getType()).thenReturn(francaTypeRef2);
    when(francaTypeRef2.getPredefined()).thenReturn(FBasicTypeId.BOOLEAN);
    outputArguments.add(francaArgument2);

    TemplateComparator expectedHeader =
        TemplateComparator.expect("#include <stdbool.h>")
            .expect("bool cbridge_test_TestInterface_functionName(bool input);\n")
            .build();

    TemplateComparator expectedImplementation =
        TemplateComparator.expect(
                "bool cbridge_test_TestInterface_functionName(bool input) {\n"
                    + "    return ::cbridge::test::TestInterface::function_name(input);\n"
                    + "}\n")
            .build();

    CInterface cModel = generator.buildCBridgeModel(francaInterface);

    expectedHeader.assertMatches(CBridgeGenerator.generateHeaderContent(cModel));
    expectedImplementation.assertMatches(CBridgeGenerator.generateImplementationContent(cModel));
  }

  @Test
  public void createStructDefinition() {
    methods.clear();
    FStructType struct = mock(FStructType.class);
    when(struct.getName()).thenReturn("SomeStruct");
    when(struct.eContainer()).thenReturn(francaInterface);
    interfaceTypes.add(struct);

    TemplateComparator expectedHeader =
        TemplateComparator.expect("_baseRef cbridge_test_TestInterface_SomeStruct_create();\n")
            .expect("void cbridge_test_TestInterface_SomeStruct_release(_baseRef handle);\n")
            .build();

    TemplateComparator expectedImplementation =
        TemplateComparator.expect(STD_NEW_INCLUDE)
            .expect(
                "_baseRef cbridge_test_TestInterface_SomeStruct_create() {\n"
                    + "    return {new cbridge::test::TestInterface::SomeStruct()};\n"
                    + "}\n")
            .expect(
                "void cbridge_test_TestInterface_SomeStruct_release(_baseRef handle) {\n"
                    + "    delete get_pointer<cbridge::test::TestInterface::SomeStruct>(handle);\n"
                    + "}\n")
            .build();

    CInterface cModel = generator.buildCBridgeModel(francaInterface);

    expectedHeader.assertMatches(CBridgeGenerator.generateHeaderContent(cModel));
    expectedImplementation.assertMatches(CBridgeGenerator.generateImplementationContent(cModel));
  }

  @Test
  public void createEnumDefinition() {
    methods.clear();
    FEnumerationType francaEnum = mockEnumType();
    interfaceTypes.add(francaEnum);

    TemplateComparator expectedHeader =
        TemplateComparator.expect(STD_INT_INCLUDE)
            .expect("typedef uint32_t cbridge_test_TestInterface_TestEnum;\n")
            .build();

    CInterface cModel = generator.buildCBridgeModel(francaInterface);

    expectedHeader.assertMatches(CBridgeGenerator.generateHeaderContent(cModel));
  }

  @Test
  public void createStructWithExternalEnum() {
    methods.clear();
    FEnumerationType francaEnum = mockEnumType();
    when(CppNameRules.getFieldName(any())).thenReturn("cppFieldName");
    when(SwiftNameRules.getFieldName(any())).thenReturn("swiftFieldName");
    when(francaEnum.eContainer()).thenReturn(francaTypeCollection);
    when(francaTypeCollection.eContainer()).thenReturn(francaModel);

    FStructType struct = mock(FStructType.class);
    when(struct.getName()).thenReturn("SomeStruct");
    when(struct.eContainer()).thenReturn(francaInterface);
    interfaceTypes.add(struct);

    FField field = mock(FField.class);
    EList<FField> fields = new ArrayEList<>();
    when(field.getType()).thenReturn(francaTypeRef1);
    when(francaTypeRef1.getDerived()).thenReturn(francaEnum);
    fields.add(field);
    when(struct.getElements()).thenReturn(fields);

    TemplateComparator expectedHeader =
        TemplateComparator.expect("#include \"CBRIDGE_PUBLIC_HEADER of TestTypeCollection\"\n")
            .expect(
                "cbridge_test_TestTypeCollection_TestEnum cbridge_test_TestInterface_SomeStruct_swiftFieldName_get(_baseRef handle);\n")
            .expect(
                "void cbridge_test_TestInterface_SomeStruct_swiftFieldName_set(_baseRef handle, cbridge_test_TestTypeCollection_TestEnum swiftFieldName);\n")
            .build();

    TemplateComparator expectedImplementation =
        TemplateComparator.expect(
                "cbridge_test_TestTypeCollection_TestEnum cbridge_test_TestInterface_SomeStruct_swiftFieldName_get(_baseRef handle) {\n"
                    + "    auto struct_pointer = get_pointer<cbridge::test::TestInterface::SomeStruct>(handle);\n"
                    + "    return static_cast<cbridge_test_TestTypeCollection_TestEnum>(struct_pointer->cppFieldName);\n"
                    + "}\n")
            .expect(
                "void cbridge_test_TestInterface_SomeStruct_swiftFieldName_set(_baseRef handle, cbridge_test_TestTypeCollection_TestEnum swiftFieldName) {\n"
                    + "    get_pointer<cbridge::test::TestInterface::SomeStruct>(handle)->cppFieldName = static_cast<cbridge::test::TestEnum>(swiftFieldName);\n"
                    + "}\n")
            .build();

    CInterface cModel = generator.buildCBridgeModel(francaInterface);

    expectedHeader.assertMatches(CBridgeGenerator.generateHeaderContent(cModel));
    expectedImplementation.assertMatches(CBridgeGenerator.generateImplementationContent(cModel));
  }

  @Test
  public void createsMethodWithExternalEnum() {
    FEnumerationType francaEnum = mockEnumType();
    when(francaEnum.eContainer()).thenReturn(francaTypeCollection);
    when(francaTypeCollection.eContainer()).thenReturn(francaModel);

    when(francaArgument1.getName()).thenReturn("input");
    when(francaArgument1.getType()).thenReturn(francaTypeRef1);
    when(francaTypeRef1.getDerived()).thenReturn(francaEnum);
    inputArguments.add(francaArgument1);

    when(francaArgument2.getName()).thenReturn("output");
    when(francaArgument2.getType()).thenReturn(francaTypeRef2);
    when(francaTypeRef2.getDerived()).thenReturn(francaEnum);
    outputArguments.add(francaArgument2);

    TemplateComparator expectedHeader =
        TemplateComparator.expect("#include \"CBRIDGE_PUBLIC_HEADER of TestTypeCollection\"\n")
            .expect(
                "cbridge_test_TestTypeCollection_TestEnum cbridge_test_TestInterface_functionName(cbridge_test_TestTypeCollection_TestEnum input);\n")
            .build();

    TemplateComparator expectedImplementation =
        TemplateComparator.expect(
                "cbridge_test_TestTypeCollection_TestEnum cbridge_test_TestInterface_functionName(cbridge_test_TestTypeCollection_TestEnum input) {\n"
                    + "    return static_cast<cbridge_test_TestTypeCollection_TestEnum>(::cbridge::test::TestInterface::function_name(static_cast<cbridge::test::TestEnum>(input)));\n"
                    + "}\n")
            .build();

    CInterface cModel = generator.buildCBridgeModel(francaInterface);

    expectedHeader.assertMatches(CBridgeGenerator.generateHeaderContent(cModel));
    expectedImplementation.assertMatches(CBridgeGenerator.generateImplementationContent(cModel));
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
    when(enumItem.getName()).thenReturn("field_1").thenReturn("field_2");
    enumItems.add(enumItem);
    enumItems.add(enumItem);
    return francaEnum;
  }

  @Test
  public void createAttributeAccessors() {
    methods.clear();
    FAttribute francaAttribute = mock(FAttribute.class);
    ArrayEList<FAttribute> attributes = new ArrayEList<>();
    attributes.add(francaAttribute);
    when(francaInterface.getAttributes()).thenReturn(attributes);
    when(francaAttribute.eContainer()).thenReturn(francaInterface);
    when(francaAttribute.getName()).thenReturn("ATTRIBUTE_NAME");
    when(francaAttribute.getType()).thenReturn(francaTypeRef1);
    when(francaTypeRef1.getPredefined()).thenReturn(FBasicTypeId.BYTE_BUFFER);

    TemplateComparator expectedHeader =
        TemplateComparator.expect(BYTE_ARRAY_INCLUDE)
            .expect(STD_INT_INCLUDE)
            .expect("_baseRef cbridge_test_TestInterface_attributeName_get(_baseRef _instance);\n")
            .expect(
                "void cbridge_test_TestInterface_attributeName_set(_baseRef _instance, const uint8_t* newValue_ptr, int64_t newValue_size);\n")
            .build();

    TemplateComparator expectedImplementation =
        TemplateComparator.expect(STD_NEW_INCLUDE)
            .expect(
                "_baseRef cbridge_test_TestInterface_attributeName_get(_baseRef _instance) {\n"
                    + "    return {new std::vector<uint8_t>(get_pointer<std::shared_ptr<cbridge::test::TestInterface>>(_instance)->get()->get_attribute_name())};\n"
                    + "}\n")
            .expect(
                "void cbridge_test_TestInterface_attributeName_set(_baseRef _instance, const uint8_t* newValue_ptr, int64_t newValue_size) {\n"
                    + "    return get_pointer<std::shared_ptr<cbridge::test::TestInterface>>(_instance)->get()->set_attribute_name(std::vector<uint8_t>(newValue_ptr, newValue_ptr + newValue_size));\n"
                    + "}\n")
            .build();

    CInterface cModel = generator.buildCBridgeModel(francaInterface);

    expectedHeader.assertMatches(CBridgeGenerator.generateHeaderContent(cModel));
    expectedImplementation.assertMatches(CBridgeGenerator.generateImplementationContent(cModel));
  }
}
