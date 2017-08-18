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
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;
import static org.powermock.api.mockito.PowerMockito.verifyStatic;

import com.here.ivi.api.model.franca.DefinedBy;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.franca.Interface;
import com.here.ivi.api.model.franca.ModelInfo;
import com.here.ivi.api.model.franca.TypeCollection;
import java.util.Arrays;
import java.util.List;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FModel;
import org.franca.core.franca.FType;
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
  @Mock private FType fType;
  @Mock private ModelInfo modelInfo;
  @Mock private Interface anInterface;
  @Mock private TypeCollection typeCollection;

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
  public void getNestedNameSpecifierForTypeFromInterface() {
    when(mockFrancaModel.getFrancaTypeCollection()).thenReturn(fInterface);
    when(mockFrancaModel.getModelInfo().getFModel()).thenReturn(fModel);
    when(fInterface.getName()).thenReturn("Iface");
    when(fModel.getName()).thenReturn("my.fancy.package");
    DefinedBy defined = DefinedBy.createFromFrancaElement(mockFrancaModel);

    //now specify mock behavior of DefinedBy
    when(DefinedBy.createFromFModelElement(any())).thenReturn(defined);

    //act
    List<String> qualifier = CppNameRules.getNestedNameSpecifier(fType);

    //assert
    assertEquals(4, qualifier.size());
    assertEquals(Arrays.asList("my", "fancy", "package", "IfaceStub"), qualifier);

    //verify
    verifyStatic();
    DefinedBy.createFromFModelElement(fType);
    verify(mockFrancaModel).getFrancaTypeCollection();
    verify(mockFrancaModel, Mockito.times(2)).getModelInfo();
    verify(mockFrancaModel.getModelInfo()).getFModel();
    verify(fInterface).getName();
    verify(fModel).getName();
  }

  @Test
  public void getNestedNameSpecifierForTypeFromTypeCollection() {
    when(mockFrancaModel.getFrancaTypeCollection()).thenReturn(fTypeCollection);
    when(mockFrancaModel.getModelInfo().getFModel()).thenReturn(fModel);
    when(fTypeCollection.getName()).thenReturn("TCollection");
    when(fModel.getName()).thenReturn("my.fancy.package");
    DefinedBy defined = DefinedBy.createFromFrancaElement(mockFrancaModel);

    //now specify mock behavior of DefinedBy
    when(DefinedBy.createFromFModelElement(any())).thenReturn(defined);

    //act
    List<String> qualifier = CppNameRules.getNestedNameSpecifier(fType);

    //assert
    assertEquals(4, qualifier.size());
    assertEquals(Arrays.asList("my", "fancy", "package", "tcollection"), qualifier);

    //verify
    verifyStatic();
    DefinedBy.createFromFModelElement(fType);
    verify(mockFrancaModel).getFrancaTypeCollection();
    verify(mockFrancaModel, Mockito.times(2)).getModelInfo();
    verify(mockFrancaModel.getModelInfo()).getFModel();
    verify(fTypeCollection).getName();
    verify(fModel).getName();
  }

  @Test
  public void getHeaderNameForInterface() {
    List<String> packageNames = Arrays.asList("my", "fancy", "package");
    when(anInterface.getModelInfo()).thenReturn(modelInfo);
    when(modelInfo.getPackageNames()).thenReturn(packageNames);
    when(anInterface.getFrancaInterface()).thenReturn(fInterface);
    when(fInterface.getName()).thenReturn("FancyName");

    String headerPath = CppNameRules.getHeaderPath(anInterface);

    assertEquals("stub/my/fancy/package/FancyNameStub.h", headerPath);

    verify(anInterface).getModelInfo();
    verify(modelInfo).getPackageNames();
    verify(anInterface).getFrancaInterface();
    verify(fInterface).getName();
  }

  @Test
  public void getHeaderNameForTypeCollection() {
    List<String> packageNames = Arrays.asList("my", "fancy", "package");
    when(typeCollection.getModelInfo()).thenReturn(modelInfo);
    when(modelInfo.getPackageNames()).thenReturn(packageNames);
    when(typeCollection.getFrancaTypeCollection()).thenReturn(fTypeCollection);
    when(fTypeCollection.getName()).thenReturn("FancyTypeCollectionName");

    String headerPath = CppNameRules.getHeaderPath(typeCollection);

    assertEquals("stub/my/fancy/package/FancyTypeCollectionName.h", headerPath);

    verify(typeCollection).getModelInfo();
    verify(modelInfo).getPackageNames();
    verify(typeCollection).getFrancaTypeCollection();
    verify(fTypeCollection).getName();
  }
}
