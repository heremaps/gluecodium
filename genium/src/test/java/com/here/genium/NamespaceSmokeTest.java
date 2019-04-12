/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
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

package com.here.genium;

import com.here.genium.Genium.Options;
import java.io.File;
import java.util.Arrays;
import java.util.Collection;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.Parameterized;
import org.junit.runners.Parameterized.Parameters;

@RunWith(Parameterized.class)
public final class NamespaceSmokeTest extends AcceptanceTestBase {

  private static final String RESOURCE_PREFIX = "namespace_smoke";

  public NamespaceSmokeTest(
      final File featureDirectory,
      final String generatorName,
      @SuppressWarnings("unused") final String featureName) {
    super(featureDirectory, generatorName);
  }

  @Override
  protected Genium.Options getGeniumOptions() {
    Options options = new Genium.Options();
    options.setCppInternalNamespace(Genium.Companion.getDEFAULT_INTERNAL_NAMESPACE());
    options.setCppRootNamespace(Arrays.asList("root", "space"));
    options.setJavaInternalPackages(Arrays.asList("foo", "bar"));
    return options;
  }

  @Parameters(name = "{2}, {1}")
  public static Collection<Object[]> data() {
    return Companion.getData(RESOURCE_PREFIX);
  }

  @Test
  public void smokeTest() {
    runTest();
  }
}
