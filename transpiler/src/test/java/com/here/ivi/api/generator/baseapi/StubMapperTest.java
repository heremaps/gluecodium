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

import static junit.framework.TestCase.assertNull;
import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.same;
import static org.mockito.Mockito.*;

import com.here.ivi.api.generator.common.cpp.CppNameRules;
import com.here.ivi.api.model.Interface;
import com.here.ivi.api.model.TypeCollection;
import com.here.ivi.api.model.cppmodel.CppClass;
import com.here.ivi.api.model.cppmodel.CppElement;
import com.here.ivi.api.model.cppmodel.CppNamespace;
import com.here.ivi.api.test.ArrayEList;
import java.util.Collections;
import navigation.BaseApiSpec;
import org.franca.core.franca.*;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Answers;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public class StubMapperTest {

  @SuppressWarnings("unused")
  @Mock
  private CppNameRules nameRules;

  @Mock private StubMethodMapper methodMapper;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private Interface<BaseApiSpec.InterfacePropertyAccessor> anInterface;

  @Mock private TypeCollection<BaseApiSpec.TypeCollectionPropertyAccessor> typeCollection;
  @Mock private FModel francaModel;

  private ArrayEList<FMethod> methods = new ArrayEList<>();

  @InjectMocks private StubMapper mapper;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    when(anInterface.getPackage()).thenReturn(Collections.singletonList("a package"));
    when(anInterface.getFrancaInterface().getMethods()).thenReturn(methods);
    when(anInterface.getFrancaInterface().getBase().eContainer()).thenReturn(francaModel);
  }

  @Test
  public void mapFrancaModelToCppModelWithNullElement() {
    CppNamespace namespace = mapper.mapFrancaModelToCppModel(null);

    assertNull(namespace);
  }

  @Test
  public void mapFrancaModelToCppModelWithTypeCollection() {
    CppNamespace namespace = mapper.mapFrancaModelToCppModel(typeCollection);

    assertNull(namespace);
  }

  @Test
  public void mapFrancaModelToCppModelWithEmptyInterface() {
    when(anInterface.getPackage()).thenReturn(Collections.emptyList());

    CppNamespace namespace = mapper.mapFrancaModelToCppModel(anInterface);

    assertNull(namespace);
  }

  @Test
  public void mapFrancaModelToCppModelWithAnInterface() {
    CppNamespace namespace = mapper.mapFrancaModelToCppModel(anInterface);

    assertNotNull(namespace);
    assertEquals(1, namespace.members.size());

    CppElement cppElement = namespace.members.get(0);
    assertTrue(cppElement instanceof CppClass);
    assertEquals(0, ((CppClass) cppElement).methods.size());

    verify(methodMapper, never()).mapMethodElements(any(), any(), any());
  }

  @Test
  public void mapFrancaModelToCppModelWithOneMethod() {
    FMethod francaMethod = mock(FMethod.class);
    methods.add(francaMethod);

    CppNamespace namespace = mapper.mapFrancaModelToCppModel(anInterface);

    assertNotNull(namespace);
    verify(methodMapper).mapMethodElements(any(), same(francaMethod), any());
  }
}
