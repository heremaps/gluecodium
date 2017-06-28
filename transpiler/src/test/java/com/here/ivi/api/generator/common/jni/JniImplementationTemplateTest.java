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
import com.here.ivi.api.model.Includes;
import com.here.ivi.api.model.Includes.InternalPublicInclude;
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
  private JavaMethod createStaticMethod(String methodName) {
    JavaType javaType = new JavaPrimitiveType(Type.INT);
    JavaMethod classMethod = new JavaMethod(methodName, javaType);
    classMethod.visibility = JavaVisibility.PUBLIC;
    JavaParameter parameter1 = new JavaParameter(javaType, "param");
    classMethod.parameters = new ArrayList<>(Arrays.asList(parameter1));
    classMethod.qualifiers.add(MethodQualifier.STATIC);

    return classMethod;
  }

  private String expectedGeneratedJNIMethod(String methodName) {
    return "\nextern \"C\" jint\n"
        + "Java_com_here_android_TestClass_"
        + methodName
        + "(JNIEnv* env, jobject jinstance, jint jparam)\n"
        + "{\n"
        + "    //TODO\n"
        + "}";
  }

  private JavaClass javaClass;
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
  private final String endOfFile = "\n";

  @Before
  public void setUp() {
    javaClass = new JavaClass("TestClass");
  }

  @Test
  public void generateWithNullIncludes() {
    String generatedImplementation = JniImplementationTemplate.generate(javaClass, null);

    assertTrue(
        "At least the JNI header should be included, otherwise the JNI implementation "
            + "would not compile",
        generatedImplementation.isEmpty());
  }

  @Test
  public void generateWithEmptyIncludes() {
    String generatedImplementation =
        JniImplementationTemplate.generate(javaClass, Collections.emptyList());

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

    String generatedImplementation = JniImplementationTemplate.generate(javaClass, includesList);

    assertEquals(
        copyrightNotice
            + "#include \"jni_header.h\"\n"
            + "#include \"base_api_header.h\"\n"
            + endOfFile,
        generatedImplementation);
  }

  @Test
  public void generateWithNullClass() {
    String generatedImplementation = JniImplementationTemplate.generate(null, jniIncludes);

    assertTrue(generatedImplementation.isEmpty());
  }

  @Test
  public void generateWithNoMethods() {
    String generatedImplementation = JniImplementationTemplate.generate(javaClass, jniIncludes);

    assertEquals(copyrightNotice + jniHeaderInclude + endOfFile, generatedImplementation);
  }

  @Test
  public void generateWithOneMethods() {
    javaClass.methods.add(createStaticMethod("method1"));

    String generatedImplementation = JniImplementationTemplate.generate(javaClass, jniIncludes);

    assertEquals(
        copyrightNotice + jniHeaderInclude + expectedGeneratedJNIMethod("method1") + endOfFile,
        generatedImplementation);
  }

  @Test
  public void generateWithMultipleMethods() {
    javaClass.methods.add(createStaticMethod("method1"));
    javaClass.methods.add(createStaticMethod("method2"));

    String generatedImplementation = JniImplementationTemplate.generate(javaClass, jniIncludes);

    assertEquals(
        copyrightNotice
            + jniHeaderInclude
            + expectedGeneratedJNIMethod("method1")
            + expectedGeneratedJNIMethod("method2")
            + endOfFile,
        generatedImplementation);
  }
}
