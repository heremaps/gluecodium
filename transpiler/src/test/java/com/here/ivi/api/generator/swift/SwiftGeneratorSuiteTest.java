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
import static org.mockito.MockitoAnnotations.initMocks;
import static org.powermock.api.mockito.PowerMockito.when;

import com.here.ivi.api.generator.cbridge.CBridgeGenerator;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.model.franca.FrancaModel;
import java.util.Collections;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;
import org.powermock.reflect.Whitebox;

@RunWith(JUnit4.class)
public class SwiftGeneratorSuiteTest {
  @Mock private FrancaModel model;
  private final SwiftGeneratorSuite suite = new SwiftGeneratorSuite();

  @Before
  public void setUp() throws Exception {
    initMocks(this);
    Whitebox.setInternalState(suite, "model", model);
  }

  @Test
  public void generatedFilesContainStaticFiles() {
    when(model.getTypeCollections()).thenReturn(Collections.emptyList());
    when(model.getInterfaces()).thenReturn(Collections.emptyList());

    List<GeneratedFile> generatedFiles = suite.generate();

    assertContainsAll(generatedFiles, SwiftGenerator.STATIC_FILES);
    assertContainsAll(generatedFiles, CBridgeGenerator.STATIC_FILES);
  }
}
