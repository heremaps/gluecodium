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

package com.here.ivi.api;

import java.io.File;
import java.util.Collection;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;

@RunWith(Parameterized.class)
public final class ExamplesTest extends AcceptanceTestBase {

  private static final String RESOURCE_PREFIX = "examples";

  public ExamplesTest(
      final File featureDirectory,
      final String generatorName,
      @SuppressWarnings("unused") final String featureName) {
    super(featureDirectory, generatorName);
  }

  @Parameters(name = "{2}, {1}")
  public static Collection<Object[]> data() {
    return getData(RESOURCE_PREFIX);
  }

  @Test
  public void examplesTest() {
    runTest();
  }
}
