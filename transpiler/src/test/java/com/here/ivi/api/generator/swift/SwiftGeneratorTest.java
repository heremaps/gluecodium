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

package com.here.ivi.api.generator.swift;

import static com.here.ivi.api.test.Assert.assertContains;
import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;
import static org.powermock.api.mockito.PowerMockito.mockStatic;

import com.here.ivi.api.generator.cbridge.CBridgeNameRules;
import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.test.ArrayEList;
import java.util.*;
import java.util.stream.Collectors;
import org.eclipse.emf.common.util.EList;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FModel;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({SwiftNameRules.class, CBridgeNameRules.class})
public class SwiftGeneratorTest {
  @Mock private Interface francaElement;
  @Mock private FModel francaModel;
  @Mock private FInterface francaInterface;
  private SwiftGenerator swiftGenerator;

  @Before
  public void setUp() {
    mockStatic(SwiftNameRules.class, CBridgeNameRules.class);
    initMocks(this);
    when(francaElement.getFrancaInterface()).thenReturn(francaInterface);
    when(francaElement.getFrancaModel()).thenReturn(francaModel);
    EList<FInterface> interfaces = new ArrayEList<>();
    interfaces.add(francaInterface);
    when(francaModel.getInterfaces()).thenReturn(interfaces);
    EList<FMethod> methods = new ArrayEList<>();
    when(francaInterface.getMethods()).thenReturn(methods);
    when(SwiftNameRules.getImplementationFileName(any())).thenReturn("file");
    swiftGenerator = new SwiftGenerator();
  }

  @Test
  public void emptyPackage() {
    final String expectedPath =
        SwiftNameRules.TARGET_DIRECTORY + SwiftGenerator.STATIC_FILES.get(0);

    List<GeneratedFile> generatedFiles = swiftGenerator.generate(francaElement);

    final Set<String> generatedPaths =
        generatedFiles.stream().map(file -> file.targetFile.getPath()).collect(Collectors.toSet());
    assertEquals("Expect static file and generated file", 2, generatedFiles.size());
    assertContains(generatedPaths, expectedPath);
  }

  @Test
  public void packageHierarchy() {
    final String expectedPath =
        SwiftNameRules.TARGET_DIRECTORY + "some/" + SwiftGenerator.STATIC_FILES.get(0);
    when(francaElement.getPackageNames()).thenReturn(Arrays.asList("some", "hierarchy"));

    List<GeneratedFile> generatedFiles = swiftGenerator.generate(francaElement);

    final Set<String> generatedPaths =
        generatedFiles.stream().map(file -> file.targetFile.getPath()).collect(Collectors.toSet());
    assertEquals("Expect static file and generated file", 2, generatedFiles.size());
    assertContains(generatedPaths, expectedPath);
  }

  @Test
  public void multiplePackageNames() {
    final String expectedPath =
        SwiftNameRules.TARGET_DIRECTORY + "some/" + SwiftGenerator.STATIC_FILES.get(0);
    final String otherExpectedPath =
        SwiftNameRules.TARGET_DIRECTORY + "totally/" + SwiftGenerator.STATIC_FILES.get(0);
    Interface otherElement = mock(Interface.class);
    when(otherElement.getPackageNames()).thenReturn(Arrays.asList("totally", "different"));
    when(francaElement.getPackageNames()).thenReturn(Arrays.asList("some", "hierarchy"));
    FInterface otherFrancaInterface = mock(FInterface.class);
    when(otherElement.getFrancaInterface()).thenReturn(otherFrancaInterface);

    List<GeneratedFile> generatedFiles = swiftGenerator.generate(francaElement);
    List<GeneratedFile> otherGeneratedFiles = swiftGenerator.generate(otherElement);

    final Set<String> generatedPaths =
        generatedFiles.stream().map(file -> file.targetFile.getPath()).collect(Collectors.toSet());
    final Set<String> otherGeneratedPaths =
        otherGeneratedFiles
            .stream()
            .map(file -> file.targetFile.getPath())
            .collect(Collectors.toSet());
    assertEquals("Expect static file and generated file", 2, generatedFiles.size());
    assertEquals("Expect static file and generated file", 2, otherGeneratedFiles.size());
    assertContains(generatedPaths, expectedPath);
    assertContains(otherGeneratedPaths, otherExpectedPath);
  }
}
