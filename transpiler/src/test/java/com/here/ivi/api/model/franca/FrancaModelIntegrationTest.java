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

package com.here.ivi.api.model.franca;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import com.here.ivi.api.generator.common.GeneratorSuite;
import com.here.ivi.api.loader.FrancaModelLoader;
import java.io.File;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.Arrays;
import java.util.Collection;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@SuppressWarnings("MethodName")
@RunWith(JUnit4.class)
public final class FrancaModelIntegrationTest {

  @Test
  public void joinModels_twoInterfacesFromSeparateFidlFiles() throws URISyntaxException {
    // Arrange
    FrancaModelLoader loader = new FrancaModelLoader();
    ModelHelper.getFdeplInjector().injectMembers(loader);

    URL simpleFidl =
        ClassLoader.getSystemClassLoader().getResource("francamodelloadertest/Simple.fidl");
    URL simpleFdepl =
        ClassLoader.getSystemClassLoader()
            .getResource("francamodelloadertest/baseapi/Simple.fdepl");

    Collection<File> currentFiles =
        Arrays.asList(new File(simpleFdepl.toURI()), new File(simpleFidl.toURI()));
    FrancaModel firstModel = loader.load(GeneratorSuite.getSpecPath(), currentFiles);

    URL otherFidl =
        ClassLoader.getSystemClassLoader().getResource("francamodelloadertest/OtherSimple.fidl");

    currentFiles = Arrays.asList(new File(otherFidl.toURI()));
    FrancaModel secondModel = loader.load(GeneratorSuite.getSpecPath(), currentFiles);

    // Act
    FrancaModel joinedModel = FrancaModel.joinModels(Arrays.asList(firstModel, secondModel));

    // Assert
    assertEquals(2, joinedModel.getInterfaces().size());
    assertEquals(1, joinedModel.getInterfaces().get(0).getFrancaInterface().getMethods().size());
    assertEquals(1, joinedModel.getInterfaces().get(1).getFrancaInterface().getMethods().size());

    Collection<String> methodNames =
        Arrays.asList(
            joinedModel.getInterfaces().get(0).getFrancaInterface().getMethods().get(0).getName(),
            joinedModel.getInterfaces().get(1).getFrancaInterface().getMethods().get(0).getName());
    assertTrue(methodNames.contains("sing"));
    assertTrue(methodNames.contains("drink"));
  }
}
