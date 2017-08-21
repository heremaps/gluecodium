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

import com.here.ivi.api.generator.common.java.templates.JavaCopyrightHeaderTemplate;
import com.here.ivi.api.generator.common.jni.templates.JniImplementationTemplate;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cppmodel.CppPrimitiveTypeRef;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType.Type;
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
      Collections.singletonList(Include.createInternalInclude("stub/libhello/TestClassStub.h"));
  private static final String BASE_PARAMETER_NAME = "intParam";
  private static final String JNI_PARAMETER_NAME = "j" + BASE_PARAMETER_NAME;
  private static final String COPYRIGHT_NOTICE = JavaCopyrightHeaderTemplate.generate() + "\n";
  private static final String JNI_HEADER_INCLUDE = "#include \"stub/libhello/TestClassStub.h\"\n";
  private static final String EXTERN_C = "\nextern \"C\" {\n";
  private static final String END_OF_FILE = "\n}\n";
  private static final List<String> NAMESPACES = Arrays.asList("com", "here", "ivi", "test");

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

  private static JniMethod createJniMethod(String methodName, JniContainer theModel) {

    JavaPrimitiveType javaPrimitiveType = new JavaPrimitiveType(Type.INT);
    CppPrimitiveTypeRef cppPrimitiveType = new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.INT8);

    JniMethod result = new JniMethod();
    result.owningContainer = theModel;
    result.javaMethodName = methodName;
    result.cppMethodName = methodName;
    result.javaReturnType = new JavaPrimitiveType(Type.INT);
    result.cppReturnType = new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.INT8);
    result.parameters.add(
        new JniParameter(BASE_PARAMETER_NAME, javaPrimitiveType, cppPrimitiveType));

    return result;
  }

  private String expectedGeneratedJNIMethod(String methodName) {
    return expectedGeneratedJNIMethod(methodName, false);
  }

  private String expectedGeneratedJNIMethod(String methodName, boolean isVoidMethod) {
    String returnType = isVoidMethod ? "\nvoid\n" : "\njint\n";
    String methodBody =
        "Java_com_here_ivi_test_TestClass_"
            + methodName
            + "(JNIEnv* env, jobject jinstance, jint "
            + JNI_PARAMETER_NAME
            + ")\n"
            + "{\n"
            + "  int8_t "
            + BASE_PARAMETER_NAME
            + ";\n"
            + "  "
            + BASE_PARAMETER_NAME
            + " = "
            + JNI_PARAMETER_NAME
            + ";\n";

    return returnType + methodBody + expectedMethodResultBlock(methodName, isVoidMethod);
  }

  private String expectedMethodResultBlock(String methodName, boolean isVoidMethod) {
    String callOnStub =
        isVoidMethod
            ? "  com::here::ivi::test::CppClass::"
            : "  auto result = com::here::ivi::test::CppClass::";
    String returnLine = isVoidMethod ? "" : "  return result;\n";

    return callOnStub + methodName + "(" + BASE_PARAMETER_NAME + ");\n" + returnLine + "}\n";
  }

  @Test
  public void generateWithEmptyIncludes() {
    jniContainer.includes.clear();

    String generatedImplementation = JniImplementationTemplate.generate(jniContainer);

    assertTrue(
        "At least the JNI header should be included, otherwise the JNI implementation "
            + "would not compile",
        generatedImplementation.isEmpty());
  }

  @Test
  public void generateWithMultipleIncludes() {
    jniContainer.includes.add(Include.createInternalInclude("base_api_header.h"));

    String generatedImplementation = JniImplementationTemplate.generate(jniContainer);

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
    String generatedImplementation = JniImplementationTemplate.generate(null);

    assertTrue(generatedImplementation.isEmpty());
  }

  @Test
  public void generateWithNoMethods() {
    String generatedImplementation = JniImplementationTemplate.generate(jniContainer);

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

    jniContainer.methods.add(createJniMethod("method1", jniContainer));
    String generatedImplementation = JniImplementationTemplate.generate(jniContainer);

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

    jniContainer.methods.add(createJniMethod("method1", jniContainer));
    jniContainer.methods.add(createJniMethod("method2", jniContainer));

    String generatedImplementation = JniImplementationTemplate.generate(jniContainer);

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

    JniMethod voidMethod = createJniMethod("testMethod", jniContainer);
    voidMethod.javaReturnType = new JavaPrimitiveType(Type.VOID);
    voidMethod.cppReturnType = new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.VOID);
    jniContainer.methods.add(voidMethod);

    String generatedImplementation = JniImplementationTemplate.generate(jniContainer);

    assertEquals(
        COPYRIGHT_NOTICE
            + JNI_HEADER_INCLUDE
            + "#include \""
            + JniNameRules.getConversionHeaderFileName()
            + "\"\n"
            + EXTERN_C
            + expectedGeneratedJNIMethod("testMethod", true)
            + END_OF_FILE,
        generatedImplementation);
  }
}
