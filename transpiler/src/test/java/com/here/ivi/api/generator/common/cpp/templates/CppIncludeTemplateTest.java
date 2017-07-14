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

package com.here.ivi.api.generator.common.cpp.templates;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.common.LazyInternalInclude;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FTypeCollection;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public final class CppIncludeTemplateTest {

  private static final String FILE_NAME = "something";

  @Test
  public void internalInclude() {
    String result = CppIncludeTemplate.generate(Include.createInternalInclude(FILE_NAME));

    assertEquals("#include <" + FILE_NAME + ">\n", result);
  }

  @Test
  public void systemInclude() {
    String result = CppIncludeTemplate.generate(Include.createSystemInclude(FILE_NAME));

    assertEquals("#include <" + FILE_NAME + ">\n", result);
  }

  @Test
  public void lazyInclude() {
    FTypeCollection typeCollection = mock(FTypeCollection.class);
    when(typeCollection.getName()).thenReturn("typical collective");
    FModel model = mock(FModel.class);
    when(model.getName()).thenReturn("modeled");

    String result = CppIncludeTemplate.generate(new LazyInternalInclude(typeCollection, model));

    assertEquals("// Unknown or unresolved include modeled.typical collective\n", result);
  }
}
