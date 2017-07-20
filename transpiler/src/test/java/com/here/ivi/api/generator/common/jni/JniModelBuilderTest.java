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

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.when;

import com.here.ivi.api.generator.baseapi.StubModelBuilder;
import com.here.ivi.api.generator.common.ModelBuilderContextStack;
import com.here.ivi.api.generator.common.java.JavaModelBuilder;
import com.here.ivi.api.model.cppmodel.CppClass;
import com.here.ivi.api.model.cppmodel.CppCustomType;
import com.here.ivi.api.model.cppmodel.CppMethod;
import com.here.ivi.api.model.cppmodel.CppParameter;
import com.here.ivi.api.model.cppmodel.CppPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaClass;
import com.here.ivi.api.model.javamodel.JavaCustomType;
import com.here.ivi.api.model.javamodel.JavaMethod;
import com.here.ivi.api.model.javamodel.JavaPackage;
import com.here.ivi.api.model.javamodel.JavaParameter;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaReferenceType;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.franca.core.franca.FArgument;
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

  @Mock private FInterface francaInterface;
  @Mock private FMethod francaMethod;
  @Mock private FArgument francaArgument;

  @Mock private JavaModelBuilder javaBuilder;
  @Mock private StubModelBuilder stubBuilder;

  private static final List<String> JAVA_PACKAGES = Arrays.asList("my", "java", "test");

  private static final List<String> CPP_NAMESPACE_MEMBERS =
      Arrays.asList("my", "cpp", "stuffs", "namespace");

  private static final String JAVA_CLASS_NAME = "jAvaClazz";
  private static final String CPP_CLASS_NAME = "cPpClass";

  private static final String CPP_VOID_METHOD_NAME = "cPpWork3R_vOid";
  private static final String CPP_INT_METHOD_NAME = "cPpWork3R_iNt";
  private static final String CPP_STRING_METHOD_NAME = "cPpWork3R_Stdstring";

  private static final String JAVA_VOID_METHOD_NAME = "fancyMEthoD_v0id";
  private static final String JAVA_INT_METHOD_NAME = "fancyMEthoD_integer";
  private static final String JAVA_STRING_METHOD_NAME = "fancyMEthoD_String";

  private static final String BASE_NAME_PARAMETER = "theParam";

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private ModelBuilderContextStack<JniElement> contextStack;

  private JniParameter jniParameter = new JniParameter(BASE_NAME_PARAMETER, null, null);

  private JniModelBuilder correspondenceBuilder;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

    correspondenceBuilder = new JniModelBuilder(contextStack, javaBuilder, stubBuilder);

    contextStack.getCurrentContext().currentResults = new ArrayList<>();
    contextStack.getCurrentContext().previousResults = new ArrayList<>();
    contextStack.getParentContext().previousResults = new ArrayList<>();
  }

  private void injectResult(JniElement element) {
    contextStack.getCurrentContext().previousResults.add(element);
  }

  private static JavaMethod createJavaMethodVoid() {
    return new JavaMethod(JAVA_VOID_METHOD_NAME);
  }

  private static CppMethod createCppMethodVoid() {
    return new CppMethod.Builder(CPP_VOID_METHOD_NAME).build();
  }

  private static JavaMethod createJavaMethodInt() {
    JavaMethod javaMethod =
        new JavaMethod(JAVA_INT_METHOD_NAME, new JavaPrimitiveType(JavaPrimitiveType.Type.INT));
    javaMethod.parameters.add(
        new JavaParameter(new JavaPrimitiveType(JavaPrimitiveType.Type.INT), BASE_NAME_PARAMETER));
    return javaMethod;
  }

  private static CppMethod createCppMethodInt() {
    CppParameter cppParameter = new CppParameter();
    cppParameter.type = new CppPrimitiveType(CppPrimitiveType.Type.INT8);

    return new CppMethod.Builder(CPP_INT_METHOD_NAME)
        .inParameter(cppParameter)
        .returnType(new CppPrimitiveType(CppPrimitiveType.Type.INT8))
        .build();
  }

  private JniMethod createJniMethodVoid(JniModel jniModel) {

    JniMethod result = new JniMethod();
    result.javaReturnType = new JavaPrimitiveType(JavaPrimitiveType.Type.VOID);
    result.javaMethodName = JAVA_VOID_METHOD_NAME;
    result.cppMethodName = CPP_VOID_METHOD_NAME;
    result.cppReturnType = CppPrimitiveType.VOID_TYPE;
    result.owningModel = jniModel;

    return result;
  }

  private JniMethod createJniMethodString(JniModel jniModel) {

    JavaReferenceType stringType = new JavaReferenceType(JavaReferenceType.Type.STRING);
    JniMethod result = new JniMethod();
    result.javaReturnType = stringType;
    result.javaMethodName = JAVA_STRING_METHOD_NAME;
    result.cppMethodName = CPP_STRING_METHOD_NAME;
    result.cppReturnType = new CppCustomType(CppCustomType.STRING_TYPE_NAME);
    result.owningModel = jniModel;
    result.parameters.add(
        new JniParameter(
            BASE_NAME_PARAMETER, stringType, new CppCustomType(CppCustomType.STRING_TYPE_NAME)));

    return result;
  }

  private void verifyJniModel(List<JniElement> jniElementList, List<JniMethod> expectedMethodList) {
    assertEquals(1, jniElementList.size());
    assertTrue(jniElementList.get(0) instanceof JniModel);
    JniModel jniModel = (JniModel) jniElementList.get(0);
    assertEquals(CPP_CLASS_NAME, jniModel.cppClassName);
    assertEquals(JAVA_CLASS_NAME, jniModel.javaClassName);
    assertEquals(CPP_NAMESPACE_MEMBERS, jniModel.cppNameSpaces);
    assertEquals(JAVA_PACKAGES, jniModel.javaPackages);
    assertEquals(expectedMethodList.size(), jniModel.methods.size());
    for (int i = 0; i < expectedMethodList.size(); ++i) {
      assertEquals(expectedMethodList.get(i), jniModel.methods.get(i));
    }
  }

  @Test
  public void finishBuildingFMethodVoid() {
    //arrange
    when(javaBuilder.getFirstResult(any())).thenReturn(createJavaMethodVoid());
    when(stubBuilder.getFirstResult(any())).thenReturn(createCppMethodVoid());

    //act
    correspondenceBuilder.finishBuilding(francaMethod);
    List<JniElement> result = correspondenceBuilder.getResults();

    //assert
    assertEquals(1, result.size());
    assertTrue(result.get(0) instanceof JniMethod);
    JniMethod method = (JniMethod) result.get(0);
    assertEquals(createJniMethodVoid(null), method);
  }

  @Test
  public void finishBuildingFrancaMethodReadsJavaCppMethods() {
    JavaMethod javaMethod = createJavaMethodInt();
    CppMethod cppMethod = createCppMethodInt();
    when(javaBuilder.getFirstResult(any())).thenReturn(javaMethod);
    when(stubBuilder.getFirstResult(any())).thenReturn(cppMethod);

    correspondenceBuilder.finishBuilding(francaMethod);

    JniMethod jniMethod = correspondenceBuilder.getFirstResult(JniMethod.class);
    assertNotNull(jniMethod);
    assertEquals(javaMethod.name, jniMethod.javaMethodName);
    assertEquals(javaMethod.returnType, jniMethod.javaReturnType);
    assertEquals(cppMethod.name, jniMethod.cppMethodName);
    assertEquals(cppMethod.getReturnType(), jniMethod.cppReturnType);
  }

  @Test
  public void finishBuildingFrancaMethodReadsJniParameters() {
    injectResult(jniParameter);
    when(javaBuilder.getFirstResult(any())).thenReturn(createJavaMethodInt());
    when(stubBuilder.getFirstResult(any())).thenReturn(createCppMethodInt());

    correspondenceBuilder.finishBuilding(francaMethod);

    JniMethod jniMethod = correspondenceBuilder.getFirstResult(JniMethod.class);
    assertNotNull(jniMethod);
    assertEquals(1, jniMethod.parameters.size());
    assertEquals(jniParameter, jniMethod.parameters.get(0));
  }

  @Test
  public void finishBuildingFInterfaceWithOutMethods() {
    //arrange
    JavaClass javaClass = new JavaClass(JAVA_CLASS_NAME);
    javaClass.javaPackage = new JavaPackage(JAVA_PACKAGES);
    when(javaBuilder.getFirstResult(any())).thenReturn(javaClass);
    when(stubBuilder.getFirstResult(any())).thenReturn(new CppClass(CPP_CLASS_NAME));
    when(stubBuilder.getNamespaceMembers()).thenReturn(CPP_NAMESPACE_MEMBERS);

    //act
    correspondenceBuilder.finishBuilding(francaInterface);
    List<JniElement> result = correspondenceBuilder.getResults();

    //assert
    verifyJniModel(result, Collections.emptyList());
  }

  @Test
  public void finishBuildingFInterfaceWithSingleMethod() {
    //arrange model builders returning classes and inject some former processed methods
    injectResult(createJniMethodVoid(null));
    JavaClass javaClass = new JavaClass(JAVA_CLASS_NAME);
    javaClass.javaPackage = new JavaPackage(JAVA_PACKAGES);
    when(javaBuilder.getFirstResult(any())).thenReturn(javaClass);
    when(stubBuilder.getFirstResult(any())).thenReturn(new CppClass(CPP_CLASS_NAME));
    when(stubBuilder.getNamespaceMembers()).thenReturn(CPP_NAMESPACE_MEMBERS);

    //act
    correspondenceBuilder.finishBuilding(francaInterface);
    List<JniElement> result = correspondenceBuilder.getResults();

    //assert
    verifyJniModel(
        result, Collections.singletonList(createJniMethodVoid((JniModel) result.get(0))));
  }

  @Test
  public void finishBuildingFInterfaceWithMultipleMethods() {
    //arrange model builders returning classes and inject some former processed methods
    injectResult(createJniMethodVoid(null));
    injectResult(createJniMethodString(null));
    JavaClass javaClass = new JavaClass(JAVA_CLASS_NAME);
    javaClass.javaPackage = new JavaPackage(JAVA_PACKAGES);
    when(javaBuilder.getFirstResult(any())).thenReturn(javaClass);
    when(stubBuilder.getFirstResult(any())).thenReturn(new CppClass(CPP_CLASS_NAME));
    when(stubBuilder.getNamespaceMembers()).thenReturn(CPP_NAMESPACE_MEMBERS);

    //act
    correspondenceBuilder.finishBuilding(francaInterface);
    List<JniElement> result = correspondenceBuilder.getResults();

    //assert
    verifyJniModel(
        result,
        Arrays.asList(
            createJniMethodVoid((JniModel) result.get(0)),
            createJniMethodString((JniModel) result.get(0))));
  }

  @Test
  public void finishBuildingInputArgumentReadsJavaCppParameters() {
    JavaParameter javaParameter =
        new JavaParameter(new JavaCustomType(JAVA_CLASS_NAME), "relative");
    CppParameter cppParameter = new CppParameter();
    cppParameter.name = "absolute";
    cppParameter.type = new CppCustomType(CPP_CLASS_NAME);
    when(javaBuilder.getFirstResult(any())).thenReturn(javaParameter);
    when(stubBuilder.getFirstResult(any())).thenReturn(cppParameter);

    correspondenceBuilder.finishBuildingInputArgument(francaArgument);

    JniParameter jniParameter = correspondenceBuilder.getFirstResult(JniParameter.class);
    assertNotNull(jniParameter);
    assertEquals(javaParameter.name, jniParameter.name);
    assertEquals(javaParameter.type, jniParameter.javaType);
    assertEquals(cppParameter.type, jniParameter.cppType);
  }
}
