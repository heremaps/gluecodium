/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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

package com.here.genium.generator.jni.templates;

import static org.junit.Assert.assertEquals;

import com.here.genium.generator.common.templates.TemplateEngine;
import com.here.genium.model.java.JavaClass;
import com.here.genium.model.jni.JniContainer;
import com.here.genium.model.jni.JniStruct;
import java.util.Arrays;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class JavaClassSignaturePrefixTest {

  private static final String TEMPLATE_NAME = "jni/JavaClassSignaturePrefix";

  private static final List<String> PACKAGE_NAMES = Arrays.asList("from", "a", "fancypackage");

  private final JavaClass javaClass = new JavaClass("Foo");

  @Test
  public void generateFromInterface() {
    JniContainer container =
        JniContainer.builder(PACKAGE_NAMES, null)
            .javaName("MyClass")
            .javaInterfaceName("MyClass")
            .cppName(null)
            .isFrancaInterface(true)
            .build();
    JniStruct jniStruct = new JniStruct(container, javaClass, null, null);

    String generated = TemplateEngine.render(TEMPLATE_NAME, jniStruct);

    assertEquals("from/a/fancypackage/MyClass$", generated);
  }

  @Test
  public void generateFromInstantiableInterface() {
    JniContainer container =
        JniContainer.builder(PACKAGE_NAMES, null)
            .javaName(null)
            .javaInterfaceName("FooImpl")
            .cppName(null)
            .isFrancaInterface(true)
            .build();
    JniStruct jniStruct = new JniStruct(container, javaClass, null, null);

    String generated = TemplateEngine.render(TEMPLATE_NAME, jniStruct);

    assertEquals("from/a/fancypackage/FooImpl$", generated);
  }

  @Test
  public void generateFromTypeCollection() {
    JniContainer container = JniContainer.builder(PACKAGE_NAMES, null).build();
    JniStruct jniStruct = new JniStruct(container, javaClass, null, null);

    String generated = TemplateEngine.render(TEMPLATE_NAME, jniStruct);

    assertEquals("from/a/fancypackage/", generated);
  }
}
