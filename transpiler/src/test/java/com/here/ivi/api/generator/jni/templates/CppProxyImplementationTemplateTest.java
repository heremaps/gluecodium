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
import com.here.ivi.api.model.cpp.CppComplexTypeRef;
import com.here.ivi.api.model.cpp.CppPrimitiveTypeRef;
import com.here.ivi.api.model.cpp.CppTemplateTypeRef;
import com.here.ivi.api.model.java.JavaArrayType;
import com.here.ivi.api.model.java.JavaCustomType;
import com.here.ivi.api.model.java.JavaPackage;
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
public class CppProxyImplementationTemplateTest {

  private static final String EXPECTED_PREFIX =
      "\n"
          + "#include \"android/jni/InstanceConversion.h\"\n"
          + "#include \"android/jni/StructConversion.h\"\n"
          + "#include \"android/jni/ArrayConversionUtils.h\"\n"
          + "#include \"android/jni/EnumConversion.h\"\n\n"
          + "namespace testing {\n\n"
          + "namespace stuff {\n\n\n"
          + "using namespace ::here::internal;\n\n"
          + "CppClassCppProxy::CppClassCppProxy( JNIEnv* _jenv, jobject _jobj, jint _jHashCode )\n"
          + "    : CppProxyBase( _jenv, _jobj, _jHashCode ) {\n"
          + "}\n\n";
  private static final String EXPECTED_SUFFIX = "\n}\n}\n";
  private static final List<String> NAMESPACES = Arrays.asList("testing", "stuff");

  @Test
  public void generateWithMethod() {
    JniMethod jniMethod = new JniMethod.Builder("", "cppMethod").build();
    JniType jniType = JniType.createType(JavaPrimitiveType.INT, CppPrimitiveTypeRef.INT32, false);
    jniMethod.parameters.add(new JniParameter("param", jniType));

    JniContainer jniContainer =
        JniContainer.builder(NAMESPACES, NAMESPACES)
            .javaName("TestClass")
            .javaInterfaceName("TestClass")
            .cppName("CppClass")
            .isFrancaInterface(true)
            .build();
    jniContainer.add(jniMethod);

    String generated = TemplateEngine.render("jni/CppProxyImplementation", jniContainer);

    assertEquals(
        EXPECTED_PREFIX
            + "void CppClassCppProxy::cppMethod( const int32_t nparam ) {\n"
            + "    JNIEnv* jniEnv = getJniEnvironment( );\n"
            + "    jint jparam = nparam;\n"
            + "    callJavaMethod( \"\", \"(I)V\", jniEnv , jparam);\n"
            + "}\n"
            + EXPECTED_SUFFIX,
        generated);
  }

  @Test
  public void generateWithConstMethod() {
    JniMethod jniMethod = new JniMethod.Builder("", "cppMethod").isConst(true).build();
    JniType jniType =
        JniType.createType(JavaPrimitiveType.DOUBLE, CppPrimitiveTypeRef.DOUBLE, true);
    jniMethod.parameters.add(new JniParameter("param", jniType));

    JniContainer jniContainer =
        JniContainer.builder(NAMESPACES, NAMESPACES)
            .javaName("TestClass")
            .javaInterfaceName("TestClass")
            .cppName("CppClass")
            .isFrancaInterface(true)
            .build();
    jniContainer.add(jniMethod);

    String generated = TemplateEngine.render("jni/CppProxyImplementation", jniContainer);

    assertEquals(
        EXPECTED_PREFIX
            + "void CppClassCppProxy::cppMethod( const double nparam ) const {\n"
            + "    JNIEnv* jniEnv = getJniEnvironment( );\n"
            + "    jdouble jparam = nparam;\n"
            + "    callJavaMethod( \"\", \"(D)V\", jniEnv , jparam);\n"
            + "}\n"
            + "\n"
            + "}\n"
            + "}\n",
        generated);
  }

  @Test
  public void generateWithComplexParameter() {
    JniMethod jniMethod = new JniMethod.Builder("", "cppMethod").build();
    JniType jniType =
        JniType.createType(
            new JavaCustomType("Foo", JavaPackage.DEFAULT),
            new CppComplexTypeRef.Builder("Foo").build(),
            false);
    jniMethod.parameters.add(new JniParameter("param", jniType));

    JniContainer jniContainer =
        JniContainer.builder(NAMESPACES, NAMESPACES)
            .javaName("TestClass")
            .javaInterfaceName("TestClass")
            .cppName("CppClass")
            .isFrancaInterface(true)
            .build();
    jniContainer.add(jniMethod);

    String generated = TemplateEngine.render("jni/CppProxyImplementation", jniContainer);

    assertEquals(
        EXPECTED_PREFIX
            + "void CppClassCppProxy::cppMethod( const Foo& nparam ) {\n"
            + "    JNIEnv* jniEnv = getJniEnvironment( );\n"
            + "    auto jparam = ::here::internal::convert_to_jni( jniEnv, nparam );\n"
            + "    callJavaMethod( \"\", \"(Lcom/here/android/Foo;)V\", jniEnv , jparam);\n"
            + "}\n"
            + EXPECTED_SUFFIX,
        generated);
  }

  @Test
  public void generateWithArrayParameter() {
    JniMethod jniMethod = new JniMethod.Builder("", "cppMethod").build();
    JniType jniType =
        JniType.createType(
            JavaArrayType.BYTE_ARRAY,
            CppTemplateTypeRef.create(
                CppTemplateTypeRef.TemplateClass.VECTOR, CppPrimitiveTypeRef.UINT8),
            false);
    jniMethod.parameters.add(new JniParameter("param", jniType));

    JniContainer jniContainer =
        JniContainer.builder(NAMESPACES, NAMESPACES)
            .javaName("TestClass")
            .javaInterfaceName("TestClass")
            .cppName("CppClass")
            .isFrancaInterface(true)
            .build();
    jniContainer.add(jniMethod);

    String generated = TemplateEngine.render("jni/CppProxyImplementation", jniContainer);

    assertEquals(
        EXPECTED_PREFIX
            + "void CppClassCppProxy::cppMethod( const ::std::vector< uint8_t >& nparam ) {\n"
            + "    JNIEnv* jniEnv = getJniEnvironment( );\n"
            + "    auto jparam = ::here::internal::convert_to_jni_array( jniEnv, nparam );\n"
            + "    callJavaMethod( \"\", \"([B)V\", jniEnv , jparam);\n"
            + "}\n"
            + EXPECTED_SUFFIX,
        generated);
  }
}
