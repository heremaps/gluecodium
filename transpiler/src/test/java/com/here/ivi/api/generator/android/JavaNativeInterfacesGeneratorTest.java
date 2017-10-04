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

package com.here.ivi.api.generator.android;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.when;

import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.generator.jni.JniNameRules;
import com.here.ivi.api.model.jni.JniContainer;
import java.util.Collections;
import java.util.List;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({JniNameRules.class, TemplateEngine.class})
public class JavaNativeInterfacesGeneratorTest {

  private static final int MAIN_FILES_COUNT = 2;
  private static final int MAIN_FILES_WITH_INSTANCES_COUNT = 4;

  @Rule public final ExpectedException expectedException = ExpectedException.none();

  private final JniContainer jniContainer =
      JniContainer.createInterfaceContainer(
          Collections.emptyList(), Collections.emptyList(), "classy", "classy");

  private final JavaNativeInterfacesGenerator generator =
      new JavaNativeInterfacesGenerator(null, null);

  @Before
  public void setUp() {
    PowerMockito.mockStatic(JniNameRules.class, TemplateEngine.class);

    when(JniNameRules.getHeaderFileName(any())).thenReturn("");
    when(JniNameRules.getImplementationFileName(any())).thenReturn("");
    when(JniNameRules.getConversionHeaderFileName()).thenReturn("");
    when(JniNameRules.getConversionImplementationFileName()).thenReturn("");
    when(JniNameRules.getInstanceConversionHeaderFileName()).thenReturn("");
    when(JniNameRules.getInstanceConversionImplementationFileName()).thenReturn("");
  }

  @Test
  public void generateFilesWithNullModel() {
    List<GeneratedFile> files = generator.generateFiles(null);
    assertTrue(files.isEmpty());
  }

  @Test
  public void generateFilesWithNonNullModel() {
    List<GeneratedFile> result = generator.generateFiles(jniContainer);

    assertEquals(MAIN_FILES_COUNT, result.size());

    PowerMockito.verifyStatic();
    TemplateEngine.render("jni/Header", jniContainer);
    PowerMockito.verifyStatic();
    TemplateEngine.render("jni/Implementation", jniContainer);
  }

  @Test
  public void generateConversionFiles() {
    JniContainer instantiableJniContainer =
        JniContainer.createInterfaceContainer(
            Collections.emptyList(), Collections.emptyList(), "classy", "classy", "classy", true);

    List<GeneratedFile> result =
        generator.generateConversionFiles(Collections.singletonList(instantiableJniContainer));

    assertEquals(MAIN_FILES_WITH_INSTANCES_COUNT, result.size());
    PowerMockito.verifyStatic();
    TemplateEngine.render(eq("jni/StructConversionHeader"), any());
    PowerMockito.verifyStatic();
    TemplateEngine.render(eq("jni/StructConversionImplementation"), any());
    PowerMockito.verifyStatic();
    TemplateEngine.render(eq("jni/InstanceConversionHeader"), any());
    PowerMockito.verifyStatic();
    TemplateEngine.render(eq("jni/InstanceConversionImplementation"), any());
  }
}
