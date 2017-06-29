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

package com.here.ivi.api.generator.common.java;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.model.javamodel.JavaClass;
import com.here.ivi.api.model.javamodel.JavaPackage;
import java.util.Arrays;
import java.util.Collections;
import navigation.BaseApiSpec.InterfacePropertyAccessor;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Answers;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public final class JavaClassMapperTest {
  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private Interface<InterfacePropertyAccessor> api;

  private final JavaPackage defaultJavaPackagePrefix =
      new JavaPackage(Arrays.asList("org", "example", "test"));

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
  }

  @Test
  public void mapReturnsDefaultJavaPackage() {
    when(api.getPackage()).thenReturn(Collections.emptyList());

    JavaClass mappedJavaClass = JavaClassMapper.map(api, defaultJavaPackagePrefix);

    assertEquals(defaultJavaPackagePrefix.packageNames, mappedJavaClass.javaPackage.packageNames);
  }

  @Test
  public void mapWithClassPackageReturnsConcatenatedPackage() {
    when(api.getPackage()).thenReturn(Arrays.asList("class", "package"));

    JavaClass mappedJavaClass = JavaClassMapper.map(api, defaultJavaPackagePrefix);

    assertEquals(
        Arrays.asList("org", "example", "test", "class", "package"),
        mappedJavaClass.javaPackage.packageNames);
  }
}
