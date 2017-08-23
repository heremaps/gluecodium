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
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.when;

import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.generator.common.jni.JniModel;
import com.here.ivi.api.generator.common.jni.JniNameRules;
import com.here.ivi.api.generator.common.jni.templates.JniHeaderTemplate;
import com.here.ivi.api.generator.common.jni.templates.JniImplementationTemplate;
import com.here.ivi.api.model.javamodel.JavaClass;
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
@PrepareForTest({
  JniNameRules.class,
  JniHeaderTemplate.class,
  JniImplementationTemplate.class,
  TemplateEngine.class
})
public class JavaNativeInterfacesGeneratorTest {

  private static final int MAIN_FILES_COUNT = 2;

  @Rule public final ExpectedException expectedException = ExpectedException.none();

  private final JniModel jniModel = new JniModel(null, null, new JavaClass("classy"), null);

  private final JavaNativeInterfacesGenerator generator =
      new JavaNativeInterfacesGenerator(null, null);

  @Before
  public void setUp() {
    PowerMockito.mockStatic(
        JniNameRules.class,
        JniHeaderTemplate.class,
        JniImplementationTemplate.class,
        TemplateEngine.class);

    when(JniNameRules.getHeaderFileName(any())).thenReturn("");
    when(JniNameRules.getImplementationFileName(any())).thenReturn("");
    when(JniNameRules.getConversionHeaderFileName()).thenReturn("");
    when(JniNameRules.getConversionImplementationFileName()).thenReturn("");
  }

  @Test
  public void generateFilesWithNullModel() {
    expectedException.expect(NullPointerException.class);

    generator.generateFiles(null);
  }

  @Test
  public void generateFilesWithNonNullModel() {
    List<GeneratedFile> result = generator.generateFiles(jniModel);

    assertEquals(MAIN_FILES_COUNT, result.size());

    PowerMockito.verifyStatic();
    JniHeaderTemplate.generate(jniModel);
    PowerMockito.verifyStatic();
    JniImplementationTemplate.generate(jniModel);
  }

  @Test
  public void generateConversionFiles() {
    List<GeneratedFile> result =
        generator.generateConversionFiles(Collections.singletonList(jniModel));

    assertEquals(MAIN_FILES_COUNT, result.size());

    PowerMockito.verifyStatic(times(2));
    TemplateEngine.render(any(), any());
  }
}
