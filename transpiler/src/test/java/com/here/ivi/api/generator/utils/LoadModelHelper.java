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

package com.here.ivi.api.generator.utils;

import static org.junit.Assert.assertTrue;

import com.here.ivi.api.generator.common.GeneratorSuite;
import com.here.ivi.api.loader.FrancaModelLoader;
import com.here.ivi.api.model.franca.FrancaModel;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.model.franca.ModelHelper;
import com.here.ivi.api.model.franca.TypeCollection;
import java.io.File;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.Collection;
import java.util.Collections;

public final class LoadModelHelper {

  public static FrancaModel readInFrancaModel(String fileName) throws URISyntaxException {

    URL testFidlResource = ClassLoader.getSystemClassLoader().getResource(fileName);
    Collection<File> testFidlFile = Collections.singletonList(new File(testFidlResource.toURI()));

    FrancaModelLoader francaModelLoader = new FrancaModelLoader();
    ModelHelper.getFdeplInjector().injectMembers(francaModelLoader);

    return francaModelLoader.load(GeneratorSuite.getSpecPath(), testFidlFile);
  }

  public static Interface extractNthInterfaceFromModel(FrancaModel model, int index) {
    assertTrue(index < model.interfaces.size());
    return model.interfaces.get(index);
  }

  public static TypeCollection extractNthTypeCollectionFromModel(FrancaModel model, int index) {
    assertTrue(index < model.typeCollections.size());
    return model.typeCollections.get(index);
  }
}
