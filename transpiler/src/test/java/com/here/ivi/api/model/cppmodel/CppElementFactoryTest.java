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

package com.here.ivi.api.model.cppmodel;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.mockito.MockitoAnnotations.initMocks;
import static org.mockito.internal.verification.VerificationModeFactory.times;

import com.here.ivi.api.generator.common.CppElementFactory;
import com.here.ivi.api.model.InstanceHelper;
import navigation.BaseApiSpec;
import org.franca.core.franca.FAnnotationBlock;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FType;
import org.franca.core.franca.FTypeCollection;
import org.franca.core.franca.FTypeDef;
import org.franca.core.franca.FTypeRef;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Mock;

@RunWith(JUnit4.class)
public class CppElementFactoryTest {
  @Mock private CppModelAccessor<BaseApiSpec.InterfacePropertyAccessor> rootModel;
  @Mock private FTypeDef definition;
  @Mock private FTypeRef reference;
  @Mock private FAnnotationBlock annotationBlock;
  @Mock private FType derived;
  @Mock private FTypeCollection container;
  @Mock private FModel model;

  @Before
  public void setUp() {
    initMocks(this);
  }

  @Test
  public void createCppUsingWithUncommentedTypeAlias() {
    when(definition.getActualType()).thenReturn(reference);

    CppUsing cppUsing = CppElementFactory.create(rootModel, definition);
    assertNotNull(cppUsing);
    assertNull(cppUsing.comment);

    verify(definition).getActualType();
    verify(reference).getDerived();
    verify(definition).getComment();
  }

  @Test
  public void createCppUsingWithCommentedTypeAlias() {
    when(definition.getActualType()).thenReturn(reference);
    when(definition.getComment()).thenReturn(annotationBlock);
    String comment = "bla bla";
    when(annotationBlock.toString()).thenReturn(comment);

    CppUsing cppUsing = CppElementFactory.create(rootModel, definition);
    assertNotNull(cppUsing);
    assertEquals(cppUsing.comment, comment);

    verify(definition).getActualType();
    verify(reference).getDerived();
    verify(definition).getComment();
  }

  @Test
  public void createCppUsingWithTypeAliasInstanceId() {
    when(definition.getName()).thenReturn(InstanceHelper.INSTANCE_ID_POSTFIX);
    when(definition.getActualType()).thenReturn(reference);
    when(reference.getDerived()).thenReturn(derived);
    when(derived.eContainer()).thenReturn(container);
    when(container.eContainer()).thenReturn(model);
    when(derived.getName()).thenReturn(InstanceHelper.INSTANCE_ID_TYPE);
    String[] builtinModelParts = InstanceHelper.BUILTIN_MODEL.split("\\.");
    when(model.getName()).thenReturn(builtinModelParts[0]);
    when(container.getName()).thenReturn(builtinModelParts[1]);

    assertNull(CppElementFactory.create(rootModel, definition));

    verify(definition, times(2)).getName();
    verify(definition).getActualType();
    verify(reference).getDerived();
    verify(derived).eContainer();
    verify(container, times(2)).eContainer();
    verify(derived).getName();
    verify(model).getName();
    verify(container).getName();
  }
}
