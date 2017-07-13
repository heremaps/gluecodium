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
import com.here.ivi.api.model.cppmodel.CppPrimitiveType.Type;
import com.here.ivi.api.model.javamodel.JavaClass;
import com.here.ivi.api.model.javamodel.JavaMethod;
import com.here.ivi.api.model.javamodel.JavaPackage;
import com.here.ivi.api.model.javamodel.JavaParameter;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.javamodel.JavaReferenceType;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
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

  @Mock private FInterface francaInterface;
  @Mock private FMethod francaMethod;

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

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);

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
    cppParameter.type = new CppPrimitiveType(Type.INT8);
    CppMethod cppMethod =
        new CppMethod.Builder(CPP_INT_METHOD_NAME)
            .inParameter(cppParameter)
            .returnType(new CppPrimitiveType(Type.INT8))
            .build();

    return cppMethod;
  }

  private static JavaMethod createJavaMethodString() {
    JavaMethod javaMethod =
        new JavaMethod(
            JAVA_STRING_METHOD_NAME, new JavaReferenceType(JavaReferenceType.Type.STRING));
    javaMethod.parameters.add(
        new JavaParameter(
            new JavaReferenceType(JavaReferenceType.Type.STRING), BASE_NAME_PARAMETER));
    return javaMethod;
  }

  private static CppMethod createCppMethodString() {
    CppParameter cppParameter = new CppParameter();
    cppParameter.type = new CppCustomType(CppCustomType.STRING_TYPE_NAME);
    CppMethod cppMethod =
        new CppMethod.Builder(CPP_STRING_METHOD_NAME)
            .inParameter(cppParameter)
            .returnType(new CppCustomType(CppCustomType.STRING_TYPE_NAME))
            .build();
    return cppMethod;
  }

  private JniMethod createJniMethodVoid(JniModel jniModel) {

    JniMethod result = new JniMethod();
    result.javaReturnType = new JavaPrimitiveType(JavaPrimitiveType.Type.VOID);
    result.javaMethodName = JAVA_VOID_METHOD_NAME;
    result.cppMethodName = CPP_VOID_METHOD_NAME;
    result.cppReturnType = "void";
    result.owningModel = jniModel;
    return result;
  }

  private JniMethod createJniMethodInt(JniModel jniModel) {

    JavaPrimitiveType intType = new JavaPrimitiveType(JavaPrimitiveType.Type.INT);
    JniMethod result = new JniMethod();
    result.javaReturnType = intType;
    result.javaMethodName = JAVA_INT_METHOD_NAME;
    result.cppMethodName = CPP_INT_METHOD_NAME;
    result.cppReturnType = "int8_t";
    result.owningModel = jniModel;

    JniParameterData parameter = new JniParameterData();
    parameter.baseName = BASE_NAME_PARAMETER;
    parameter.javaType = intType;
    parameter.cppType = "int8_t";
    result.parameters.add(parameter);
    return result;
  }

  private JniMethod createJniMethodString(JniModel jniModel) {

    JavaReferenceType StringType = new JavaReferenceType(JavaReferenceType.Type.STRING);
    JniMethod result = new JniMethod();
    result.javaReturnType = StringType;
    result.javaMethodName = JAVA_STRING_METHOD_NAME;
    result.cppMethodName = CPP_STRING_METHOD_NAME;
    result.cppReturnType = "std::string";
    result.owningModel = jniModel;

    JniParameterData parameter = new JniParameterData();
    parameter.baseName = BASE_NAME_PARAMETER;
    parameter.javaType = StringType;
    parameter.cppType = "std::string";
    result.parameters.add(parameter);
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

    JniModelBuilder correspondenceBuilder =
        new JniModelBuilder(contextStack, javaBuilder, stubBuilder);

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
  public void finishBuildingFMethodInt() {
    //arrange
    when(javaBuilder.getFirstResult(any())).thenReturn(createJavaMethodInt());
    when(stubBuilder.getFirstResult(any())).thenReturn(createCppMethodInt());

    JniModelBuilder correspondenceBuilder =
        new JniModelBuilder(contextStack, javaBuilder, stubBuilder);

    //act
    correspondenceBuilder.finishBuilding(francaMethod);
    List<JniElement> result = correspondenceBuilder.getResults();

    //assert
    assertEquals(1, result.size());
    assertTrue(result.get(0) instanceof JniMethod);
    JniMethod method = (JniMethod) result.get(0);
    assertEquals(createJniMethodInt(null), method);
  }

  @Test
  public void finishBuildingFMethodString() {
    //arrange
    when(javaBuilder.getFirstResult(any())).thenReturn(createJavaMethodString());
    when(stubBuilder.getFirstResult(any())).thenReturn(createCppMethodString());

    JniModelBuilder correspondenceBuilder =
        new JniModelBuilder(contextStack, javaBuilder, stubBuilder);

    //act
    correspondenceBuilder.finishBuilding(francaMethod);
    List<JniElement> result = correspondenceBuilder.getResults();

    //assert
    assertEquals(1, result.size());
    assertTrue(result.get(0) instanceof JniMethod);
    JniMethod method = (JniMethod) result.get(0);
    assertEquals(createJniMethodString(null), method);
  }

  @Test
  public void finishBuildingFInterfaceWithOutMethods() {
    //arrange
    JavaClass javaClass = new JavaClass(JAVA_CLASS_NAME);
    javaClass.javaPackage = new JavaPackage(JAVA_PACKAGES);
    when(javaBuilder.getFirstResult(any())).thenReturn(javaClass);
    when(stubBuilder.getFirstResult(any())).thenReturn(new CppClass(CPP_CLASS_NAME));
    when(stubBuilder.getNamespaceMembers()).thenReturn(CPP_NAMESPACE_MEMBERS);

    JniModelBuilder correspondenceBuilder =
        new JniModelBuilder(contextStack, javaBuilder, stubBuilder);

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

    JniModelBuilder correspondenceBuilder =
        new JniModelBuilder(contextStack, javaBuilder, stubBuilder);

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

    JniModelBuilder correspondenceBuilder =
        new JniModelBuilder(contextStack, javaBuilder, stubBuilder);

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
}
