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

package com.here.ivi.api.generator.jni;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cppmodel.CppComplexTypeRef;
import com.here.ivi.api.model.cppmodel.CppPrimitiveTypeRef;
import com.here.ivi.api.model.cppmodel.CppTemplateTypeRef;
import com.here.ivi.api.model.javamodel.JavaArrayType;
import com.here.ivi.api.model.javamodel.JavaCustomType;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.jni.*;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JniImplementationTemplateTest {

  private static final String TEMPLATE_NAME = "jni/Implementation";

  private static final String BASE_PARAMETER_NAME = "intParam";
  private static final String JNI_PARAMETER_NAME = "j" + BASE_PARAMETER_NAME;
  private static final String COPYRIGHT_NOTICE =
      TemplateEngine.render("java/CopyrightHeader", null);
  private static final String JNI_HEADER_INCLUDE = "#include \"cpp/libhello/TestClass.h\"\n";
  private static final String EXTERN_C = "\nextern \"C\" {\n";
  private static final String END_OF_FILE =
      "\nvoid\n"
          + "Java_com_here_ivi_test_TestClass_disposeNativeHandle("
          + "JNIEnv* _jenv, jobject _jinstance, jlong _jpointerRef)\n"
          + "{\n"
          + "    delete reinterpret_cast<"
          + "std::shared_ptr<::com::here::ivi::test::CppClass>*> (_jpointerRef);\n"
          + "}\n}\n";
  private static final List<String> NAMESPACES = Arrays.asList("com", "here", "ivi", "test");
  private static final String CALL_STATIC = "::com::here::ivi::test::CppClass::";
  private static final String CALL_SHARED_POINTER = "(*pInstanceSharedPointer)->";
  private static final String RETRIEVE_LONG_PTR =
      "    auto pointerAsLong = get_long_field(_jenv, _jenv->GetObjectClass(_jinstance), _jinstance, \"nativeHandle\");\n";
  private static final String CAST_LONG_TO_SHARED_PTR =
      "    auto pInstanceSharedPointer = reinterpret_cast<std::shared_ptr<::com::here::ivi::test::CppClass>*> (pointerAsLong);\n";
  private static final String CONVERSION_HEADER_INCLUDE =
      "#include \"" + JniNameRules.getStructConversionHeaderFileName() + "\"\n";

  private static final String PROXYCONVERSION_HEADER_INCLUDE =
      "#include " + "\"android/jni/ProxyConversion.h\"\n";
  private static final String ENUMCONVERSION_HEADER_INCLUDE =
      "#include " + "\"android/jni/EnumConversion.h\"\n";
  private static final String ARRAYCONVERSION_HEADER_INCLUDE =
      "#include " + "\"android/jni/ArrayConversionUtils.h\"\n";
  private static final String INSTANCE_CONVERSION_HEADER_INCLUDE =
      "#include \"" + JniNameRules.getInstanceConversionHeaderFileName() + "\"\n";
  private static final String JNI_TEST_CLASS_METHOD_PREFIX = "Java_com_here_ivi_test_TestClass_";

  private static final String EXPECTED_PREFIX =
      COPYRIGHT_NOTICE
          + JNI_HEADER_INCLUDE
          + INSTANCE_CONVERSION_HEADER_INCLUDE
          + CONVERSION_HEADER_INCLUDE
          + PROXYCONVERSION_HEADER_INCLUDE
          + ENUMCONVERSION_HEADER_INCLUDE
          + ARRAYCONVERSION_HEADER_INCLUDE
          + EXTERN_C;

  private final JniType jniIntType =
      JniType.createType(JavaPrimitiveType.INT, CppPrimitiveTypeRef.INT8);
  private final JniContainer jniContainer =
      JniContainer.createInterfaceContainer(NAMESPACES, NAMESPACES, "TestClass", "CppClass");
  private final JavaCustomType javaCustomType =
      JavaCustomType.builder("JavaFooEnum")
          .packageNames(NAMESPACES)
          .className("TestClass")
          .className("JavaFooEnum")
          .build();
  private final CppComplexTypeRef cppComplexTypeRef =
      new CppComplexTypeRef.Builder(String.join("::", NAMESPACES) + "::CppClass::CppFooEnum")
          .build();
  private final JniType jniEnum = JniType.createType(javaCustomType, cppComplexTypeRef);

  @Before
  public void setUp() {
    jniContainer.includes.addAll(
        Collections.singletonList(Include.createInternalInclude("cpp/libhello/TestClass.h")));
  }

  private JniMethod createJniMethod(String methodName, boolean isStatic) {

    JniMethod result =
        new JniMethod.Builder(methodName, methodName)
            .returnType(jniIntType)
            .isStatic(isStatic)
            .build();
    result.parameters.add(new JniParameter(BASE_PARAMETER_NAME, jniIntType));

    return result;
  }

  private JniMethod createJniVoidMethod(String methodName, boolean isStatic) {

    JniMethod result = new JniMethod.Builder(methodName, methodName).isStatic(isStatic).build();
    result.parameters.add(new JniParameter(BASE_PARAMETER_NAME, jniIntType));

    return result;
  }

  private String expectedGeneratedJNIMethod(String methodName) {
    return expectedGeneratedJNIMethod(methodName, true, false, "jint");
  }

  private String expectedGeneratedJNIMethod(
      String methodName, boolean isStatic, boolean isVoidMethod, String returnTypeName) {
    String methodBody =
        JNI_TEST_CLASS_METHOD_PREFIX
            + methodName
            + "(JNIEnv* _jenv, jobject _jinstance, jint "
            + JNI_PARAMETER_NAME
            + ")\n"
            + "{\n"
            + "    int8_t "
            + BASE_PARAMETER_NAME
            + " = "
            + JNI_PARAMETER_NAME
            + ";\n";

    return "\n"
        + returnTypeName
        + "\n"
        + methodBody
        + expectedMethodResultBlock(methodName, isStatic, isVoidMethod);
  }

  private String expectedMethodResultBlock(
      String methodName, boolean isStatic, boolean isVoidMethod) {
    String expectedMethodCaller = isStatic ? CALL_STATIC : CALL_SHARED_POINTER;
    String pointerCasting = isStatic ? "" : RETRIEVE_LONG_PTR + CAST_LONG_TO_SHARED_PTR;
    String callPrefix =
        pointerCasting
            + (isVoidMethod
                ? "    " + expectedMethodCaller
                : "    auto result = " + expectedMethodCaller);
    String returnLine = isVoidMethod ? "" : "    return result;\n";

    return callPrefix + methodName + "(" + BASE_PARAMETER_NAME + ");\n" + returnLine + "}\n";
  }

  @Test
  public void generateWithEmptyIncludes() {
    jniContainer.includes.clear();

    String generatedImplementation = TemplateEngine.render(TEMPLATE_NAME, jniContainer);

    assertTrue(
        "At least the JNI header should be included, otherwise the JNI implementation "
            + "would not compile",
        generatedImplementation.isEmpty());
  }

  @Test
  public void generateWithMultipleIncludes() {
    jniContainer.includes.add(Include.createInternalInclude("base_api_header.h"));

    String generatedImplementation = TemplateEngine.render(TEMPLATE_NAME, jniContainer);

    assertEquals(
        COPYRIGHT_NOTICE
            + JNI_HEADER_INCLUDE
            + "#include \"base_api_header.h\"\n"
            + INSTANCE_CONVERSION_HEADER_INCLUDE
            + CONVERSION_HEADER_INCLUDE
            + PROXYCONVERSION_HEADER_INCLUDE
            + ENUMCONVERSION_HEADER_INCLUDE
            + ARRAYCONVERSION_HEADER_INCLUDE
            + EXTERN_C
            + END_OF_FILE,
        generatedImplementation);
  }

  @Test
  public void generateWithNullJniContainer() {
    String generatedImplementation = TemplateEngine.render(TEMPLATE_NAME, null);

    assertTrue(generatedImplementation.isEmpty());
  }

  @Test
  public void generateWithNoMethods() {
    String generatedImplementation = TemplateEngine.render(TEMPLATE_NAME, jniContainer);

    assertEquals(EXPECTED_PREFIX + END_OF_FILE, generatedImplementation);
  }

  @Test
  public void generateWithOneMethod() {

    jniContainer.add(createJniMethod("method1", true));
    String generatedImplementation = TemplateEngine.render(TEMPLATE_NAME, jniContainer);

    assertEquals(
        EXPECTED_PREFIX + expectedGeneratedJNIMethod("method1") + END_OF_FILE,
        generatedImplementation);
  }

  @Test
  public void generateWithMultipleMethods() {

    jniContainer.add(createJniMethod("method1", true));
    jniContainer.add(createJniMethod("method2", true));

    String generatedImplementation = TemplateEngine.render(TEMPLATE_NAME, jniContainer);

    assertEquals(
        EXPECTED_PREFIX
            + expectedGeneratedJNIMethod("method1")
            + expectedGeneratedJNIMethod("method2")
            + END_OF_FILE,
        generatedImplementation);
  }

  @Test
  public void generateVoidMethod() {

    JniMethod voidMethod = createJniVoidMethod("testMethod", true);
    jniContainer.add(voidMethod);

    String generatedImplementation = TemplateEngine.render(TEMPLATE_NAME, jniContainer);

    assertEquals(
        EXPECTED_PREFIX
            + expectedGeneratedJNIMethod("testMethod", true, true, "void")
            + END_OF_FILE,
        generatedImplementation);
  }

  @Test
  public void generateInstanceMethod() {
    jniContainer.add(createJniMethod("instanceMethod", false));

    String generatedImplementation = TemplateEngine.render(TEMPLATE_NAME, jniContainer);

    assertEquals(
        EXPECTED_PREFIX
            + expectedGeneratedJNIMethod("instanceMethod", false, false, "jint")
            + END_OF_FILE,
        generatedImplementation);
  }

  @Test
  public void generateInstanceVoidMethod() {
    JniMethod instanceVoidMethod = createJniVoidMethod("instanceVoidMethod", false);
    jniContainer.add(instanceVoidMethod);

    String generatedImplementation = TemplateEngine.render(TEMPLATE_NAME, jniContainer);

    assertEquals(
        EXPECTED_PREFIX
            + expectedGeneratedJNIMethod("instanceVoidMethod", false, true, "void")
            + END_OF_FILE,
        generatedImplementation);
  }

  @Test
  public void generateWithOneMethodWithArrayReturnType() {
    JniType jniType =
        JniType.createType(
            JavaArrayType.BYTE_ARRAY,
            CppTemplateTypeRef.create(
                CppTemplateTypeRef.TemplateClass.VECTOR, CppPrimitiveTypeRef.UINT8),
            false);
    JniMethod jniMethod =
        new JniMethod.Builder("method1", "method1").returnType(jniType).isStatic(true).build();
    jniMethod.parameters.add(new JniParameter(BASE_PARAMETER_NAME, jniIntType));
    jniContainer.add(jniMethod);

    String generatedImplementation = TemplateEngine.render(TEMPLATE_NAME, jniContainer);

    String methodBody =
        JNI_TEST_CLASS_METHOD_PREFIX
            + "method1(JNIEnv* _jenv, jobject _jinstance, jint "
            + JNI_PARAMETER_NAME
            + ")\n"
            + "{\n"
            + "    int8_t "
            + BASE_PARAMETER_NAME
            + " = "
            + JNI_PARAMETER_NAME
            + ";\n";

    assertEquals(
        EXPECTED_PREFIX
            + "\njbyteArray\n"
            + methodBody
            + "    auto result = "
            + CALL_STATIC
            + "method1("
            + BASE_PARAMETER_NAME
            + ");\n"
            + "    return here::internal::convert_to_jni_array(_jenv, result);\n"
            + "}\n"
            + END_OF_FILE,
        generatedImplementation);
  }

  @Test
  public void generateWithOneMethodWithExceptionName() {
    JniMethod jniMethod =
        new JniMethod.Builder("method1", "method1")
            .isStatic(true)
            .exception(new JniException("foo/bar/PanicAttack", jniEnum))
            .build();
    jniContainer.add(jniMethod);

    String generatedImplementation = TemplateEngine.render(TEMPLATE_NAME, jniContainer);

    String expected =
        EXPECTED_PREFIX
            + "\nvoid\n"
            + JNI_TEST_CLASS_METHOD_PREFIX
            + "method1(JNIEnv* _jenv, jobject _jinstance)\n"
            + "{\n"
            + "    auto nativeCallResult = ::com::here::ivi::test::CppClass::method1();\n"
            + "    auto errorCode = nativeCallResult.code().code();\n"
            + "    if (errorCode != hf::errors::NONE)\n"
            + "    {\n"
            + "        auto nEnumValue = static_cast<com::here::ivi::test::CppClass::CppFooEnum>(errorCode);\n"
            + "        auto jEnumValue = here::internal::convert_to_jni(_jenv, nEnumValue);\n"
            + "        auto exceptionClass = _jenv->FindClass(\"foo/bar/PanicAttack\");\n"
            + "        auto theConstructor = _jenv->GetMethodID(exceptionClass, \"<init>\","
            + " \"(Lcom/here/ivi/test/TestClass$JavaFooEnum;)V\");\n"
            + "        auto exception = _jenv->NewObject(exceptionClass, theConstructor, jEnumValue);\n"
            + "        _jenv->Throw(static_cast<jthrowable>(exception));\n"
            + "    }\n\n"
            + "}\n"
            + END_OF_FILE;
    assertEquals(expected, generatedImplementation);
  }

  @Test
  public void generateWithOneMethodWithReturnTypeAndExceptionName() {
    JniMethod jniMethod =
        new JniMethod.Builder("method1", "method1")
            .returnType(jniIntType)
            .isStatic(true)
            .exception(new JniException("foo/bar/PanicAttack", jniEnum))
            .build();
    jniContainer.add(jniMethod);

    String generatedImplementation = TemplateEngine.render(TEMPLATE_NAME, jniContainer);

    String expected =
        EXPECTED_PREFIX
            + "\njint\n"
            + JNI_TEST_CLASS_METHOD_PREFIX
            + "method1(JNIEnv* _jenv, jobject _jinstance)\n"
            + "{\n"
            + "    auto nativeCallResult = ::com::here::ivi::test::CppClass::method1();\n"
            + "    auto errorCode = nativeCallResult.error().code().code();\n"
            + "    if (!nativeCallResult.has_value())\n"
            + "    {\n"
            + "        auto nEnumValue = static_cast<com::here::ivi::test::CppClass::CppFooEnum>(errorCode);\n"
            + "        auto jEnumValue = here::internal::convert_to_jni(_jenv, nEnumValue);\n"
            + "        auto exceptionClass = _jenv->FindClass(\"foo/bar/PanicAttack\");\n"
            + "        auto theConstructor = _jenv->GetMethodID(exceptionClass, \"<init>\","
            + " \"(Lcom/here/ivi/test/TestClass$JavaFooEnum;)V\");\n"
            + "        auto exception = _jenv->NewObject(exceptionClass, theConstructor, jEnumValue);\n"
            + "        _jenv->Throw(static_cast<jthrowable>(exception));\n"
            + "        return nativeCallResult.safe_value();\n"
            + "    }\n"
            + "    auto result = nativeCallResult.safe_value();\n\n"
            + "    return result;\n"
            + "}\n"
            + END_OF_FILE;
    assertEquals(expected, generatedImplementation);
  }
}
