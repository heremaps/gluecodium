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

import static junit.framework.TestCase.assertNotNull;
import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.GeneratorSuite;
import com.here.ivi.api.loader.FrancaModelLoader;
import com.here.ivi.api.model.franca.FrancaModel;
import com.here.ivi.api.validator.common.ResourceValidator;
import java.io.File;
import java.util.Collections;
import java.util.List;
import java.util.stream.Stream;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({ResourceValidator.class, GeneratorSuite.class, FrancaModelLoader.class})
public final class BaseApiGeneratorSuiteTest {

  private static final String MOCK_INPUT_PATH = "../fidl/files/are/here";
  private static final String MOCK_SPEC_PATH = "/a/random/directory/BaseApiSpec.fdepl";

  private BaseApiGeneratorSuite baseApiGeneratorSuite;

  @Mock private FrancaModel mockFrancaModel;
  @Mock private FrancaModelLoader francaModelLoader;

  @Before
  public void setUp() {
    PowerMockito.mockStatic(ResourceValidator.class, GeneratorSuite.class, FrancaModelLoader.class);
    MockitoAnnotations.initMocks(this);

    when(GeneratorSuite.getSpecPath()).thenReturn(MOCK_SPEC_PATH);
    when(francaModelLoader.load(any(), any())).thenReturn(mockFrancaModel);
    when(mockFrancaModel.stream()).thenReturn(Stream.empty());

    baseApiGeneratorSuite = new BaseApiGeneratorSuite(francaModelLoader);
  }

  @Test
  public void generateFilesEmptyModel() {
    GeneratedFile generatedFile = new GeneratedFile("a", "b");
    when(GeneratorSuite.copyTarget(any(), any())).thenReturn(generatedFile);
    baseApiGeneratorSuite.buildModels(Collections.singletonList(new File(MOCK_INPUT_PATH)));

    List<GeneratedFile> generatedFiles = baseApiGeneratorSuite.generate();

    assertNotNull(generatedFiles);
    assertEquals(
        "The cpp/internal/expected.h and cpp/enum_hash.h files should always be generated",
        2,
        generatedFiles.size());
    assertEquals(generatedFile, generatedFiles.get(0));
  }
}
