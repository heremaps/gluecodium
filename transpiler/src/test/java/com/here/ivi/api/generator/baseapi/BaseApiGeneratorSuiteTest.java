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

import static junit.framework.TestCase.assertFalse;
import static junit.framework.TestCase.assertNotNull;
import static junit.framework.TestCase.assertTrue;
import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.here.ivi.api.OptionReader;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.loader.FrancaModelLoader;
import com.here.ivi.api.loader.baseapi.BaseApiSpecAccessorFactory;
import com.here.ivi.api.model.franca.FrancaModel;
import com.here.ivi.api.validator.baseapi.BaseApiModelValidator;
import com.here.ivi.api.validator.common.ResourceValidator;
import java.util.List;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Answers;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({ResourceValidator.class, BaseApiSpecAccessorFactory.class})
public final class BaseApiGeneratorSuiteTest {

  private BaseApiGeneratorSuite baseApiGeneratorSuite;

  @Mock private BaseApiModelValidator baseApiModelValidator;
  @Mock private OptionReader.TranspilerOptions options;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FrancaModel mockFrancaModel;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FrancaModelLoader francaModelLoader;

  private static final String MOCK_INPUT_PATH = "../fidl/files/are/here";
  private static final String MOCK_SPEC_PATH = "/a/random/directory/BaseApiSpec.fdepl";

  @Before
  public void setUp() {
    PowerMockito.mockStatic(ResourceValidator.class, BaseApiSpecAccessorFactory.class);
    MockitoAnnotations.initMocks(this);

    when(BaseApiSpecAccessorFactory.getSpecPath()).thenReturn(MOCK_SPEC_PATH);
    when(options.getInputDir()).thenReturn(MOCK_INPUT_PATH);

    baseApiGeneratorSuite = new BaseApiGeneratorSuite(baseApiModelValidator, francaModelLoader);
  }

  @Test
  public void buildModel() {
    baseApiGeneratorSuite.buildModel(MOCK_INPUT_PATH);

    verify(francaModelLoader).load(MOCK_SPEC_PATH, baseApiGeneratorSuite.getCurrentFiles());
    PowerMockito.verifyStatic();
    BaseApiSpecAccessorFactory.getSpecPath();
  }

  @Test
  public void validateWithNullModel() {
    assertFalse(baseApiGeneratorSuite.validate());

    PowerMockito.verifyStatic(never());
    ResourceValidator.validate(any(), any());
    verify(baseApiModelValidator, never()).validate(any());
  }

  @Test
  public void validateWithNotNullAndValidModel() {
    baseApiGeneratorSuite.buildModel(MOCK_INPUT_PATH);
    when(ResourceValidator.validate(any(), any())).thenReturn(true);
    when(baseApiModelValidator.validate(any())).thenReturn(true);

    assertTrue(baseApiGeneratorSuite.validate());

    PowerMockito.verifyStatic(); // 1
    ResourceValidator.validate(any(), any());
    verify(baseApiModelValidator).validate(baseApiGeneratorSuite.getModel());
  }

  @Test
  public void validateWithInvalidBaseApiValidation() {
    baseApiGeneratorSuite.buildModel(MOCK_INPUT_PATH);
    when(ResourceValidator.validate(any(), any())).thenReturn(true);
    when(baseApiModelValidator.validate(any())).thenReturn(false);

    assertFalse(baseApiGeneratorSuite.validate());

    PowerMockito.verifyStatic(); // 1
    ResourceValidator.validate(any(), any());
    verify(baseApiModelValidator).validate(baseApiGeneratorSuite.getModel());
  }

  @Test
  public void validateWithInvalidResourceValidation() {
    baseApiGeneratorSuite.buildModel(MOCK_INPUT_PATH);
    when(ResourceValidator.validate(any(), any())).thenReturn(false);
    when(baseApiModelValidator.validate(any())).thenReturn(true);

    assertFalse(baseApiGeneratorSuite.validate());

    PowerMockito.verifyStatic(); // 1
    ResourceValidator.validate(any(), any());
    verify(baseApiModelValidator, never()).validate(baseApiGeneratorSuite.getModel());
  }

  @Test
  public void validateWithInvalidResourceAndModelValidation() {
    baseApiGeneratorSuite.buildModel(MOCK_INPUT_PATH);
    when(ResourceValidator.validate(any(), any())).thenReturn(false);
    when(baseApiModelValidator.validate(any())).thenReturn(false);

    assertFalse(baseApiGeneratorSuite.validate());

    PowerMockito.verifyStatic(); // 1
    ResourceValidator.validate(any(), any());
    verify(baseApiModelValidator, never()).validate(baseApiGeneratorSuite.getModel());
  }

  @Test
  public void generateFilesNullModel() {
    List<GeneratedFile> generatedFiles = baseApiGeneratorSuite.generate();

    assertNotNull(generatedFiles);
    assertTrue(generatedFiles.isEmpty());
  }

  @Test
  public void generateFilesEmptyModel() {
    when(francaModelLoader.load(any(), any())).thenReturn(mockFrancaModel);
    baseApiGeneratorSuite.buildModel(MOCK_INPUT_PATH);

    List<GeneratedFile> generatedFiles = baseApiGeneratorSuite.generate();

    assertNotNull(generatedFiles);
    assertEquals(
        "The cpp/internal file should always be generated, even with empty model",
        1,
        generatedFiles.size());
    for (GeneratedFile generatedFile : generatedFiles) {
      assertFalse(generatedFile.content.toString().isEmpty());
      assertFalse(generatedFile.targetFile.getName().isEmpty());
    }
  }
}
