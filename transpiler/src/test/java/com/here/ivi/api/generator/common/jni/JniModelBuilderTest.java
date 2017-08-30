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
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.ivi.api.generator.baseapi.CppModelBuilder;
import com.here.ivi.api.generator.common.java.JavaModelBuilder;
import com.here.ivi.api.model.cppmodel.CppClass;
import com.here.ivi.api.model.cppmodel.CppComplexTypeRef;
import com.here.ivi.api.model.cppmodel.CppField;
import com.here.ivi.api.model.cppmodel.CppMethod;
import com.here.ivi.api.model.cppmodel.CppParameter;
import com.here.ivi.api.model.cppmodel.CppPrimitiveTypeRef;
import com.here.ivi.api.model.cppmodel.CppStruct;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.javamodel.JavaClass;
import com.here.ivi.api.model.javamodel.JavaCustomType;
import com.here.ivi.api.model.javamodel.JavaField;
import com.here.ivi.api.model.javamodel.JavaMethod;
import com.here.ivi.api.model.javamodel.JavaPackage;
import com.here.ivi.api.model.javamodel.JavaParameter;
import com.here.ivi.api.model.javamodel.JavaPrimitiveType;
import com.here.ivi.api.model.jni.*;
import com.here.ivi.api.test.MockContextStack;
import java.util.Arrays;
import java.util.List;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FAttribute;
import org.franca.core.franca.FField;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeCollection;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.JUnit4;
import org.mockito.Answers;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

@RunWith(JUnit4.class)
public class JniModelBuilderTest {

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FrancaElement rootModel;

  @Mock private FInterface francaInterface;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FMethod francaMethod;
  @Mock private FArgument francaArgument;
  @Mock private FStructType francaStructType;
  @Mock private FField francaField;

  @Mock private JavaModelBuilder javaBuilder;
  @Mock private CppModelBuilder cppBuilder;

  private final JavaClass javaClass = new JavaClass(JAVA_CLASS_NAME);
  private final CppClass cppClass = new CppClass.Builder(CPP_CLASS_NAME).build();
  private final JavaCustomType javaCustomType = new JavaCustomType(JAVA_CLASS_NAME);
  private final CppComplexTypeRef cppCustomType =
      new CppComplexTypeRef.Builder(CPP_CLASS_NAME).build();

  private static final List<String> JAVA_PACKAGES = Arrays.asList("my", "java", "test");

  private static final List<String> CPP_NAMESPACE_MEMBERS =
      Arrays.asList("my", "cpp", "stuffs", "namespace");

  private static final String JAVA_CLASS_NAME = "jAvaClazz";
  private static final String CPP_CLASS_NAME = "cPpClass";

  private static final String CPP_VOID_METHOD_NAME = "cPpWork3R_vOid";
  private static final String CPP_INT_METHOD_NAME = "cPpWork3R_iNt";

  private static final String JAVA_VOID_METHOD_NAME = "fancyMEthoD_v0id";
  private static final String JAVA_INT_METHOD_NAME = "fancyMEthoD_integer";

  private static final String BASE_NAME_PARAMETER = "theParam";
  private static final String TYPE_COLLECTION_NAME = "TestTypeCollection";

  private final MockContextStack<JniElement> contextStack = new MockContextStack<>();

  private final JniParameter jniParameter = new JniParameter(BASE_NAME_PARAMETER, null, null);

  private JniModelBuilder modelBuilder;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    modelBuilder = new JniModelBuilder(contextStack, rootModel, javaBuilder, cppBuilder);

    when(javaBuilder.getFirstResult(any())).thenReturn(javaClass);
    when(cppBuilder.getFirstResult(any())).thenReturn(cppClass);

