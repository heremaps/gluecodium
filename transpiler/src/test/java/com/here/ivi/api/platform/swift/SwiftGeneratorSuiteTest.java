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

package com.here.ivi.api.platform.swift;

import static org.junit.Assert.assertTrue;

import com.here.ivi.api.generator.cbridge.CBridgeGenerator;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.swift.SwiftGenerator;
import java.util.LinkedList;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class SwiftGeneratorSuiteTest {

  private final SwiftGeneratorSuite suite = new SwiftGeneratorSuite();

  @Test
  public void generatedFilesContainStaticFiles() {
    List<GeneratedFile> generatedFiles = suite.generate(null, new LinkedList<>());

    assertTrue(
        generatedFiles + " must contain all " + SwiftGenerator.STATIC_FILES,
        generatedFiles.containsAll(SwiftGenerator.STATIC_FILES));
    assertTrue(
        generatedFiles + " must contain all " + CBridgeGenerator.STATIC_FILES,
        generatedFiles.containsAll(CBridgeGenerator.STATIC_FILES));
  }
}
