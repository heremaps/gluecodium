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

package com.here.ivi.api.generator.common.jni;

import static com.here.ivi.api.generator.common.jni.JniModelBuilder.CorrespondenceTreeNode;
import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.when;

import com.here.ivi.api.generator.baseapi.StubModelBuilder;
import com.here.ivi.api.generator.common.ModelBuilderContextStack;
import com.here.ivi.api.generator.common.java.JavaModelBuilder;
import com.here.ivi.api.model.cppmodel.CppClass;
import com.here.ivi.api.model.cppmodel.CppMethod;
import com.here.ivi.api.model.javamodel.JavaClass;
import com.here.ivi.api.model.javamodel.JavaMethod;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Answers;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public class JniModelBuilderTest {

  @Mock private JavaModelBuilder javaBuilder;
  @Mock private StubModelBuilder stubBuilder;

  private final JavaMethod myFancyJavaMethod = new JavaMethod("myFancyJavaMethod");
  private final CppMethod myFancyCppMethod = new CppMethod.Builder("thisIsCPlusCplus").build();

  private final JavaClass myFancyJavaClass = new JavaClass("jAVaClazz");
  private final CppClass myFancyCppClass = new CppClass("c++Class");

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private ModelBuilderContextStack<CorrespondenceTreeNode> contextStack;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    contextStack.getCurrentContext().currentResults = new ArrayList<>();
    contextStack.getCurrentContext().previousResults = new ArrayList<>();
    contextStack.getParentContext().previousResults = new ArrayList<>();
  }

  private void injectResult(CorrespondenceTreeNode element) {
    contextStack.getCurrentContext().previousResults.add(element);
  }

  @Test
  public void finishBuildingFMethod() {
    //arrange
    when(javaBuilder.getResults()).thenReturn(Arrays.asList(myFancyJavaMethod));
    when(stubBuilder.getResults()).thenReturn(Arrays.asList(myFancyCppMethod));

    JniModelBuilder jniModelBuilder = new JniModelBuilder(contextStack, javaBuilder, stubBuilder);
    FMethod fMethod = null;

    //act
    jniModelBuilder.finishBuilding(fMethod);
    List<CorrespondenceTreeNode> result = jniModelBuilder.getResults();

    //assert
    assertEquals(1, result.size());
    assertEquals(myFancyCppMethod, result.get(0).elementPair.stubElement);
    assertEquals(myFancyJavaMethod, result.get(0).elementPair.javaElement);
  }

  @Test
  public void finishBuildingFMethodWrongType() {
    //arrange, kind of types don't match  (method vs class)
    when(javaBuilder.getResults()).thenReturn(Arrays.asList(myFancyJavaMethod));
    when(stubBuilder.getResults()).thenReturn(Arrays.asList(myFancyCppClass));

    JniModelBuilder jniModelBuilder = new JniModelBuilder(contextStack, javaBuilder, stubBuilder);
    FMethod fMethod = null;

    //act
    jniModelBuilder.finishBuilding(fMethod);
    List<CorrespondenceTreeNode> result = jniModelBuilder.getResults();

    //assert
    assertEquals(0, result.size());
  }

  @Test
  public void finishBuildingFInterfaceWithMethods() {
    //arrange model builders returning classes and inject some former processed methods
    injectResult(new CorrespondenceTreeNode(myFancyJavaMethod, myFancyCppMethod));
    when(javaBuilder.getResults()).thenReturn(Arrays.asList(myFancyJavaClass));
    when(stubBuilder.getResults()).thenReturn(Arrays.asList(myFancyCppClass));

    JniModelBuilder jniModelBuilder = new JniModelBuilder(contextStack, javaBuilder, stubBuilder);
    FInterface fInterface = null;

    //act
    jniModelBuilder.finishBuilding(fInterface);
    List<CorrespondenceTreeNode> result = jniModelBuilder.getResults();

    //assert
    assertEquals(1, result.size());
    assertEquals(myFancyCppClass, result.get(0).elementPair.stubElement);
    assertEquals(myFancyJavaClass, result.get(0).elementPair.javaElement);
    assertEquals(1, result.get(0).children.size());
    assertEquals(myFancyJavaMethod, result.get(0).children.get(0).elementPair.javaElement);
    assertEquals(myFancyCppMethod, result.get(0).children.get(0).elementPair.stubElement);
  }

  @Test
  public void finishBuildingFInterfaceWithMethodsWrongTypes() {
    //arrange wrong kind of types (class vs method)
    injectResult(new CorrespondenceTreeNode(myFancyJavaMethod, myFancyCppMethod));
    when(javaBuilder.getResults()).thenReturn(Arrays.asList(myFancyJavaClass));
    when(stubBuilder.getResults()).thenReturn(Arrays.asList(myFancyCppMethod));

    JniModelBuilder jniModelBuilder = new JniModelBuilder(contextStack, javaBuilder, stubBuilder);
    FInterface fInterface = null;

    //act
    jniModelBuilder.finishBuilding(fInterface);
    List<CorrespondenceTreeNode> result = jniModelBuilder.getResults();

    //assert
    assertEquals(0, result.size());
  }
}
