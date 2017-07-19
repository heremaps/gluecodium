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

package com.here.ivi.api.generator.common.cpp;

import static org.junit.Assert.assertEquals;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.franca.ModelInfo;
import java.util.ArrayList;
import java.util.Arrays;
import org.franca.core.franca.FTypeCollection;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.mockito.Answers;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(CppNameRules.class)
public class CppNamespaceUtilsTypeDefTest {
  @Rule private final ExpectedException expectedException = ExpectedException.none();

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FrancaElement<?> rootModel;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FrancaElement<?> francaElement;

  @Mock private FTypeCollection typeCollection;
  @Mock private FTypeCollection typeCollection2;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(CppNameRules.class);
  }

  @Test
  public void getCppTypeDefTypenameForNullArguments() {
    expectedException.expect(IllegalArgumentException.class);

    CppNamespaceUtils.getCppTypename(null, (DefinedBy) null);
  }

  @Test
  public void getCppTypeDefTypenameForNullTypeDefiner() {
    expectedException.expect(IllegalArgumentException.class);

    CppNamespaceUtils.getCppTypename(rootModel, (DefinedBy) null);
  }

  @Test
  public void getCppTypeDefTypenameForNullTypeDefinerType() {
    expectedException.expect(IllegalArgumentException.class);

    ModelInfo modelInfo = mock(ModelInfo.class);
    when(modelInfo.getFModel()).thenReturn(null);
    when(francaElement.getFrancaTypeCollection()).thenReturn(null);
    when(francaElement.getModelInfo()).thenReturn(modelInfo);
    DefinedBy definedByWithNullType = DefinedBy.createFromFrancaElement(francaElement);

    CppNamespaceUtils.getCppTypename(rootModel, definedByWithNullType);
  }

  @Test
  public void getCppTypeDefTypenameForNullModel() {
    expectedException.expect(IllegalArgumentException.class);
    DefinedBy definedBy = DefinedBy.createFromFrancaElement(francaElement);

    CppNamespaceUtils.getCppTypename(null, definedBy);
  }

  @Test
  public void getCppTypeDefTypenameContainedInRootModel() {
    when(francaElement.getFrancaTypeCollection()).thenReturn(typeCollection2);
    when(rootModel.getFrancaTypeCollection()).thenReturn(typeCollection);
    when(typeCollection2.eContainer()).thenReturn(typeCollection);
    when(typeCollection2.getName()).thenReturn("foo");
    DefinedBy definedBy = DefinedBy.createFromFrancaElement(francaElement);

    String result = CppNamespaceUtils.getCppTypename(rootModel, definedBy);

    assertEquals("foo", result);
    verify(rootModel).getFrancaTypeCollection();
    verify(typeCollection2).eContainer();
  }

  @Test
  public void getCppTypeDefTypenameTypeOutsideRootModel() {
    when(francaElement.getFrancaTypeCollection()).thenReturn(typeCollection);
    when(typeCollection.getName()).thenReturn("foo");
    when(CppNameRules.getNamespace((DefinedBy) any()))
        .thenReturn(new ArrayList<>(Arrays.asList("here", "routing")))
        .thenReturn(new ArrayList<>(Arrays.asList("here", "guidance")));
    when(CppNameRules.getClassName(typeCollection.getName())).thenReturn("FOO");
    DefinedBy definedBy = DefinedBy.createFromFrancaElement(francaElement);

    String result = CppNamespaceUtils.getCppTypename(rootModel, definedBy);

    assertEquals("guidance::FOO", result);
    PowerMockito.verifyStatic(Mockito.times(2));
    CppNameRules.getNamespace((DefinedBy) any());
    PowerMockito.verifyStatic();
    CppNameRules.getClassName(typeCollection.getName());
  }
}
