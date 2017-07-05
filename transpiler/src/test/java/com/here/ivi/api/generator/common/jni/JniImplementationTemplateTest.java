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
import com.here.ivi.api.model.cppmodel.CppClass;
import com.here.ivi.api.model.cppmodel.CppMethod;
import com.here.ivi.api.model.cppmodel.CppParameter;
import com.here.ivi.api.model.cppmodel.CppPrimitiveType;
import com.here.ivi.api.model.cppmodel.CppType;
import com.here.ivi.api.model.javamodel.JavaClass;
import com.here.ivi.api.model.javamodel.JavaMethod;
import com.here.ivi.api.model.javamodel.JavaMethod.MethodQualifier;
import com.here.ivi.api.model.javamodel.JavaParameter;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType.Type;
import com.here.ivi.api.model.javamodel.JavaType;
import com.here.ivi.api.model.javamodel.JavaVisibility;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class JniImplementationTemplateTest {
  private JniModelBuilder.ElementPair createStaticMethodPair(String methodName) {
    JavaType javaType = new JavaPrimitiveType(Type.INT);
    JavaMethod javaMethod = new JavaMethod(methodName, javaType);
    javaMethod.visibility = JavaVisibility.PUBLIC;
    JavaParameter javaParameter = new JavaParameter(javaType, "param");
    javaMethod.parameters = new ArrayList<>(Arrays.asList(javaParameter));
    javaMethod.qualifiers.add(MethodQualifier.STATIC);

    CppType primitiveType = new CppPrimitiveType(CppPrimitiveType.Type.INT8);
    CppParameter cppParameter = new CppParameter();
    cppParameter.name = "param";
    CppMethod cppMethod =
        new CppMethod.Builder(methodName)
            .returnType(primitiveType)
            .inParameter(cppParameter)
            .build();
    cppMethod.getSpecifiers().add(CppMethod.Specifier.STATIC);

    return new JniModelBuilder.ElementPair(javaMethod, cppMethod);
  }

  private String expectedGeneratedJNIMethod(String methodName) {
    return "\njint\n"
        + "Java_com_here_android_TestClass_"
        + methodName
        + "(JNIEnv* env, jobject jinstance, jint jparam)\n"
        + "{\n"
        + "}\n";
  }

  private JavaClass javaClass;
  private CppClass cppClass;

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

    javaClass = new JavaClass("TestClass");
    cppClass = new CppClass("cppClass");
  }

  @Test
  public void generateWithNullIncludes() {
    String generatedImplementation =
        JniImplementationTemplate.generate(javaClass, cppClass, Collections.emptyList(), null);

    assertTrue(
        "At least the JNI header should be included, otherwise the JNI implementation "
            + "would not compile",
        generatedImplementation.isEmpty());
  }

  @Test
  public void generateWithEmptyIncludes() {
    String generatedImplementation =
        JniImplementationTemplate.generate(
            javaClass, cppClass, Collections.emptyList(), Collections.emptyList());

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

    String generatedImplementation =
        JniImplementationTemplate.generate(
            javaClass, cppClass, Collections.emptyList(), includesList);

    assertEquals(
        copyrightNotice
            + "#include \"jni_header.h\"\n"
            + "#include \"base_api_header.h\"\n"
            + externC
            + endOfFile,
        generatedImplementation);
  }

  @Test
  public void generateWithNullJavaClass() {
    String generatedImplementation =
        JniImplementationTemplate.generate(null, cppClass, null, jniIncludes);

    assertTrue(generatedImplementation.isEmpty());
  }

  @Test
  public void generateWithNullCppClass() {
    String generatedImplementation =
        JniImplementationTemplate.generate(javaClass, null, null, jniIncludes);

    assertTrue(generatedImplementation.isEmpty());
  }

  @Test
  public void generateWithNoMethods() {
    String generatedImplementation =
        JniImplementationTemplate.generate(
            javaClass, cppClass, Collections.emptyList(), jniIncludes);

    assertEquals(copyrightNotice + jniHeaderInclude + externC + endOfFile, generatedImplementation);
  }

  @Test
  public void generateWithOneMethods() {

    String generatedImplementation =
        JniImplementationTemplate.generate(
            javaClass, cppClass, Arrays.asList(createStaticMethodPair("method1")), jniIncludes);

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

    String generatedImplementation =
        JniImplementationTemplate.generate(
            javaClass,
            cppClass,
            Arrays.asList(createStaticMethodPair("method1"), createStaticMethodPair("method2")),
            jniIncludes);

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
