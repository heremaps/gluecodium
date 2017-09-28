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

package com.here.ivi.api.generator.common;

import static junit.framework.TestCase.assertFalse;
import static junit.framework.TestCase.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.google.common.collect.ImmutableList;
import com.google.inject.Injector;
import com.here.ivi.api.loader.FrancaModelLoader;
import com.here.ivi.api.model.franca.FrancaModel;
import com.here.ivi.api.model.franca.ModelHelper;
import com.here.ivi.api.validator.common.ResourceValidator;
import java.io.File;
import java.util.Collection;
import java.util.Collections;
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
@PrepareForTest({ResourceValidator.class, FrancaModelLoader.class, ModelHelper.class})
public class GeneratorSuiteTest {

  private static final String MOCK_INPUT_PATH = "../fidl/files/are/here";

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FrancaModelLoader francaModelLoader;

  @Mock private FrancaModel francaModel;

  private TestableGeneratorSuite generatorSuite;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private Injector injector;

  private static class TestableGeneratorSuite extends GeneratorSuite {
    TestableGeneratorSuite(final FrancaModelLoader francaModelLoader) {
      super(francaModelLoader);
    }

    @Override
    public String getName() {
      return null;
    }

    @Override
    public List<GeneratedFile> generate() {
      return null;
    }
  }

  @Before
  public void setUp() {
    PowerMockito.mockStatic(ResourceValidator.class, FrancaModelLoader.class, ModelHelper.class);
    MockitoAnnotations.initMocks(this);

    when(francaModelLoader.load(any(), any())).thenReturn(francaModel);

    Collection<File> files = Collections.singletonList(new File("nonsense.fidl"));
    when(FrancaModelLoader.listFilesRecursively(any())).thenReturn(files);
    when(francaModelLoader.load(any(), any())).thenReturn(francaModel);
    when(ModelHelper.getFdeplInjector()).thenReturn(injector);
  }

  @Test
  public void buildModel() {

    generatorSuite = new TestableGeneratorSuite(francaModelLoader);
    generatorSuite.buildModel(new File(MOCK_INPUT_PATH));

    verify(francaModelLoader).load(eq(GeneratorSuite.getSpecPath()), any());
    PowerMockito.verifyStatic();
    ModelHelper.getFdeplInjector();
    PowerMockito.verifyStatic();
    FrancaModelLoader.listFilesRecursively(new File(MOCK_INPUT_PATH));
  }

  @Test
  public void validateWithNullModel() {

    when(francaModelLoader.load(any(), any())).thenReturn(null);
    generatorSuite = new TestableGeneratorSuite(francaModelLoader);

    assertFalse(generatorSuite.validate());

    PowerMockito.verifyStatic(never());
    ResourceValidator.validate(any(), any());
  }

  @Test
  public void validateWithNotNullAndValidModel() {

    generatorSuite = new TestableGeneratorSuite(francaModelLoader);
    generatorSuite.buildModel(new File(MOCK_INPUT_PATH));
    when(ResourceValidator.validate(any(), any())).thenReturn(true);
    when(francaModel.getTypeCollections()).thenReturn(ImmutableList.of());

    assertTrue(generatorSuite.validate());

    PowerMockito.verifyStatic();
    ResourceValidator.validate(any(), any());
  }

  @Test
  public void validateWithNotNullAndInValidModel() {

    generatorSuite = new TestableGeneratorSuite(francaModelLoader);
    generatorSuite.buildModel(new File(MOCK_INPUT_PATH));
    when(ResourceValidator.validate(any(), any())).thenReturn(false);
    when(francaModel.getTypeCollections()).thenReturn(ImmutableList.of());

    assertFalse(generatorSuite.validate());

    PowerMockito.verifyStatic();
    ResourceValidator.validate(any(), any());
  }
}
