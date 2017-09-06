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

package com.here.ivi.api.generator.common.jni;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cppmodel.CppPrimitiveTypeRef;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType.Type;
import com.here.ivi.api.model.jni.JniContainer;
import com.here.ivi.api.model.jni.JniMethod;
import com.here.ivi.api.model.jni.JniParameter;
import com.here.ivi.api.model.jni.JniType;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JniImplementationTemplateTest {
  private static final List<Include> INCLUDE_LIST =
      Collections.singletonList(Include.createInternalInclude("stub/libhello/TestClass.h"));
  private static final String BASE_PARAMETER_NAME = "intParam";
  private static final String JNI_PARAMETER_NAME = "j" + BASE_PARAMETER_NAME;
  private static final String COPYRIGHT_NOTICE =
      TemplateEngine.render("java/CopyrightHeader", null);
  private static final String JNI_HEADER_INCLUDE = "#include \"stub/libhello/TestClass.h\"\n";
  private static final String EXTERN_C = "\nextern \"C\" {\n";
  private static final String END_OF_FILE = "\n}\n";
  private static final List<String> NAMESPACES = Arrays.asList("com", "here", "ivi", "test");
  private static final String CALL_STATIC = "com::here::ivi::test::CppClass::";
  private static final String CALL_SHARED_POINTER = "(*pInstanceSharedPointer)->";
  private static final String RETRIEVE_LONG_PTR =
      "    auto pointerAsLong = get_long_field(env, env->GetObjectClass(jinstance), jinstance, \"nativeHandle\");\n";
  private static final String CAST_LONG_TO_SHARED_PTR =
      "    auto pInstanceSharedPointer = reinterpret_cast < std::shared_ptr< ::com::here::ivi::test::CppClass >* > (pointerAsLong);\n";

  private JniContainer jniContainer;

  @Before
  public void setUp() {
    jniContainer = createJniContainer();
  }

  private static JniContainer createJniContainer() {
    JniContainer jniContainer =
        JniContainer.createInterfaceContainer(NAMESPACES, NAMESPACES, "TestClass", "CppClass");
    jniContainer.includes.addAll(INCLUDE_LIST);

    return jniContainer;
  }

  private static JniMethod createJniMethod(String methodName, boolean isStatic) {

    JniMethod result = new JniMethod();
    result.javaMethodName = methodName;
    result.cppMethodName = methodName;
    result.returnType =
        JniType.createType(
            new JavaPrimitiveType(Type.INT),
            new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.INT8));
    result.parameters.add(new JniParameter(BASE_PARAMETER_NAME, result.returnType));
    result.isStatic = isStatic;

    return result;
  }

  private String expectedGeneratedJNIMethod(String methodName) {
    return expectedGeneratedJNIMethod(methodName, true, false);
  }

  private String expectedGeneratedJNIMethod(
      String methodName, boolean isStatic, boolean isVoidMethod) {
    String returnType = isVoidMethod ? "\nvoid\n" : "\njint\n";
    String methodBody =
        "Java_com_here_ivi_test_TestClass_"
            + methodName
            + "(JNIEnv* env, jobject jinstance, jint "
            + JNI_PARAMETER_NAME
            + ")\n"
            + "{\n"
            + "    int8_t "
            + BASE_PARAMETER_NAME
            + " = "
            + JNI_PARAMETER_NAME
            + ";\n";

    return returnType + methodBody + expectedMethodResultBlock(methodName, isStatic, isVoidMethod);
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
    String returnLine = isVoidMethod ? "\n" : "    return result;\n";

    return callPrefix + methodName + "(" + BASE_PARAMETER_NAME + ");\n" + returnLine + "}\n";
  }

  @Test
  public void generateWithEmptyIncludes() {
    jniContainer.includes.clear();

    String generatedImplementation = TemplateEngine.render("jni/Implementation", jniContainer);

    assertTrue(
        "At least the JNI header should be included, otherwise the JNI implementation "
            + "would not compile",
        generatedImplementation.isEmpty());
  }

  @Test
  public void generateWithMultipleIncludes() {
    jniContainer.includes.add(Include.createInternalInclude("base_api_header.h"));

    String generatedImplementation = TemplateEngine.render("jni/Implementation", jniContainer);

    assertEquals(
        COPYRIGHT_NOTICE
            + JNI_HEADER_INCLUDE
            + "#include \"base_api_header.h\"\n"
            + "#include \""
            + JniNameRules.getConversionHeaderFileName()
            + "\"\n"
            + EXTERN_C
            + END_OF_FILE,
        generatedImplementation);
  }

  @Test
  public void generateWithNullJniContainer() {
    String generatedImplementation = TemplateEngine.render("jni/Implementation", null);

    assertTrue(generatedImplementation.isEmpty());
  }

  @Test
  public void generateWithNoMethods() {
    String generatedImplementation = TemplateEngine.render("jni/Implementation", jniContainer);

    assertEquals(
        COPYRIGHT_NOTICE
            + JNI_HEADER_INCLUDE
            + "#include \""
            + JniNameRules.getConversionHeaderFileName()
            + "\"\n"
            + EXTERN_C
            + END_OF_FILE,
        generatedImplementation);
  }

  @Test
  public void generateWithOneMethods() {

    jniContainer.add(createJniMethod("method1", true));
    String generatedImplementation = TemplateEngine.render("jni/Implementation", jniContainer);

    assertEquals(
        COPYRIGHT_NOTICE
            + JNI_HEADER_INCLUDE
            + "#include \""
            + JniNameRules.getConversionHeaderFileName()
            + "\"\n"
            + EXTERN_C
            + expectedGeneratedJNIMethod("method1")
            + END_OF_FILE,
        generatedImplementation);
  }

  @Test
  public void generateWithMultipleMethods() {

    jniContainer.add(createJniMethod("method1", true));
    jniContainer.add(createJniMethod("method2", true));

    String generatedImplementation = TemplateEngine.render("jni/Implementation", jniContainer);

    assertEquals(
        COPYRIGHT_NOTICE
            + JNI_HEADER_INCLUDE
            + "#include \""
            + JniNameRules.getConversionHeaderFileName()
            + "\"\n"
            + EXTERN_C
            + expectedGeneratedJNIMethod("method1")
            + expectedGeneratedJNIMethod("method2")
            + END_OF_FILE,
        generatedImplementation);
  }

  @Test
  public void generateVoidMethod() {

    JniMethod voidMethod = createJniMethod("testMethod", true);
    voidMethod.returnType = null;
    jniContainer.add(voidMethod);

    String generatedImplementation = TemplateEngine.render("jni/Implementation", jniContainer);

    assertEquals(
        COPYRIGHT_NOTICE
            + JNI_HEADER_INCLUDE
            + "#include \""
            + JniNameRules.getConversionHeaderFileName()
            + "\"\n"
            + EXTERN_C
            + expectedGeneratedJNIMethod("testMethod", true, true)
            + END_OF_FILE,
        generatedImplementation);
  }

  @Test
  public void generateInstanceMethod() {
    jniContainer.add(createJniMethod("instanceMethod", false));

    String generatedImplementation = TemplateEngine.render("jni/Implementation", jniContainer);

    assertEquals(
        COPYRIGHT_NOTICE
            + JNI_HEADER_INCLUDE
            + "#include \""
            + JniNameRules.getConversionHeaderFileName()
            + "\"\n"
            + EXTERN_C
            + expectedGeneratedJNIMethod("instanceMethod", false, false)
            + END_OF_FILE,
        generatedImplementation);
  }

  @Test
  public void generateInstanceVoidMethod() {
    JniMethod instanceVoidMethod = createJniMethod("instanceVoidMethod", false);
    instanceVoidMethod.returnType = null;
    jniContainer.add(instanceVoidMethod);

    String generatedImplementation = TemplateEngine.render("jni/Implementation", jniContainer);

    assertEquals(
        COPYRIGHT_NOTICE
            + JNI_HEADER_INCLUDE
            + "#include \""
            + JniNameRules.getConversionHeaderFileName()
            + "\"\n"
            + EXTERN_C
            + expectedGeneratedJNIMethod("instanceVoidMethod", false, true)
            + END_OF_FILE,
        generatedImplementation);
  }
}
