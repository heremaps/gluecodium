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

package com.here.ivi.api.loader;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import com.here.ivi.api.loader.baseapi.BaseApiSpecAccessorFactory;
import com.here.ivi.api.model.franca.FrancaModel;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.model.franca.ModelHelper;
import java.io.File;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;
import navigation.BaseApiSpec;
import org.eclipse.emf.common.util.EList;
import org.franca.core.franca.FMethod;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class FrancaModelLoaderTest {

  /**
   * The test reproduces bug APIGEN-82. Each fidl got a single fdepl file assigned based on the
   * includes in the fdepl. When two fdepl files included the same fidl, the second one read would
   * replace the first one in the mapping. The test reads two fdepls, the first defines a method
   * const, the second one just includes the fidl. If the mapping would get overridden the method
   * would lose the constness information.
   *
   * @throws URISyntaxException
   */
  @Test
  public void multipleDeploymentsIncludingSameFidl() throws URISyntaxException {
    BaseApiSpecAccessorFactory accessorFactory = new BaseApiSpecAccessorFactory();

    FrancaModelLoader<?, ?> loader = new FrancaModelLoader<>(accessorFactory);
    ModelHelper.getFdeplInjector().injectMembers(loader);

    URL simpleFidl =
        ClassLoader.getSystemClassLoader().getResource("francamodelloadertest/Simple.fidl");
    URL simpleFdepl =
        ClassLoader.getSystemClassLoader()
            .getResource("francamodelloadertest/baseapi/Simple.fdepl");
    // Additional deployment rule also includes Simple.fidl and would replace the information from Simple.fdepl
    URL additionalFdepl =
        ClassLoader.getSystemClassLoader()
            .getResource("francamodelloadertest/baseapi/DependentOnSimple.fdepl");

    Collection<File> currentFiles =
        Arrays.asList(
            new File(simpleFdepl.toURI()),
            new File(simpleFidl.toURI()),
            new File(additionalFdepl.toURI()));
    FrancaModel<?, ?> model = loader.load(accessorFactory.getSpecPath(), currentFiles);

    List<? extends Interface<?>> interfaces = model.getInterfaces();
    assertEquals(1, interfaces.size());
    Interface<?> iface = interfaces.get(0);

    EList<FMethod> methods = iface.getFrancaInterface().getMethods();
    assertEquals(1, methods.size());
    FMethod constMethod = methods.get(0);

    BaseApiSpec.InterfacePropertyAccessor propertyAccessor = iface.getPropertyAccessor();
    assertTrue(propertyAccessor.getConst(constMethod));
  }
}
