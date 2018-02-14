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
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.ivi.api.generator.cbridge.CArrayMapper;
import com.here.ivi.api.generator.cbridge.CBridgeGenerator;
import com.here.ivi.api.generator.cbridge.CTypeMapper;
import com.here.ivi.api.generator.cbridge.CppTypeInfo;
import com.here.ivi.api.generator.cbridge.CppTypeInfo.TypeCategory;
import com.here.ivi.api.model.cbridge.*;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.test.TemplateComparator;
import com.here.ivi.api.test.TemplateComparison;
import java.util.*;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FModelElement;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.TemporaryFolder;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class CBridgeImplementationTemplateTest {
  @Rule public final TemporaryFolder tempFolder = new TemporaryFolder();

  public String generate(final CInterface iface) {
    return CBridgeGenerator.generateImplementationContent(iface);
  }

  @Test
  public void systemInclude() {
    CInterface cInterface = new CInterface("");
    cInterface.implementationIncludes.add(Include.createSystemInclude("header.h"));
    final String expected = "#include <header.h>\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void projectInclude() {
    CInterface cInterface = new CInterface("");
    cInterface.implementationIncludes.add(Include.createInternalInclude("header.h"));
    final String expected = "#include \"header.h\"\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void function() {
    CInterface cInterface = new CInterface("");
    cInterface.functions.add(
        CFunction.builder("functionName").delegateCall("functionDelegate").build());
    final String expected = "void functionName() {\n" + "    return functionDelegate();\n" + "}\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void functionWithOneParameter() {
    CInterface cInterface = new CInterface("");
    cInterface.functions.add(
        CFunction.builder("parameterFunctionName")
            .parameters(
                Collections.singletonList(new CParameter("one", new CppTypeInfo(CType.INT32))))
            .delegateCall("delegator")
            .build());
    final String expected =
        "void parameterFunctionName(int32_t one) {\n" + "    return delegator(one);\n" + "}\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void functionWithTwoParameters() {
    CInterface cInterface = new CInterface("");
    final CParameter first = new CParameter("first", new CppTypeInfo(CType.INT16));
    final CParameter second = new CParameter("second", new CppTypeInfo(CType.DOUBLE));
    final CFunction doubleFunction =
        CFunction.builder("doubleFunction")
            .parameters(Arrays.asList(first, second))
            .delegateCall("namespacy::classy::doubleFunction")
            .build();
    cInterface.functions.add(doubleFunction);
    final String expected =
        "void doubleFunction(int16_t first, double second) {\n"
            + "    return namespacy::classy::doubleFunction(first, second);\n"
            + "}\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void functionWithReturnValue() {
    CInterface cInterface = new CInterface("");
    cInterface.functions.add(
        CFunction.builder("returner")
            .returnType(new CppTypeInfo(CType.FLOAT))
            .delegateCall("delegate")
            .build());
    final String expected = "float returner() {\n" + "    return delegate();\n" + "}\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void nestedStructFieldCreatesGetterOnly() {
    CInterface cInterface = new CInterface("");
    final CType type = new CType("nameRef");
    CStruct struct = new CStruct("name", "baseName", new CppTypeInfo(type));
    CField field =
        new CField(
            "structField",
            "baseApiFieldName",
            new CppTypeInfo(new CType("NestedRef"), TypeCategory.STRUCT));
    struct.fields.add(field);
    cInterface.structs.add(struct);

    final String expected =
        "_baseRef name_create() {\n"
            + "    return reinterpret_cast<_baseRef>( new baseName() );\n"
            + "}\n"
            + "void name_release(_baseRef handle) {\n"
            + "    delete get_pointer<nameRef>(handle);\n"
            + "}\n"
            + "NestedRef name_structField_get(_baseRef handle) {\n"
            + "    auto struct_pointer = get_pointer<nameRef>(handle);\n"
            + "    return reinterpret_cast<_baseRef>( &struct_pointer->baseApiFieldName );\n"
            + "}\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void stringFieldCreatesGetterAndSetter() {
    CInterface cInterface = new CInterface("");
    CType type = new CType("nameRef");
    CStruct struct = new CStruct("name", "baseName", new CppTypeInfo(type));
    CField field = new CField("stringField", "baseApiFieldName", CppTypeInfo.STRING);
    struct.fields.add(field);
    cInterface.structs.add(struct);

    final String expected =
        "_baseRef name_create() {\n"
            + "    return reinterpret_cast<_baseRef>( new baseName() );\n"
            + "}\n"
            + "void name_release(_baseRef handle) {\n"
            + "    delete get_pointer<nameRef>(handle);\n"
            + "}\n"
            + "_baseRef name_stringField_get(_baseRef handle) {\n"
            + "    auto struct_pointer = get_pointer<nameRef>(handle);\n"
            + "    return reinterpret_cast<_baseRef>( &struct_pointer->baseApiFieldName );\n"
            + "}\n"
            + "void name_stringField_set(_baseRef handle, const char* stringField) {\n"
            + "    get_pointer<nameRef>(handle)->baseApiFieldName.assign(stringField);\n"
            + "}\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void primitiveFieldCreatesGetterAndSetter() {
    CInterface cInterface = new CInterface("");
    CType type = new CType("nameRef");
    CStruct struct = new CStruct("name", "baseName", new CppTypeInfo(type));
    CField field = new CField("floatField", "baseApiFieldName", new CppTypeInfo(CType.FLOAT));
    struct.fields.add(field);
    cInterface.structs.add(struct);

    final String expected =
        "_baseRef name_create() {\n"
            + "    return reinterpret_cast<_baseRef>( new baseName() );\n"
            + "}\n"
            + "void name_release(_baseRef handle) {\n"
            + "    delete get_pointer<nameRef>(handle);\n"
            + "}\n"
            + "float name_floatField_get(_baseRef handle) {\n"
            + "    auto struct_pointer = get_pointer<nameRef>(handle);\n"
            + "    return struct_pointer->baseApiFieldName;\n"
            + "}\n"
            + "void name_floatField_set(_baseRef handle, float floatField) {\n"
            + "    get_pointer<nameRef>(handle)->baseApiFieldName = floatField;\n"
            + "}\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void functionWithEnumParameterInAndOut() {
    CInterface cInterface = new CInterface("");
    cInterface.functions.add(
        CFunction.builder("parameterFunctionName")
            .parameters(
                Collections.singletonList(
                    new CParameter("one", new CppTypeInfo(new CType("ENUM"), TypeCategory.ENUM))))
            .delegateCall("delegator")
            .returnType(new CppTypeInfo(new CType("RET_ENUM"), TypeCategory.ENUM))
            .build());
    final String expected =
        "RET_ENUM parameterFunctionName(ENUM one) {\n"
            + "    return static_cast<RET_ENUM>(delegator(static_cast<ENUM>(one)));\n"
            + "}\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void generateInstanceWithinStruct() {
    CInterface cInterface = new CInterface("");
    CType type = new CType("SomeStructRef");
    CStruct struct = new CStruct("memberStruct", "baseName", new CppTypeInfo(type));
    CField field =
        new CField(
            "instanceField",
            "baseApiFieldName",
            new CppTypeInfo(new CType("SomeClassRef"), TypeCategory.CLASS));
    struct.fields.add(field);
    cInterface.structs.add(struct);

    final String expected =
        "_baseRef memberStruct_create() {\n"
            + "    return reinterpret_cast<_baseRef>( new baseName() );\n"
            + "}\n"
            + "void memberStruct_release(_baseRef handle) {\n"
            + "    delete get_pointer<SomeStructRef>(handle);\n"
            + "}\n"
            + "SomeClassRef memberStruct_instanceField_get(_baseRef handle) {\n"
            + "    auto struct_pointer = get_pointer<SomeStructRef>(handle);\n"
            + "    return reinterpret_cast<_baseRef>( checked_pointer_copy(struct_pointer->baseApiFieldName) );\n"
            + "}\n"
            + "void memberStruct_instanceField_set(_baseRef handle, SomeClassRef instanceField) {\n"
            + "    get_pointer<SomeStructRef>(handle)->baseApiFieldName = *get_pointer<SomeClassRef>(instanceField);\n"
            + "}\n";
    final String generated = this.generate(cInterface);
    TemplateComparison.assertEqualImplementationContent(expected, generated);
  }

  @Test
  public void cppProxyForInterface() {
    CppTypeInfo selfType = mockSelfType();

    CInterface cInterface = new CInterface("Classy", selfType);
    final CParameter first = new CParameter("first", new CppTypeInfo(CType.INT16));
    final CParameter second = new CParameter("second", new CppTypeInfo(CType.DOUBLE));
    final CParameter third =
        new CParameter("myEnum", new CppTypeInfo(new CType("ENUM"), TypeCategory.ENUM));
    final CFunction doubleFunction =
        CFunction.builder("doubleFunction")
            .parameters(Arrays.asList(first, second))
            .delegateCall("namespacy::classy::doubleFunction")
            .build();
    final CFunction inhertitedEnumFunction =
        CFunction.builder("enumFunction")
            .parameters(Arrays.asList(third))
            .selfParameter(new CInParameter("self", null))
            .functionName("full_function_name")
            .build();
    cInterface.functions.add(doubleFunction);
    cInterface.inheritedFunctions.add(inhertitedEnumFunction);

    cInterface.functionTableName = "ClassTable";
    assertTrue(cInterface.isInterface());

    TemplateComparator expected =
        TemplateComparator.expect(
                "class ClassyProxy : public "
                    + "std::shared_ptr<some::package::SomeClass>::element_type, public "
                    + "CachedProxyBase<ClassyProxy> {\n"
                    + "public:\n"
                    + "    using function_table_t = ClassTable;\n"
                    + "    ClassyProxy(ClassTable&& functions)\n"
                    + "     : mFunctions(std::move(functions))\n"
                    + "    {\n"
                    + "    }\n"
                    + "    virtual ~ClassyProxy() {\n"
                    + "        mFunctions.release(mFunctions.swift_pointer);\n"
                    + "    }\n"
                    + "    void full_function_name(const ENUM myEnum) override {\n"
                    + "        return mFunctions.enumFunction(mFunctions.swift_pointer, "
                    + "static_cast<uint32_t>(myEnum));\n"
                    + "    }\n"
                    + "private:\n"
                    + "    function_table_t mFunctions;\n"
                    + "};\n")
            .expect(
                "_baseRef Classy_createProxy(ClassTable functionTable) {\n"
                    + "    auto proxy = ClassyProxy::get_proxy(std::move(functionTable));\n"
                    + "    if (proxy) {\n"
                    + "        return reinterpret_cast<_baseRef>( new std::shared_ptr<some::package::SomeClass>(std::move(proxy)) );\n"
                    + "    } else {\n"
                    + "        return 0;\n"
                    + "    }\n"
                    + "}")
            .build();

    final String generated = this.generate(cInterface);
    expected.assertMatches(generated);
  }

  @Test
  public void cppProxyForInterfaceWithMethodTakingArray() {
    CppTypeInfo selfType = mockSelfType();

    CInterface cInterface = new CInterface("Classy", selfType);
    final CParameter first =
        new CParameter("someArray", CArrayMapper.createArrayReference(CppTypeInfo.STRING));
    final CFunction doubleFunction =
        CFunction.builder("doubleFunction")
            .functionName("full_function_name")
            .selfParameter(new CInParameter("_instance", selfType))
            .parameters(Arrays.asList(first))
            .delegateCall("namespacy::classy::arrayFunction")
            .build();
    cInterface.functions.add(doubleFunction);
    cInterface.functionTableName = "ClassTable";

    TemplateComparator expected =
        TemplateComparator.expect(
                "void doubleFunction(_baseRef _instance, _baseRef someArray) {\n"
                    + "    return get_pointer<std::shared_ptr<some::package::SomeClass>>(_instance)->get()->full_function_name(*get_pointer<std::vector<std::string>>(someArray));\n"
                    + "}\n")
            .expect(
                "    void full_function_name(const std::vector<std::string>& someArray) override {\n"
                    + "        return mFunctions.doubleFunction(mFunctions.swift_pointer, reinterpret_cast<_baseRef>( new std::vector<std::string>(someArray) ));\n"
                    + "    }")
            .build();

    final String generated = this.generate(cInterface);
    expected.assertMatches(generated);
  }

  private CppTypeInfo mockSelfType() {
    IncludeResolver resolver = mock(IncludeResolver.class);
    FModelElement francaInterface = mock(FInterface.class);
    FModel francaParent = mock(FModel.class);
    when(francaInterface.getName()).thenReturn("SomeClass");
    when(francaInterface.eContainer()).thenReturn(francaParent);
    when(francaParent.getName()).thenReturn("some.package");
    return CTypeMapper.createCustomTypeInfo(
        resolver, francaInterface, CppTypeInfo.TypeCategory.CLASS);
  }

  @Test
  public void functionReturningOnlyError() {
    CppTypeInfo error = new CppTypeInfo(new CType("ERROR"), CppTypeInfo.TypeCategory.ENUM);
    CFunction function =
        CFunction.builder("functionName").delegateCall("delegateToCall").error(error).build();
    CInterface cInterface = new CInterface("");
    cInterface.functions.add(function);

    TemplateComparator expected =
        TemplateComparator.expect(
                "ERROR functionName() {\n" + "    return delegateToCall();\n" + "}\n")
            .build();
    final String generated = this.generate(cInterface);

    expected.assertMatches(generated);
  }

  @Test
  public void functionReturningValueAndError() {
    CppTypeInfo error = new CppTypeInfo(new CType("ERROR"), CppTypeInfo.TypeCategory.ENUM);
    CFunction function =
        CFunction.builder("functionName")
            .error(error)
            .delegateCall("delegateToCall")
            .returnType(new CppTypeInfo(CType.FLOAT))
            .build();
    CInterface cInterface = new CInterface("");
    cInterface.functions.add(function);

    final String generated = this.generate(cInterface);

    TemplateComparator expected =
        TemplateComparator.expect(
                "functionName_result functionName() {\n"
                    + "    auto&& RESULT = delegateToCall();\n"
                    + "    if (RESULT.has_value()) {\n"
                    + "        return {true, .returned_value = RESULT.safe_value()};\n"
                    + "    } else {\n"
                    + "        return {false, .error_code = RESULT.error()};\n"
                    + "    }\n"
                    + "}\n")
            .build();

    expected.assertMatches(generated);
  }
}
