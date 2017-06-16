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

import com.here.ivi.api.generator.common.jni.templates.JavaNativeInterfacesImplementationTemplate;
import com.here.ivi.api.model.javamodel.JavaClass;
import com.here.ivi.api.model.javamodel.JavaMethod;
import com.here.ivi.api.model.javamodel.JavaMethod.Qualifier;
import com.here.ivi.api.model.javamodel.JavaParameter;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType.Type;
import com.here.ivi.api.model.javamodel.JavaType;
import com.here.ivi.api.model.javamodel.JavaVisibility;
import java.util.ArrayList;
import java.util.Arrays;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class JavaNativeInterfacesImplementationTemplateTest {

  private JavaMethod createStaticMethod(String methodName) {
    JavaType javaType = new JavaPrimitiveType(Type.INT);
    JavaMethod classMethod = new JavaMethod(methodName, javaType);
    classMethod.visibility = JavaVisibility.PUBLIC;
    JavaParameter parameter1 = new JavaParameter(javaType, "param");
    classMethod.parameters = new ArrayList<>(Arrays.asList(parameter1));
    classMethod.qualifiers.add(Qualifier.STATIC);

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

  private final String jniImplementationBase =
      "/*\n"
          + " * Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights "
          + "reserved.\n"
          + " * \n"
          + " * This software, including documentation, is protected by copyright controlled by\n"
          + " * HERE Global B.V. All rights are reserved. Copying, including reproducing, "
          + "storing,\n"
          + " * adapting or translating, any or all of this material requires the prior written\n"
          + " * consent of HERE Global B.V. This material also contains confidential information,\n"
          + " * which may not be disclosed to others without prior written consent of HERE Global"
          + " B.V.\n"
          + " */\n"
          + "\n"
          + "#include \"TODO\"\n";

  private final String endOfFile = "\n";

  @Before
  public void setUp() {
    javaClass = new JavaClass("TestClass");
  }

  @Test
  public void generateWithNullClass() {
    String generatedImplementation = JavaNativeInterfacesImplementationTemplate.generate(null);

    assertTrue(generatedImplementation.isEmpty());
  }

  @Test
  public void generateWithNoMethods() {
    String generatedImplementation = JavaNativeInterfacesImplementationTemplate.generate(javaClass);

    assertEquals(jniImplementationBase + endOfFile, generatedImplementation);
  }

  @Test
  public void generateWithOneMethods() {
    javaClass.methods.add(createStaticMethod("method1"));

    String generatedImplementation = JavaNativeInterfacesImplementationTemplate.generate(javaClass);

    assertEquals(
        jniImplementationBase + expectedGeneratedJNIMethod("method1") + endOfFile,
        generatedImplementation);
  }

  @Test
  public void generateWithMultipleMethods() {
    javaClass.methods.add(createStaticMethod("method1"));
    javaClass.methods.add(createStaticMethod("method2"));

    String generatedImplementation = JavaNativeInterfacesImplementationTemplate.generate(javaClass);

    assertEquals(
        jniImplementationBase
            + expectedGeneratedJNIMethod("method1")
            + expectedGeneratedJNIMethod("method2")
            + endOfFile,
        generatedImplementation);
  }
}
