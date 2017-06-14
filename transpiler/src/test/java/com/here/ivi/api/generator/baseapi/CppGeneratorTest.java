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

package com.here.ivi.api.generator.baseapi;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.mockito.Mockito.verify;

import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.cpp.CppGenerator;
import com.here.ivi.api.model.cppmodel.CppElement;
import com.here.ivi.api.model.cppmodel.CppIncludeResolver;
import com.here.ivi.api.model.cppmodel.CppNamespace;
import org.junit.Before;
import org.junit.Test;
import org.mockito.*;

public class CppGeneratorTest {

  private static final String outputFileName = "some_fancy.output";
  private static final String copyrightNotice = "a noticeable copy right";

  @Mock private CppIncludeResolver includeResolver;

  @InjectMocks private CppGenerator cppGenerator;

  private CppNamespace cppModel = new CppNamespace();

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
  }

  @Test
  public void generateWithNullModel() {
    GeneratedFile generatedFile = cppGenerator.generateCode(null, outputFileName, copyrightNotice);

    assertNull(generatedFile);
  }

  @Test
  public void generateWithEmptyModel() {
    GeneratedFile generatedFile =
        cppGenerator.generateCode(cppModel, outputFileName, copyrightNotice);

    assertNull(generatedFile);
  }

  @Test
  public void generateWithNonEmptyModel() {
    cppModel.members.add(new CppElement());

    GeneratedFile generatedFile =
        cppGenerator.generateCode(cppModel, outputFileName, copyrightNotice);

    verify(includeResolver).resolveLazyIncludes(cppModel, outputFileName);
    assertNotNull(generatedFile);
  }

  @Test
  public void generatePreservesCopyrightNotice() {
    cppModel.members.add(new CppElement());

    GeneratedFile generatedFile =
        cppGenerator.generateCode(cppModel, outputFileName, copyrightNotice);

    assertNotNull(generatedFile);
    assertNotNull(generatedFile.content);
    assertTrue(generatedFile.content.toString().contains(copyrightNotice));
  }
}
