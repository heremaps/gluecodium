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
import com.here.ivi.api.model.java.JavaClass;
import com.here.ivi.api.model.jni.JniContainer;
import com.here.ivi.api.model.jni.JniStruct;
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
