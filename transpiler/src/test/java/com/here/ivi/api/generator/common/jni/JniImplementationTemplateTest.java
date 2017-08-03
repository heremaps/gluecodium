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

import com.here.ivi.api.generator.common.jni.templates.JniImplementationTemplate;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cppmodel.CppPrimitiveTypeRef;
import com.here.ivi.api.model.javamodel.JavaClass;
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
public class JniImplementationTemplateTest {

  private static final String BASE_PARAMETER_NAME = "intParam";
  private static final String JNI_PARAMETER_NAME = "j" + BASE_PARAMETER_NAME;

  private static JniModel createJniModel() {
    JniModel jniModel = new JniModel();
    jniModel.cppClassName = "CppClass";
    jniModel.cppNameSpaces = Arrays.asList("com", "here", "ivi", "test");
    jniModel.javaPackages = Arrays.asList("com", "here", "ivi", "test");
    jniModel.javaClass = new JavaClass("TestClass");
    jniModel.includes.addAll(jniIncludes);

    return jniModel;
  }

  private static JniMethod createJniMethod(String methodName, JniModel theModel) {

    JavaPrimitiveType javaPrimitiveType = new JavaPrimitiveType(Type.INT);
    CppPrimitiveTypeRef cppPrimitiveType = new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.INT8);

    JniMethod result = new JniMethod();
    result.owningModel = theModel;
    result.javaMethodName = methodName;
    result.cppMethodName = methodName;
    result.javaReturnType = new JavaPrimitiveType(Type.INT);
    result.cppReturnType = new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.INT8);
    result.parameters.add(
        new JniParameter(BASE_PARAMETER_NAME, javaPrimitiveType, cppPrimitiveType));

    return result;
  }

  private String expectedGeneratedJNIMethod(String methodName) {
    return "\njint\n"
        + "Java_com_here_ivi_test_TestClass_"
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
        + ";\n"
        + "  auto result = com::here::ivi::test::CppClass::"
        + methodName
        + "("
        + BASE_PARAMETER_NAME
        + ");\n"
        + "  return result;\n"
        + "}\n";
  }

  private JniModel jniModel;

  private static final List<Include> jniIncludes =
      Collections.singletonList(Include.createInternalInclude("stub/libhello/TestClassStub.h"));
  private final String copyrightNotice =
      "/*\n"
          + " * Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights "
          + "reserved.\n"
          + " * \n"
          + " * This software, including documentation, is protected by copyright controlled by\n"
          + " * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,\n"
          + " * adapting or translating, any or all of this material requires the prior written\n"
          + " * consent of HERE Global B.V. This material also contains confidential information,\n"
          + " * which may not be disclosed to others without prior written consent of HERE Global B.V"
          + ".\n"
          + " *\n"
          + " * Automatically generated. Do not modify. Your changes will be lost.\n"
          + " *\n"
          + " */\n"
          + "\n";
  private final String jniHeaderInclude = "#include \"stub/libhello/TestClassStub.h\"\n";
  private final String externC = "\nextern \"C\" {\n";
  private final String endOfFile = "\n}\n";

  @Before
  public void setUp() {

    jniModel = createJniModel();
  }

  @Test
  public void generateWithEmptyIncludes() {
    jniModel.includes.clear();

    String generatedImplementation = JniImplementationTemplate.generate(jniModel);

    assertTrue(
        "At least the JNI header should be included, otherwise the JNI implementation "
            + "would not compile",
        generatedImplementation.isEmpty());
  }

  @Test
  public void generateWithMultipleIncludes() {
    jniModel.includes.add(Include.createInternalInclude("base_api_header.h"));

    String generatedImplementation = JniImplementationTemplate.generate(jniModel);

    assertEquals(
        copyrightNotice
            + jniHeaderInclude
            + "#include \"base_api_header.h\"\n"
            + "#include \""
            + JniNameRules.getConversionHeaderFileName()
            + "\"\n"
            + externC
            + endOfFile,
        generatedImplementation);
  }

  @Test
  public void generateWithNullJniModel() {
    String generatedImplementation = JniImplementationTemplate.generate(null);

    assertTrue(generatedImplementation.isEmpty());
  }

  @Test
  public void generateWithNoMethods() {
    String generatedImplementation = JniImplementationTemplate.generate(jniModel);

    assertEquals(
        copyrightNotice
            + jniHeaderInclude
            + "#include \""
            + JniNameRules.getConversionHeaderFileName()
            + "\"\n"
            + externC
            + endOfFile,
        generatedImplementation);
  }

  @Test
  public void generateWithOneMethods() {

    jniModel.methods.add(createJniMethod("method1", jniModel));
    String generatedImplementation = JniImplementationTemplate.generate(jniModel);

    assertEquals(
        copyrightNotice
            + jniHeaderInclude
            + "#include \""
            + JniNameRules.getConversionHeaderFileName()
            + "\"\n"
            + externC
            + expectedGeneratedJNIMethod("method1")
            + endOfFile,
        generatedImplementation);
  }

  @Test
  public void generateWithMultipleMethods() {

    jniModel.methods.add(createJniMethod("method1", jniModel));
    jniModel.methods.add(createJniMethod("method2", jniModel));

    String generatedImplementation = JniImplementationTemplate.generate(jniModel);

    assertEquals(
        copyrightNotice
            + jniHeaderInclude
            + "#include \""
            + JniNameRules.getConversionHeaderFileName()
            + "\"\n"
            + externC
            + expectedGeneratedJNIMethod("method1")
            + expectedGeneratedJNIMethod("method2")
            + endOfFile,
        generatedImplementation);
  }
}
