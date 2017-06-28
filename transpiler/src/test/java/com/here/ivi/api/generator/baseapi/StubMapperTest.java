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
import static org.junit.Assert.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

import com.here.ivi.api.generator.common.cpp.CppNameRules;
import com.here.ivi.api.model.cppmodel.CppClass;
import com.here.ivi.api.model.cppmodel.CppElement;
import com.here.ivi.api.model.cppmodel.CppNamespace;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.model.franca.TypeCollection;
import com.here.ivi.api.test.ArrayEList;
import java.util.Collections;
import navigation.BaseApiSpec;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FModel;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Answers;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({CppNameRules.class, StubMethodMapper.class})
public final class StubMapperTest {
  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private Interface<BaseApiSpec.InterfacePropertyAccessor> anInterface;

  @Mock private TypeCollection<BaseApiSpec.TypeCollectionPropertyAccessor> typeCollection;
  @Mock private FModel francaModel;

  private ArrayEList<FMethod> methods = new ArrayEList<>();

  @InjectMocks private StubMapper mapper;

  @Before
  public void setUp() {
    PowerMockito.mockStatic(CppNameRules.class);
    PowerMockito.mockStatic(StubMethodMapper.class);
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
  public void mapFrancaModelToCppModelWithAnInterface() {
    CppNamespace namespace = mapper.mapFrancaModelToCppModel(anInterface);

    assertNotNull(namespace);
    assertEquals(1, namespace.members.size());

    CppElement cppElement = namespace.members.get(0);
    assertTrue(cppElement instanceof CppClass);
    assertEquals(0, ((CppClass) cppElement).methods.size());

    PowerMockito.verifyStatic(never());
    StubMethodMapper.mapMethodElements(any(), any(), any());
  }

  @Test
  public void mapFrancaModelToCppModelWithOneMethod() {
    FMethod francaMethod = mock(FMethod.class);
    methods.add(francaMethod);

    CppNamespace namespace = mapper.mapFrancaModelToCppModel(anInterface);

    assertNotNull(namespace);
  }
}
