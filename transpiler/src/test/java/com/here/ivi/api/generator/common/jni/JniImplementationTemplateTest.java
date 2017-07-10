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
import com.here.ivi.api.model.common.Includes;
import com.here.ivi.api.model.common.Includes.InternalPublicInclude;
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
    jniModel.javaClassName = "TestClass";
    return jniModel;
  }

  private static JniMethod createJniMethod(String methodName, JniModel theModel) {

    JniMethod result = new JniMethod();

    result.owningModel = theModel;
    result.javaMethodName = methodName;
    result.cppMethodName = methodName;
    result.javaReturnType = new JavaPrimitiveType(Type.INT);
    result.cppReturnType = "int8_t";

    JniParameterData param = new JniParameterData();

    param.baseName = BASE_PARAMETER_NAME;
    param.javaType = new JavaPrimitiveType(Type.INT);
    param.cppType = "int8_t";
    result.parameters.add(param);
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
        + " = "
        + JNI_PARAMETER_NAME
        + ";\n"
        + "  int8_t result = com::here::ivi::test::CppClass::"
        + methodName
        + "("
        + BASE_PARAMETER_NAME
        + ");\n"
        + "  return result;\n"
        + "}\n";
  }

  private JniModel jniModel;

  private final List<InternalPublicInclude> jniIncludes =
      Arrays.asList(new InternalPublicInclude("stub/libhello/TestClassStub.h"));
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
  public void generateWithNullIncludes() {
    String generatedImplementation = JniImplementationTemplate.generate(jniModel, null);

    assertTrue(
        "At least the JNI header should be included, otherwise the JNI implementation "
            + "would not compile",
        generatedImplementation.isEmpty());
  }

  @Test
  public void generateWithEmptyIncludes() {
    String generatedImplementation =
        JniImplementationTemplate.generate(jniModel, Collections.emptyList());

    assertTrue(
        "At least the JNI header should be included, otherwise the JNI implementation "
            + "would not compile",
        generatedImplementation.isEmpty());
  }

  @Test
  public void generateWithMultipleIncludes() {
    List<Includes.InternalPublicInclude> includesList =
        Arrays.asList(
            new InternalPublicInclude("jni_header.h"),
            new InternalPublicInclude("base_api_header.h"));

    String generatedImplementation = JniImplementationTemplate.generate(jniModel, includesList);

    assertEquals(
        copyrightNotice
            + "#include \"jni_header.h\"\n"
            + "#include \"base_api_header.h\"\n"
            + externC
            + endOfFile,
        generatedImplementation);
  }

  @Test
  public void generateWithNullJniModel() {
    String generatedImplementation = JniImplementationTemplate.generate(null, jniIncludes);

    assertTrue(generatedImplementation.isEmpty());
  }

  @Test
  public void generateWithNoMethods() {
    String generatedImplementation = JniImplementationTemplate.generate(jniModel, jniIncludes);

    assertEquals(copyrightNotice + jniHeaderInclude + externC + endOfFile, generatedImplementation);
  }

  @Test
  public void generateWithOneMethods() {

    jniModel.methods.add(createJniMethod("method1", jniModel));
    String generatedImplementation = JniImplementationTemplate.generate(jniModel, jniIncludes);

    assertEquals(
        copyrightNotice
            + jniHeaderInclude
            + externC
            + expectedGeneratedJNIMethod("method1")
            + endOfFile,
        generatedImplementation);
  }

  @Test
  public void generateWithMultipleMethods() {

    jniModel.methods.add(createJniMethod("method1", jniModel));
    jniModel.methods.add(createJniMethod("method2", jniModel));

    String generatedImplementation = JniImplementationTemplate.generate(jniModel, jniIncludes);

    assertEquals(
        copyrightNotice
            + jniHeaderInclude
            + externC
            + expectedGeneratedJNIMethod("method1")
            + expectedGeneratedJNIMethod("method2")
            + endOfFile,
        generatedImplementation);
  }
}
