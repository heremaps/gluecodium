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

package com.here.ivi.api.model.java;

import static org.junit.Assert.assertEquals;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class JavaPackageTest {

  private static final List<String> PACKAGE_LIST = Arrays.asList("com", "example", "test");

  private final JavaPackage javaPackage = new JavaPackage(PACKAGE_LIST);

  @Test
  public void createChildPackageWithNullList() {
    JavaPackage childPackage = javaPackage.createChildPackage(null);

    assertEquals(PACKAGE_LIST, childPackage.packageNames);
  }

  @Test
  public void createChildPackageWithEmptyList() {
    JavaPackage childPackage = javaPackage.createChildPackage(Collections.emptyList());

    assertEquals(PACKAGE_LIST, childPackage.packageNames);
  }

  @Test
  public void createChildPackageWithNonEmptyList() {
    JavaPackage childPackage = javaPackage.createChildPackage(Collections.singletonList("boom"));

    assertEquals(Arrays.asList("com", "example", "test", "boom"), childPackage.packageNames);
  }
}
