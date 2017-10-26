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

import static org.junit.Assert.*;

import com.here.ivi.api.TranspilerExecutionException;
import com.here.ivi.api.generator.common.GeneratorSuite;
import com.here.ivi.api.model.franca.FrancaModel;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.model.franca.ModelHelper;
import java.io.File;
import java.net.URISyntaxException;
import java.net.URL;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import org.eclipse.emf.common.util.EList;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FType;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class FrancaModelLoaderTest {

  @Rule public final ExpectedException exception = ExpectedException.none();

  private final FrancaModelLoader loader = new FrancaModelLoader();

  @Before
  public void setUp() {
    ModelHelper.getFdeplInjector().injectMembers(loader);
  }

  /**
   * The test reproduces bug APIGEN-82. Each fidl got a single fdepl file assigned based on the
   * includes in the fdepl. When two fdepl files included the same fidl, the second one read would
   * replace the first one in the mapping. The test reads two fdepls, the first defines a method
   * const, the second one just includes the fidl. If the mapping would get overridden the method
   * would lose the constness information.
   */
  @Test
  public void multipleDeploymentsIncludingSameFidl() throws URISyntaxException {
    URL simpleFidl =
        ClassLoader.getSystemClassLoader().getResource("francamodelloadertest/Simple.fidl");
    URL simpleFdepl =
        ClassLoader.getSystemClassLoader().getResource("francamodelloadertest/Simple.fdepl");
    // Additional deployment rule also includes Simple.fidl
    // and would replace the information from Simple.fdepl
    URL additionalFdepl =
        ClassLoader.getSystemClassLoader()
            .getResource("francamodelloadertest/DependentOnSimple.fdepl");

    Collection<File> currentFiles =
        Arrays.asList(
            new File(simpleFdepl.toURI()),
            new File(simpleFidl.toURI()),
            new File(additionalFdepl.toURI()));
    FrancaModel model = loader.load(GeneratorSuite.getSpecPath(), currentFiles);

    assertEquals(1, model.interfaces.size());
    Interface iface = model.interfaces.get(0);

    EList<FMethod> methods = iface.getFrancaInterface().getMethods();
    assertEquals(1, methods.size());
    FMethod constMethod = methods.get(0);

    assertTrue(model.deploymentModel.isConst(constMethod));
  }

  @Test
  public void loadMalformedDeploymentModelWithPackage() throws URISyntaxException {
    exception.expect(TranspilerExecutionException.class);

    URL malformedFdepl =
        ClassLoader.getSystemClassLoader()
            .getResource("francamodelloadertest/MalformedWithPackage.fdepl");

    Collection<File> currentFiles = Collections.singletonList(new File(malformedFdepl.toURI()));
    loader.load(GeneratorSuite.getSpecPath(), currentFiles);
  }

  @Test
  public void getDeploymentPropertiesForAlternativeRepresentation() throws URISyntaxException {
    URL instanceFidl =
        ClassLoader.getSystemClassLoader().getResource("francamodelloadertest/Instance.fidl");
    URL instanceFdepl =
        ClassLoader.getSystemClassLoader().getResource("francamodelloadertest/Instance.fdepl");
    URL refersToInstanceFidl =
        ClassLoader.getSystemClassLoader()
            .getResource("francamodelloadertest/RefersToInstance.fidl");

    Collection<File> currentFiles =
        Arrays.asList(
            new File(instanceFidl.toURI()),
            new File(instanceFdepl.toURI()),
            new File(refersToInstanceFidl.toURI()));
    FrancaModel model = loader.load(GeneratorSuite.getSpecPath(), currentFiles);

    assertEquals(2, model.interfaces.size());

    Interface barInterfaceWrapper = model.interfaces.get(0);
    assertEquals("Bar", barInterfaceWrapper.getName());

    Interface factoryInterfaceWrapper = model.interfaces.get(1);
    assertEquals("BarFactory", factoryInterfaceWrapper.getName());

    FMethod factoryMethod = factoryInterfaceWrapper.getFrancaInterface().getMethods().get(0);
    FType parameterType = factoryMethod.getOutArgs().get(0).getType().getDerived();
    assertEquals("Bar", parameterType.getName());

    // barInterface and barInterfaceThroughReferrer are two *different* in-memory representations
    // of the same Franca interface.
    FInterface barInterface = barInterfaceWrapper.getFrancaInterface();
    FInterface barInterfaceThroughReferrer = (FInterface) parameterType.eContainer();
    assertNotSame(barInterfaceThroughReferrer, barInterface);

    // barInterfaceThroughReferrer deployment properties should be, nevertheless, accessible through
    // its cousin's wrapper.
    assertTrue(model.deploymentModel.isInterface(barInterfaceThroughReferrer));
  }

  @Test
  public void getDeploymentPropertiesForSameNameInterfaces() throws URISyntaxException {
    URL instanceFidl =
        ClassLoader.getSystemClassLoader().getResource("francamodelloadertest/Instance.fidl");
    URL instanceFdepl =
        ClassLoader.getSystemClassLoader().getResource("francamodelloadertest/Instance.fdepl");
    URL otherInstanceFidl =
        ClassLoader.getSystemClassLoader().getResource("francamodelloadertest/OtherInstance.fidl");
    URL otherInstanceFdepl =
        ClassLoader.getSystemClassLoader().getResource("francamodelloadertest/OtherInstance.fdepl");

    Collection<File> currentFiles =
        Arrays.asList(
            new File(instanceFidl.toURI()),
            new File(instanceFdepl.toURI()),
            new File(otherInstanceFidl.toURI()),
            new File(otherInstanceFdepl.toURI()));
    FrancaModel model = loader.load(GeneratorSuite.getSpecPath(), currentFiles);

    assertEquals(2, model.interfaces.size());

    Interface fooBarInterfaceWrapper = model.interfaces.get(0);
    assertEquals("Bar", fooBarInterfaceWrapper.getName());
    assertEquals("foo", fooBarInterfaceWrapper.getFrancaModel().getName());

    Interface weeBarInterfaceWrapper = model.interfaces.get(1);
    assertEquals("Bar", fooBarInterfaceWrapper.getName());
    assertEquals("wee", weeBarInterfaceWrapper.getFrancaModel().getName());

    assertTrue(model.deploymentModel.isInterface(fooBarInterfaceWrapper.getFrancaInterface()));
    assertFalse(model.deploymentModel.isInterface(weeBarInterfaceWrapper.getFrancaInterface()));
  }
}
