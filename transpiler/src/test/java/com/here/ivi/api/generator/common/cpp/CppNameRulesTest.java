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
import static org.mockito.Mockito.when;

import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaElement;
import java.util.Arrays;
import java.util.List;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeCollection;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Answers;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(DefinedBy.class)
public class CppNameRulesTest {

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FrancaElement<?> mockFrancaModel;

  @Mock private FModel fModel;
  @Mock private FTypeCollection fTypeCollection;
  @Mock private FInterface fInterface;
  @Mock private FStructType fStructType;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(DefinedBy.class);
    //DefinedBy's constructor is private, so static creator method is excluded from mocking
    //and utilized to create an instance of DefinedBy
    PowerMockito.doCallRealMethod().when(DefinedBy.class);
    DefinedBy.createFromFrancaElement(any(FrancaElement.class));
  }

  @Test
  public void getQualifierForStructFromInterface() {
    when(mockFrancaModel.getFrancaTypeCollection()).thenReturn(fInterface);
    when(mockFrancaModel.getModelInfo().getFModel()).thenReturn(fModel);
    when(fInterface.getName()).thenReturn("Iface");
    when(fModel.getName()).thenReturn("my.fancy.package");
    DefinedBy defined = DefinedBy.createFromFrancaElement(mockFrancaModel);

    //now specify mock behavior of DefinedBy
    when(DefinedBy.createFromFModelElement(any())).thenReturn(defined);

    //act
    List<String> qualifier = CppNameRules.getQualifier(fStructType);

    //assert
    assertEquals(4, qualifier.size());
    assertEquals(Arrays.asList("my", "fancy", "package", "IfaceStub"), qualifier);

    //verify
    PowerMockito.verifyStatic();
    DefinedBy.createFromFModelElement(fStructType);
    Mockito.verify(mockFrancaModel).getFrancaTypeCollection();
    Mockito.verify(mockFrancaModel, Mockito.times(2)).getModelInfo();
    Mockito.verify(mockFrancaModel.getModelInfo()).getFModel();
    Mockito.verify(fInterface).getName();
    Mockito.verify(fModel).getName();
  }

  @Test
  public void getQualifierForStructFromTypeCollection() {
    when(mockFrancaModel.getFrancaTypeCollection()).thenReturn(fTypeCollection);
    when(mockFrancaModel.getModelInfo().getFModel()).thenReturn(fModel);
    when(fTypeCollection.getName()).thenReturn("TCollection");
    when(fModel.getName()).thenReturn("my.fancy.package");
    DefinedBy defined = DefinedBy.createFromFrancaElement(mockFrancaModel);

    //now specify mock behavior of DefinedBy
    when(DefinedBy.createFromFModelElement(any())).thenReturn(defined);

    //act
    List<String> qualifier = CppNameRules.getQualifier(fStructType);

    //assert
    assertEquals(4, qualifier.size());
    assertEquals(Arrays.asList("my", "fancy", "package", "TCollection"), qualifier);

    //verify
    PowerMockito.verifyStatic();
    DefinedBy.createFromFModelElement(fStructType);
    Mockito.verify(mockFrancaModel).getFrancaTypeCollection();
    Mockito.verify(mockFrancaModel, Mockito.times(2)).getModelInfo();
    Mockito.verify(mockFrancaModel.getModelInfo()).getFModel();
    Mockito.verify(fTypeCollection).getName();
    Mockito.verify(fModel).getName();
  }
}
