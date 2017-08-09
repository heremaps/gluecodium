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
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaElement;
import java.util.ArrayList;
import java.util.Arrays;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeCollection;
import org.junit.Before;
import org.junit.Rule;
import org.junit.Test;
import org.junit.rules.ExpectedException;
import org.junit.runner.RunWith;
import org.mockito.Answers;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest({CppNameRules.class, DefinedBy.class})
public class CppNamespaceUtilsTest {
  @Rule private final ExpectedException expectedException = ExpectedException.none();

  @Mock private FrancaElement<?> rootModel;

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FType fType;

  @Mock private FTypeCollection typeCollection;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(CppNameRules.class);
    PowerMockito.mockStatic(DefinedBy.class);
  }

  @Test
  public void getCppTypenameForNullFType() {
    expectedException.expect(IllegalArgumentException.class);

    CppNamespaceUtils.getCppTypename(rootModel, (FType) null);
  }

  @Test
  public void getCppTypenameForNullRootModel() {
    expectedException.expect(IllegalArgumentException.class);

    CppNamespaceUtils.getCppTypename(null, fType);
  }

  @Test
  public void getCppTypenameForNullArguments() {
    expectedException.expect(IllegalArgumentException.class);

    CppNamespaceUtils.getCppTypename(null, (FType) null);
  }

  @Test
  public void getCppTypenameTypeContainedInRootModel() {
    when(fType.getName()).thenReturn("foo");
    when(fType.eContainer()).thenReturn(typeCollection);
    when(rootModel.getFrancaTypeCollection()).thenReturn(typeCollection);

    String result = CppNamespaceUtils.getCppTypename(rootModel, fType);

    assertEquals("foo", result);
    verify(fType).getName();
    verify(fType).eContainer();
    verify(rootModel).getFrancaTypeCollection();
  }

  @Test
  public void getCppTypenameTypeOutsideRootModel() {
    DefinedBy definedBy = mock(DefinedBy.class);
    when(fType.getName()).thenReturn("foo");
    when(DefinedBy.createFromFrancaElement(rootModel)).thenReturn(definedBy);
    when(CppNameRules.getNamespace(definedBy))
        .thenReturn(new ArrayList<>(Arrays.asList("here", "guidance")));
    when(CppNameRules.getNestedNameSpecifier(fType))
        .thenReturn(new ArrayList<>(Arrays.asList("here", "routing", "rubberband")));
    when(CppNameRules.getCppTypename(fType.getName())).thenReturn("foo");

    String result = CppNamespaceUtils.getCppTypename(rootModel, fType);

    assertEquals("routing::rubberband::foo", result);
    PowerMockito.verifyStatic();
    DefinedBy.createFromFrancaElement(rootModel);
    PowerMockito.verifyStatic();
    CppNameRules.getNamespace(definedBy);
    PowerMockito.verifyStatic();
    CppNameRules.getNamespace(definedBy);
    PowerMockito.verifyStatic();
    CppNameRules.getCppTypename(fType.getName());
  }
}
