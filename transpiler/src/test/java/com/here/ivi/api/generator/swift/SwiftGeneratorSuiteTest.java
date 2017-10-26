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

package com.here.ivi.api.generator.swift;

import static com.here.ivi.api.test.Assert.assertContainsAll;

import com.here.ivi.api.generator.cbridge.CBridgeGenerator;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.model.franca.FrancaModel;
import java.util.Collections;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.powermock.reflect.Whitebox;

@RunWith(JUnit4.class)
public class SwiftGeneratorSuiteTest {

  private final SwiftGeneratorSuite suite = new SwiftGeneratorSuite();

  @Before
  public void setUp() throws Exception {
    FrancaModel model = new FrancaModel(null, Collections.emptyList(), Collections.emptyList());
    Whitebox.setInternalState(suite, "model", model);
  }

  @Test
  public void generatedFilesContainStaticFiles() {
    List<GeneratedFile> generatedFiles = suite.generate();

    assertContainsAll(generatedFiles, SwiftGenerator.STATIC_FILES);
    assertContainsAll(generatedFiles, CBridgeGenerator.STATIC_FILES);
  }
}
