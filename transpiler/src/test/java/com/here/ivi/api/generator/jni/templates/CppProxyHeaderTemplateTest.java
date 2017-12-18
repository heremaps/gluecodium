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

package com.here.ivi.api.generator.jni.templates;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cpp.CppPrimitiveTypeRef;
import com.here.ivi.api.model.java.JavaPrimitiveType;
import com.here.ivi.api.model.jni.JniContainer;
import com.here.ivi.api.model.jni.JniMethod;
import com.here.ivi.api.model.jni.JniParameter;
import com.here.ivi.api.model.jni.JniType;
import java.util.Arrays;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class CppProxyHeaderTemplateTest {

  private static final String TEST_COPYRIGHT_HEADER =
      TemplateEngine.render("java/CopyrightHeader", null);

  private static final List<String> NAMESPACES = Arrays.asList("testing", "stuff");

  private static JniMethod createListenerMethod(
      JavaPrimitiveType.Type inputParam, String cppMethodName, boolean constFlag) {

    JavaPrimitiveType javaType = null;
    CppPrimitiveTypeRef cppType = null;
    StringBuilder paramName = new StringBuilder("param");

    switch (inputParam) {
      case DOUBLE:
        javaType = JavaPrimitiveType.DOUBLE;
        cppType = CppPrimitiveTypeRef.DOUBLE;
        paramName.append(JavaPrimitiveType.DOUBLE.getName());
        break;
      case INT:
        javaType = JavaPrimitiveType.INT;
        cppType = CppPrimitiveTypeRef.INT32;
        paramName.append(JavaPrimitiveType.INT.getName());
        break;
    }

    JniType jniType = JniType.createType(javaType, cppType, false);

    JniParameter jniParam1 = new JniParameter(paramName + "_1", jniType);

    JniParameter jniParam2 = new JniParameter(paramName + "_2", jniType);

    JniMethod jniMethod =
        JniMethod.builder().cppMethodName(cppMethodName).isConst(constFlag).build();

    jniMethod.parameters.add(jniParam1);
    jniMethod.parameters.add(jniParam2);
    return jniMethod;
  }

  @Test
  public void generate() {

    JniContainer jniContainer =
        JniContainer.createInterfaceContainer(NAMESPACES, NAMESPACES, "TestClass", "CppClass");
    jniContainer.includes.add(Include.createSystemInclude("sys"));
    jniContainer.includes.add(Include.createInternalInclude("internal"));
    JniMethod jniMethod = createListenerMethod(JavaPrimitiveType.Type.INT, "cppMethod", false);
    JniMethod jniMethod2 = createListenerMethod(JavaPrimitiveType.Type.DOUBLE, "cppMethod", true);
    jniContainer.add(jniMethod);
    jniContainer.add(jniMethod2);

    String generated = TemplateEngine.render("jni/CppProxyHeader", jniContainer);

    assertEquals(
        TEST_COPYRIGHT_HEADER
            + "/**\n"
            + "* Cpp proxy header for class CppClass\n"
            + "*/\n"
            + "#pragma once\n"
            + "\n"
            + "#include <jni.h>\n"
            + "#include <sys>\n"
            + "#include \"internal\"\n"
            + "\n"
            + "#ifdef __cplusplus\n"
            + "extern \"C\" {\n"
            + "#endif\n"
            + "\n"
            + "namespace testing {\n"
            + "\n"
            + "namespace stuff {\n"
            + "\n"
            + "\n"
            + "class CppClassCppProxy : public here::internal::CppProxyBase, public CppClass {\n"
            + "\n"
            + "public:\n"
            + "\n"
            + "    CppClassCppProxy( JNIEnv* _jenv, jobject _jobj, jint _jHashCode );\n"
            + "\n"
            + "    void cppMethod( const int32_t nparamint_1, const int32_t nparamint_2 ) "
            + "override;\n"
            + "\n"
            + "    void cppMethod( const double nparamdouble_1, const double nparamdouble_2 ) const"
            + " override;\n"
            + "\n"
            + "};\n"
            + "\n"
            + "}\n"
            + "}\n"
            + "\n"
            + "#ifdef __cplusplus\n"
            + "}\n"
            + "#endif",
        generated);
  }
}
