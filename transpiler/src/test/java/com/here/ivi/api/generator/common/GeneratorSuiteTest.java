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

import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.google.inject.Injector;
import com.here.ivi.api.loader.FrancaModelLoader;
import com.here.ivi.api.model.franca.ModelHelper;
import com.here.ivi.api.validator.common.ResourceValidator;
import java.io.File;
import java.util.ArrayList;
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
  private static final String MOCK_INPUT_PATH_2 = "../fidl/files/are/here/two";

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FrancaModelLoader francaModelLoader;

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

    Collection<File> files = Collections.singletonList(new File("nonsense.fidl"));
    when(FrancaModelLoader.listFilesRecursively(any())).thenReturn(files);
    when(ModelHelper.getFdeplInjector()).thenReturn(injector);
  }

  @Test
  public void buildModel() {

    generatorSuite = new TestableGeneratorSuite(francaModelLoader);
    generatorSuite.buildModels(Collections.singletonList(new File(MOCK_INPUT_PATH)));

    verify(francaModelLoader).load(eq(GeneratorSuite.getSpecPath()), any(), any());
    PowerMockito.verifyStatic();
    ModelHelper.getFdeplInjector();
    PowerMockito.verifyStatic();
    FrancaModelLoader.listFilesRecursively(new File(MOCK_INPUT_PATH));
  }

  @Test
  public void validateWithNotNullAndValidModel() {

    generatorSuite = new TestableGeneratorSuite(francaModelLoader);
    generatorSuite.buildModels(Collections.singletonList(new File(MOCK_INPUT_PATH)));
    when(ResourceValidator.validate(any(), any())).thenReturn(true);

    assertTrue(generatorSuite.validate());

    PowerMockito.verifyStatic();
    ResourceValidator.validate(any(), any());
  }

  @Test
  public void validateWithNotNullAndInValidModel() {

    generatorSuite = new TestableGeneratorSuite(francaModelLoader);
    generatorSuite.buildModels(Collections.singletonList(new File(MOCK_INPUT_PATH)));
    when(ResourceValidator.validate(any(), any())).thenReturn(false);

    assertFalse(generatorSuite.validate());

    PowerMockito.verifyStatic();
    ResourceValidator.validate(any(), any());
  }

  @Test
  public void buildModelWithTwoInputPaths() {

    generatorSuite = new TestableGeneratorSuite(francaModelLoader);

    ArrayList<File> inputPaths = new ArrayList<>();
    inputPaths.add(new File(MOCK_INPUT_PATH));
    inputPaths.add(new File(MOCK_INPUT_PATH_2));

    generatorSuite.buildModels(inputPaths);

    verify(francaModelLoader).load(eq(GeneratorSuite.getSpecPath()), any(), any());
    PowerMockito.verifyStatic();
    ModelHelper.getFdeplInjector();
    PowerMockito.verifyStatic();
    FrancaModelLoader.listFilesRecursively(new File(MOCK_INPUT_PATH_2));
    FrancaModelLoader.listFilesRecursively(new File(MOCK_INPUT_PATH));
  }
}