    when(rootModel.getModelInfo().getPackageNames()).thenReturn(CPP_NAMESPACE_MEMBERS);
  }

  private static JavaMethod createJavaMethod() {
    JavaMethod javaMethod =
        new JavaMethod(JAVA_INT_METHOD_NAME, new JavaPrimitiveType(JavaPrimitiveType.Type.INT));
    javaMethod.parameters.add(
        new JavaParameter(new JavaPrimitiveType(JavaPrimitiveType.Type.INT), BASE_NAME_PARAMETER));
    return javaMethod;
  }

  private static CppMethod createCppMethod() {
    CppPrimitiveTypeRef cppPrimitiveType = new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.INT8);
    CppParameter cppParameter = new CppParameter("", cppPrimitiveType);

    return new CppMethod.Builder(CPP_INT_METHOD_NAME)
        .parameter(cppParameter)
        .returnType(cppPrimitiveType)
        .build();
  }

  private JniMethod createJniMethod(JniContainer jniContainer) {

    JniMethod result = new JniMethod();
    result.javaReturnType = new JavaPrimitiveType(JavaPrimitiveType.Type.VOID);
    result.javaMethodName = JAVA_VOID_METHOD_NAME;
    result.cppMethodName = CPP_VOID_METHOD_NAME;
    result.cppReturnType = new CppPrimitiveTypeRef(CppPrimitiveTypeRef.Type.VOID);
    result.owningContainer = jniContainer;

    return result;
  }

  @Test
  public void finishBuildingFMethodVoid() {
    //arrange
    when(javaBuilder.getFirstResult(any())).thenReturn(new JavaMethod(JAVA_VOID_METHOD_NAME));
    when(cppBuilder.getFirstResult(any()))
        .thenReturn(new CppMethod.Builder(CPP_VOID_METHOD_NAME).build());

    //act
    modelBuilder.finishBuilding(francaMethod);

    //assert
    JniMethod jniMethod = modelBuilder.getFirstResult(JniMethod.class);
    assertEquals(createJniMethod(null), jniMethod);
  }

  @Test
  public void finishBuildingFrancaMethodReadsJavaCppMethods() {
    JavaMethod javaMethod = createJavaMethod();
    CppMethod cppMethod = createCppMethod();
    when(javaBuilder.getFirstResult(any())).thenReturn(javaMethod);
    when(cppBuilder.getFirstResult(any())).thenReturn(cppMethod);

    modelBuilder.finishBuilding(francaMethod);

    JniMethod jniMethod = modelBuilder.getFirstResult(JniMethod.class);
    assertNotNull(jniMethod);
    assertEquals(javaMethod.name, jniMethod.javaMethodName);
    assertEquals(javaMethod.returnType, jniMethod.javaReturnType);
    assertEquals(cppMethod.name, jniMethod.cppMethodName);
    assertEquals(cppMethod.returnType, jniMethod.cppReturnType);
  }

  @Test
  public void finishBuildingFrancaMethodReadsJniParameters() {
    contextStack.injectResult(jniParameter);
    when(javaBuilder.getFirstResult(any())).thenReturn(createJavaMethod());
    when(cppBuilder.getFirstResult(any())).thenReturn(createCppMethod());

    modelBuilder.finishBuilding(francaMethod);

    JniMethod jniMethod = modelBuilder.getFirstResult(JniMethod.class);
    assertNotNull(jniMethod);
    assertEquals(1, jniMethod.parameters.size());
    assertEquals(jniParameter, jniMethod.parameters.get(0));
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsJavaCppClasses() {
    //arrange
    javaClass.javaPackage = new JavaPackage(JAVA_PACKAGES);

    //act
    modelBuilder.finishBuilding(francaInterface);

    //assert
    JniContainer jniContainer = modelBuilder.getFirstResult(JniContainer.class);
    assertNotNull(jniContainer);
    assertEquals(CPP_CLASS_NAME, jniContainer.cppName);
    assertEquals(JAVA_CLASS_NAME, jniContainer.javaName);
    assertEquals(CPP_NAMESPACE_MEMBERS, jniContainer.cppNameSpaces);
    assertEquals(JAVA_PACKAGES, jniContainer.javaPackages);
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsMethods() {
    contextStack.injectResult(createJniMethod(null));

    javaClass.javaPackage = new JavaPackage(JAVA_PACKAGES);

    //act
    modelBuilder.finishBuilding(francaInterface);

    //assert
    JniContainer jniContainer = modelBuilder.getFirstResult(JniContainer.class);
    assertNotNull(jniContainer);
    assertFalse(jniContainer.methods.isEmpty());
    assertEquals(createJniMethod(jniContainer), jniContainer.methods.get(0));
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsStructs() {
    JniStruct jniStruct = new JniStruct(javaClass, new CppStruct(CPP_CLASS_NAME), null);
    contextStack.injectResult(jniStruct);

    modelBuilder.finishBuilding(francaInterface);

    JniContainer jniContainer = modelBuilder.getFirstResult(JniContainer.class);
    assertNotNull(jniContainer);
    assertFalse(jniContainer.structs.isEmpty());
    assertEquals(jniStruct, jniContainer.structs.get(0));
  }

  @Test
  public void finishBuildingInputArgumentReadsJavaCppParameters() {
    JavaParameter javaParameter = new JavaParameter(javaCustomType, "relative");
    CppParameter cppParameter =
        new CppParameter("absolute", new CppComplexTypeRef.Builder(CPP_CLASS_NAME).build());
    when(javaBuilder.getFirstResult(any())).thenReturn(javaParameter);
    when(cppBuilder.getFirstResult(any())).thenReturn(cppParameter);

    modelBuilder.finishBuildingInputArgument(francaArgument);

    JniParameter jniParameter = modelBuilder.getFirstResult(JniParameter.class);
    assertNotNull(jniParameter);
    assertEquals(javaParameter.name, jniParameter.name);
    assertEquals(javaParameter.type, jniParameter.javaType);
    assertEquals(cppParameter.type, jniParameter.cppType);
  }

  @Test
  public void finishBuildingFrancaStructReadsJavaCppClasses() {
    CppStruct cppStruct = new CppStruct(CPP_CLASS_NAME);
    when(cppBuilder.getFirstResult(any())).thenReturn(cppStruct);

    modelBuilder.finishBuilding(francaStructType);

    JniStruct jniStruct = modelBuilder.getFirstResult(JniStruct.class);
    assertNotNull(jniStruct);
    assertEquals(javaClass, jniStruct.javaClass);
    assertEquals(cppStruct, jniStruct.cppStruct);
  }

  @Test
  public void finishBuildingFrancaStructReadsFields() {
    JniField jniField =
        new JniField(
            new JavaField(javaCustomType, BASE_NAME_PARAMETER),
            new CppField(cppCustomType, BASE_NAME_PARAMETER));
    contextStack.injectResult(jniField);
    when(javaBuilder.getFirstResult(any())).thenReturn(null);
    when(cppBuilder.getFirstResult(any())).thenReturn(null);

    modelBuilder.finishBuilding(francaStructType);

    JniStruct jniStruct = modelBuilder.getFirstResult(JniStruct.class);
    assertNotNull(jniStruct);
    assertFalse(jniStruct.fields.isEmpty());
    assertEquals(jniField, jniStruct.fields.get(0));
  }

  @Test
  public void finishBuildingFrancaFieldReadsJavaCppFields() {
    JavaField javaField = new JavaField(javaCustomType, BASE_NAME_PARAMETER);
    CppField cppField = new CppField(cppCustomType, CPP_CLASS_NAME);
    when(javaBuilder.getFirstResult(any())).thenReturn(javaField);
    when(cppBuilder.getFirstResult(any())).thenReturn(cppField);

    modelBuilder.finishBuilding(francaField);

    JniField jniField = modelBuilder.getFirstResult(JniField.class);
    assertNotNull(jniField);
    assertEquals(javaField, jniField.javaField);
    assertEquals(cppField, jniField.cppField);
  }

  @Test
  public void finishBuildingFrancaAttributeIsIgnored() {
    FAttribute francaAttribute = mock(FAttribute.class);

    modelBuilder.finishBuilding(francaAttribute);

    assertTrue(modelBuilder.getResults().isEmpty());
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsStructs() {
    when(francaTypeCollection.getName()).thenReturn(TYPE_COLLECTION_NAME);
    JniStruct jniStruct = new JniStruct(javaClass, new CppStruct(CPP_CLASS_NAME), null);
    contextStack.injectResult(jniStruct);

    modelBuilder.finishBuilding(francaTypeCollection);

    JniContainer jniContainer = modelBuilder.getFirstResult(JniContainer.class);
    assertNotNull(jniContainer);
    assertFalse(jniContainer.structs.isEmpty());
    assertEquals(jniStruct.javaClass, jniContainer.structs.get(0).javaClass);
    String expectedNamespace = "my::cpp::stuffs::namespace";
    assertEquals(expectedNamespace, String.join("::", jniContainer.cppNameSpaces));
    assertEquals("testtypecollection", jniContainer.javaName);
    assertEquals("testtypecollection", jniContainer.cppName);
  }

  @Test
  public void finishBuildingFrancaTypeCollectionWithNoStruct() {
    when(francaTypeCollection.getName()).thenReturn(TYPE_COLLECTION_NAME);

    modelBuilder.finishBuilding(francaTypeCollection);
    JniContainer jniContainer = modelBuilder.getFirstResult(JniContainer.class);

    assertNotNull(jniContainer);
    assertTrue(jniContainer.structs.isEmpty());
    assertTrue(jniContainer.javaPackages.isEmpty());
    assertEquals("my.cpp.stuffs.namespace", String.join(".", jniContainer.cppNameSpaces));
    assertEquals("testtypecollection", jniContainer.javaName);
    assertEquals("testtypecollection", jniContainer.cppName);
  }
}
