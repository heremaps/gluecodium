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
import com.here.ivi.api.model.cpp.CppTypeRef;
import com.here.ivi.api.model.java.JavaCustomType;
import com.here.ivi.api.model.java.JavaPrimitiveType;
import com.here.ivi.api.model.java.JavaType;
import com.here.ivi.api.model.jni.JniParameter;
import com.here.ivi.api.model.jni.JniType;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class ParameterConversionTemplateTest {

  @Test
  public void primitiveType() {

    JavaType javaType = JavaPrimitiveType.INT;

    CppTypeRef cppTypeRef = CppPrimitiveTypeRef.INT8;

    JniType jniType = JniType.createType(javaType, cppTypeRef, false);

    JniParameter parameter = new JniParameter("myParameter", jniType);

    String generated = TemplateEngine.render("jni/ParameterConversion", parameter);

    assertEquals("  int8_t myParameter = jmyParameter;\n", generated);
  }

  @Test
  public void complexType() {

    JavaType javaType = new JavaCustomType("");
    CppTypeRef cppTypeRef = new CppComplexTypeRef.Builder("CppType").build();

    JniType jniType = JniType.createType(javaType, cppTypeRef, false);

    JniParameter parameter = new JniParameter("myParameter", jniType);

    String generated = TemplateEngine.render("jni/ParameterConversion", parameter);

    assertEquals(
        "  CppType myParameter;\n"
            + "    here::internal::convert_from_jni( _jenv, jmyParameter, myParameter );\n"
            + "    _jenv->DeleteLocalRef(jmyParameter);\n",
        generated);
  }

  @Test
  public void instanceType() {
    JavaType javaType = new JavaCustomType("");
    CppTypeRef cppTypeRef = new CppComplexTypeRef.Builder("MyCppClass").build();

    JniType jniType = JniType.createType(javaType, cppTypeRef, true);

    JniParameter parameter = new JniParameter("myParameter", jniType);

    String generated = TemplateEngine.render("jni/ParameterConversion", parameter);

    assertEquals(
        "  MyCppClass myParameter;\n"
            + "    if (_jenv->IsInstanceOf(jmyParameter, _jenv->FindClass(NATIVE_BASE))) {\n"
            + "        if (jmyParameter != nullptr) {\n"
            + "            auto long_ptr_myParameter = get_long_field(_jenv, _jenv->GetObjectClass(jmyParameter), jmyParameter, \"nativeHandle\");\n"
            + "            myParameter = *reinterpret_cast<MyCppClass*> (long_ptr_myParameter);\n"
            + "            _jenv->DeleteLocalRef(jmyParameter);\n"
            + "        }\n"
            + "    } else {\n"
            + "      ::createCppProxy<>( _jenv, jmyParameter, myParameter);\n"
            + "    }\n",
        generated);
  }
}
