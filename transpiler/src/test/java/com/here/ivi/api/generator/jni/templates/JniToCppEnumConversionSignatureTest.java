/*
 * Copyright (c) 2016-2018 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.ivi.api.generator.jni.templates;

import static org.junit.Assert.assertEquals;

import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.model.jni.JniContainer;
import com.here.ivi.api.model.jni.JniEnum;
import java.util.Arrays;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JniToCppEnumConversionSignatureTest {

  private static final String CPP_OUTER_CLASS_NAME = "CppOuter";

  private static final List<String> JAVA_PACKAGE = Arrays.asList("java", "package");
  private static final List<String> CPP_NAMESPACES = Arrays.asList("a", "superfancy", "namespace");

  private static JniEnum createJniContainer(boolean definedInInterface) {

    JniContainer jniContainer =
        definedInInterface
            ? JniContainer.builder(JAVA_PACKAGE, CPP_NAMESPACES)
                .javaName("")
                .javaInterfaceName("")
                .cppName(CPP_OUTER_CLASS_NAME)
                .isFrancaInterface(true)
                .build()
            : JniContainer.builder(JAVA_PACKAGE, CPP_NAMESPACES).build();

    return new JniEnum.Builder("MyJavaEnum", "MyCppEnum").owningContainer(jniContainer).build();
  }

  @Test
  public void generateFromInterface() {

    String generated =
        TemplateEngine.render(
            "jni/JniToCppEnumerationConversionSignature", createJniContainer(true));

    // Assert
    String expected =
        "void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, "
            + "::a::superfancy::namespace::CppOuter::MyCppEnum& _nout )";
    assertEquals(expected, generated);
  }

  @Test
  public void generateFromTypeCollection() {

    String generated =
        TemplateEngine.render(
            "jni/JniToCppEnumerationConversionSignature", createJniContainer(false));

    // Assert
    String expected =
        "void convert_from_jni( JNIEnv* _jenv, const jobject _jinput, "
            + "::a::superfancy::namespace::MyCppEnum& _nout )";
    assertEquals(expected, generated);
  }
}
