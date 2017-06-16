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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;

import com.here.ivi.api.generator.common.cpp.AbstractCppModelMapper;
import com.here.ivi.api.model.FrancaElement;
import com.here.ivi.api.model.cppmodel.CppNamespace;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;

@RunWith(JUnit4.class)
public class AbstractCppModelMapperTest {

  private static class TestableCppModelMapper extends AbstractCppModelMapper {

    @Override
    public CppNamespace mapFrancaModelToCppModel(FrancaElement<?> francaModel) {
      return null;
    }

    public List<CppNamespace> callPackageToCppNamespace(List<String> packages) {
      return AbstractCppModelMapper.packageToCppNamespace(packages);
    }
  }

  private final String cppNamespaceName = "a namespace";

  private final TestableCppModelMapper mapper = new TestableCppModelMapper();

  @Test
  public void packageToCppNamespaceWithNullPackages() {
    List<CppNamespace> namespaces = mapper.callPackageToCppNamespace(null);

    assertNotNull(namespaces);
    assertTrue(namespaces.isEmpty());
  }

  @Test
  public void packageToCppNamespaceWithEmptyPackages() {
    List<CppNamespace> namespaces = mapper.callPackageToCppNamespace(Collections.emptyList());

    assertNotNull(namespaces);
    assertTrue(namespaces.isEmpty());
  }

  @Test
  public void packageToCppNamespaceWithOnePackage() {
    final List<String> packages = Collections.singletonList(cppNamespaceName);

    List<CppNamespace> namespaces = mapper.callPackageToCppNamespace(packages);

    assertNotNull(namespaces);
    assertEquals(1, namespaces.size());
    assertEquals(cppNamespaceName, namespaces.get(0).name);
  }

  @Test
  public void packageToCppNamespaceWithTwoPackages() {
    final String childCppNamespaceName = "another namespace";
    final List<String> packages = Arrays.asList(cppNamespaceName, childCppNamespaceName);

    List<CppNamespace> namespaces = mapper.callPackageToCppNamespace(packages);

    assertNotNull(namespaces);
    assertEquals(2, namespaces.size());
    assertEquals(cppNamespaceName, namespaces.get(0).name);
    assertEquals(childCppNamespaceName, namespaces.get(1).name);
    assertTrue(namespaces.get(0).members.contains(namespaces.get(1)));
  }
}
