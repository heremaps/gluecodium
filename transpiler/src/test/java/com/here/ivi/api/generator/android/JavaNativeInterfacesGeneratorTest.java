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
import static org.mockito.ArgumentMatchers.same;
import static org.mockito.Mockito.times;
import static org.mockito.Mockito.when;

import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.TemplateEngine;
import com.here.ivi.api.generator.common.jni.JniModel;
import com.here.ivi.api.generator.common.jni.JniNameRules;
import com.here.ivi.api.generator.common.jni.JniStruct;
import com.here.ivi.api.generator.common.jni.templates.JniHeaderTemplate;
import com.here.ivi.api.generator.common.jni.templates.JniImplementationTemplate;
import com.here.ivi.api.model.javamodel.JavaClass;
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
  private static final int STRUCT_FILES_COUNT = 2;

  @Rule public final ExpectedException expectedException = ExpectedException.none();

  private JavaClass javaClass = new JavaClass("classy");
  private JniStruct jniStruct = new JniStruct(javaClass, null, null);
  private JniModel jniModel = new JniModel();

  private JavaNativeInterfacesGenerator generator = new JavaNativeInterfacesGenerator(null, null);

  @Before
  public void setUp() {
    PowerMockito.mockStatic(
        JniNameRules.class,
        JniHeaderTemplate.class,
        JniImplementationTemplate.class,
        TemplateEngine.class);

    jniModel.javaClass = javaClass;

    when(JniNameRules.getHeaderFileName(any())).thenReturn("");
    when(JniNameRules.getImplementationFileName(any())).thenReturn("");
    when(JniNameRules.getConversionHeaderFileName(any(), any())).thenReturn("");
    when(JniNameRules.getConversionImplementationFileName(any(), any())).thenReturn("");
  }

  @Test
  public void generateFilesWithNullModel() {
    expectedException.expect(NullPointerException.class);

    generator.generateFiles(null);
  }

  @Test
  public void generateFilesWithNoStructs() {
    List<GeneratedFile> result = generator.generateFiles(jniModel);

    assertEquals(MAIN_FILES_COUNT, result.size());

    PowerMockito.verifyStatic();
    JniHeaderTemplate.generate(jniModel);
    PowerMockito.verifyStatic();
    JniImplementationTemplate.generate(jniModel);
  }

  @Test
  public void generateFilesWithOneStruct() {
    jniModel.structs.add(jniStruct);

    List<GeneratedFile> result = generator.generateFiles(jniModel);

    assertEquals(MAIN_FILES_COUNT + STRUCT_FILES_COUNT, result.size());

    PowerMockito.verifyStatic(times(2));
    TemplateEngine.render(any(), same(jniStruct));
  }

  @Test
  public void generateFilesWithTwoStructs() {
    jniModel.structs.add(jniStruct);
    jniModel.structs.add(jniStruct);

    List<GeneratedFile> result = generator.generateFiles(jniModel);

    assertEquals(MAIN_FILES_COUNT + 2 * STRUCT_FILES_COUNT, result.size());

    PowerMockito.verifyStatic(times(4));
    TemplateEngine.render(any(), same(jniStruct));
  }
}
