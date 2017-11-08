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

package com.here.ivi.api.model.swift;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class SwiftModelElementTest {
  @Test
  public void constructSimpleNameFromName() {
    SwiftModelElement modelElement = new SwiftModelElement("Namespace.SimpleName") {};

    assertEquals("Name should contain namespace", "Namespace.SimpleName", modelElement.name);
    assertEquals(
        "Simple name should not contain namespace", "SimpleName", modelElement.getSimpleName());
  }
}
