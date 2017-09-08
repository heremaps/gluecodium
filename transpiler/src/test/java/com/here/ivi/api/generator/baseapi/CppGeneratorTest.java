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

import static org.junit.Assert.*;

import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.cpp.CppGenerator;
import com.here.ivi.api.model.common.Include;
import com.here.ivi.api.model.cppmodel.CppElement;
import com.here.ivi.api.model.cppmodel.CppNamespace;
import java.util.Collections;
import org.junit.Before;
import org.junit.Test;

public class CppGeneratorTest {

  private static final String OUTPUT_FILE_NAME = "some_fancy.output";
  private static final String COPYRIGHT_NOTICE = "a noticeable copy right";

  private final CppGenerator cppGenerator = new CppGenerator();

  private final CppNamespace cppModel = new CppNamespace(Collections.emptyList());

  @Before
  public void setUp() {
    cppModel.members.add(new CppElement(""));
  }

  @Test
  public void generateWithNullModel() {
    GeneratedFile generatedFile =
        cppGenerator.generateCode(null, OUTPUT_FILE_NAME, COPYRIGHT_NOTICE);

    assertNull(generatedFile);
  }

  @Test
  public void generateWithEmptyModel() {
    cppModel.members.clear();

    GeneratedFile generatedFile =
        cppGenerator.generateCode(cppModel, OUTPUT_FILE_NAME, COPYRIGHT_NOTICE);

    assertNull(generatedFile);
  }

  @Test
  public void generateWithNonEmptyModel() {
    GeneratedFile generatedFile =
        cppGenerator.generateCode(cppModel, OUTPUT_FILE_NAME, COPYRIGHT_NOTICE);

    assertNotNull(generatedFile);
  }

  @Test
  public void generatePreservesCopyrightNotice() {
    GeneratedFile generatedFile =
        cppGenerator.generateCode(cppModel, OUTPUT_FILE_NAME, COPYRIGHT_NOTICE);

    assertNotNull(generatedFile);
    assertNotNull(generatedFile.content);
    assertTrue(generatedFile.content.toString().contains(COPYRIGHT_NOTICE));
  }

  @Test
  public void generateFiltersOutSelfIncludes() {
    Include nonsenseInclude = Include.createInternalInclude("nonsense");
    Include selfInclude = Include.createInternalInclude(OUTPUT_FILE_NAME);
    cppModel.includes.add(nonsenseInclude);
    cppModel.includes.add(selfInclude);

    cppGenerator.generateCode(cppModel, OUTPUT_FILE_NAME, COPYRIGHT_NOTICE);

    assertTrue(cppModel.includes.contains(nonsenseInclude));
    assertFalse(cppModel.includes.contains(selfInclude));
  }
}
