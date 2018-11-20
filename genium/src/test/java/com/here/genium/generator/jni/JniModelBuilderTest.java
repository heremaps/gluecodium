/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.generator.jni;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import com.here.genium.common.CollectionsHelper;
import com.here.genium.generator.cpp.CppModelBuilder;
import com.here.genium.generator.java.JavaModelBuilder;
import com.here.genium.model.common.Include;
import com.here.genium.model.common.InstanceRules;
import com.here.genium.model.cpp.*;
import com.here.genium.model.franca.FrancaDeploymentModel;
import com.here.genium.model.java.*;
import com.here.genium.model.jni.*;
import com.here.genium.test.ArrayEList;
import com.here.genium.test.MockContextStack;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.eclipse.emf.common.util.EList;
import org.franca.core.franca.*;
import org.franca.core.franca.FTypeRef;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@RunWith(PowerMockRunner.class)
@PrepareForTest(InstanceRules.class)
public class JniModelBuilderTest {

  private static final String JAVA_CLASS_NAME = "jAvaClazz";
  private static final String JAVA_INTERFACE_NAME = "javaFAce";
  private static final String CPP_CLASS_NAME = "cPpClass";

  private static final String CPP_VOID_METHOD_NAME = "cPpWork3R_vOid";
  private static final String CPP_INT_METHOD_NAME = "cPpWork3R_iNt";

  private static final String JAVA_VOID_METHOD_NAME = "fancyMEthoD_v0id";
  private static final String JAVA_INT_METHOD_NAME = "fancyMEthoD_integer";

  private static final String BASE_NAME_PARAMETER = "theParam";
  private static final String TYPE_COLLECTION_NAME = "TestTypeCollection";

  private static final List<String> JAVA_PACKAGES = Arrays.asList("my", "java", "test");
  private static final List<String> CPP_NAMESPACE_MEMBERS =
      Arrays.asList("my", "cpp", "stuffs", "namespace");

  @Mock private FrancaDeploymentModel deploymentModel;
  @Mock private FInterface francaInterface;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FMethod francaMethod;
  @Mock private FArgument francaArgument;
  @Mock private FStructType francaStructType;
  @Mock private FEnumerationType francaEnumType;
  @Mock private FEnumerator francaEnumerator;
  @Mock private FField francaField;
  @Mock private FModel fModel;
  @Mock private FAttribute francaAttribute;

  @Mock private JavaModelBuilder javaBuilder;
  @Mock private CppModelBuilder cppBuilder;
  @Mock private CppIncludeResolver cppIncludeResolver;

  private final JavaClass javaClass = new JavaClass(JAVA_CLASS_NAME);
  private final CppClass cppClass =
      new CppClass(CPP_CLASS_NAME, "::" + CPP_CLASS_NAME, null, false);
  private final JavaEnum javaEnum = new JavaEnum(JAVA_CLASS_NAME);
  private final CppEnum cppEnum =
      CppEnum.builder(CPP_CLASS_NAME).fullyQualifiedName("::" + CPP_CLASS_NAME).build();
  private final JavaCustomType javaCustomType = JavaCustomType.builder(JAVA_CLASS_NAME).build();
  private final JavaField javaField =
      JavaField.builder(BASE_NAME_PARAMETER, javaCustomType)
          .initial(new JavaValue(javaCustomType))
          .build();
  private final CppComplexTypeRef cppCustomType =
      new CppComplexTypeRef.Builder(CPP_CLASS_NAME).build();
  private final CppField cppField = new CppField(CPP_CLASS_NAME, cppCustomType);

  private final MockContextStack<JniElement> contextStack = new MockContextStack<>();

  private final JniParameter jniParameter = new JniParameter(BASE_NAME_PARAMETER, null);
  private final JavaMethod javaGetter =
      JavaMethod.builder("getFoo").returnType(JavaCustomType.builder("FooType").build()).build();
  private final CppMethod cppGetter =
      new CppMethod("shootFoot", "shootFoot", "", CppPrimitiveTypeRef.INT32);
  private final JavaMethod javaSetter = JavaMethod.builder("setFoo").build();
  private final CppMethod cppSetter =
      new CppMethod(
          "shootBothFeet",
          "shootBothFeet",
          "",
          CppPrimitiveTypeRef.VOID,
          "",
          false,
          Collections.singletonList(new CppParameter("value", CppPrimitiveTypeRef.INT8)));
  private final JniType jniType = JniType.createType(javaCustomType, cppCustomType);
  private final Include cppInclude = Include.Companion.createInternalInclude("Foo.h");
  private final CppStruct cppStruct =
      CppStruct.builder().name(CPP_CLASS_NAME).fullyQualifiedName(CPP_CLASS_NAME).build();

  private JniModelBuilder modelBuilder;

  private final EList<FArgument> arguments = new ArrayEList<>();
  private final EList<FType> types = new ArrayEList<>();

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(InstanceRules.class);

    modelBuilder =
        new JniModelBuilder(
            contextStack, deploymentModel, javaBuilder, cppBuilder, cppIncludeResolver);

    javaSetter.parameters.add(new JavaParameter(JavaPrimitiveType.INT, "value"));
    javaClass.javaPackage = new JavaPackage(JAVA_PACKAGES);

    when(javaBuilder.getFinalResult(any())).thenReturn(javaClass);
    when(cppBuilder.getFinalResult(any())).thenReturn(cppClass);
    when(cppIncludeResolver.resolveInclude(any())).thenReturn(cppInclude);

    when(francaInterface.eContainer()).thenReturn(fModel);
    when(francaInterface.getTypes()).thenReturn(types);
    when(francaTypeCollection.eContainer()).thenReturn(fModel);
    when(francaTypeCollection.getTypes()).thenReturn(types);
    when(fModel.getName()).thenReturn(String.join(".", CPP_NAMESPACE_MEMBERS));
    when(francaMethod.getOutArgs()).thenReturn(arguments);
  }

  private static JavaMethod createJavaMethod() {
    JavaMethod javaMethod =
        JavaMethod.builder(JAVA_INT_METHOD_NAME).returnType(JavaPrimitiveType.INT).build();
    javaMethod.parameters.add(new JavaParameter(JavaPrimitiveType.INT, BASE_NAME_PARAMETER));
    return javaMethod;
  }

  private static CppMethod createCppMethod() {
    CppPrimitiveTypeRef cppPrimitiveType = CppPrimitiveTypeRef.INT8;
    CppParameter cppParameter = new CppParameter("", cppPrimitiveType);

    return new CppMethod(
        CPP_INT_METHOD_NAME,
        CPP_INT_METHOD_NAME,
        "",
        cppPrimitiveType,
        "",
        false,
        Collections.singletonList(cppParameter));
  }

  private JniMethod createJniMethod(JniContainer jniContainer) {
    return new JniMethod(jniContainer, JAVA_VOID_METHOD_NAME, CPP_VOID_METHOD_NAME);
  }

  @Test
  public void finishBuildingFrancaMethodVoid() {
    // arrange
    when(javaBuilder.getFinalResult(any()))
        .thenReturn(JavaMethod.builder(JAVA_VOID_METHOD_NAME).build());
    when(cppBuilder.getFinalResult(any())).thenReturn(new CppMethod(CPP_VOID_METHOD_NAME));

    // act
    modelBuilder.finishBuilding(francaMethod);

    // assert
    JniMethod jniMethod = modelBuilder.getFinalResult(JniMethod.class);
    assertEquals(createJniMethod(null), jniMethod);
  }

  @Test
  public void finishBuildingFrancaMethodReadsJavaCppMethods() {
    JavaMethod javaMethod = createJavaMethod();
    CppMethod cppMethod = createCppMethod();
    when(javaBuilder.getFinalResult(any())).thenReturn(javaMethod);
    when(cppBuilder.getFinalResult(any())).thenReturn(cppMethod);

    modelBuilder.finishBuilding(francaMethod);

    JniMethod jniMethod = modelBuilder.getFinalResult(JniMethod.class);
    assertNotNull(jniMethod);
    assertEquals(javaMethod.name, jniMethod.getJavaMethodName());
    assertEquals(cppMethod.name, jniMethod.getCppMethodName());
    assertNotNull(jniMethod.getReturnType());
    assertEquals(javaMethod.returnType.name, jniMethod.getReturnType().javaName);
    assertEquals(cppMethod.getReturnType().name, jniMethod.getReturnType().cppName);
  }

  @Test
  public void finishBuildingFrancaMethodReadsJniParameters() {
    contextStack.injectResult(jniParameter);
    when(javaBuilder.getFinalResult(any())).thenReturn(createJavaMethod());
    when(cppBuilder.getFinalResult(any())).thenReturn(createCppMethod());

    modelBuilder.finishBuilding(francaMethod);

    JniMethod jniMethod = modelBuilder.getFinalResult(JniMethod.class);
    assertNotNull(jniMethod);
    assertEquals(1, jniMethod.getParameters().size());
    assertEquals(jniParameter, jniMethod.getParameters().get(0));
    assertFalse(jniMethod.isStatic());
  }

  @Test
  public void finishBuildingFrancaMethodReadsStaticMethods() {
    contextStack.injectResult(jniParameter);
    when(javaBuilder.getFinalResult(any())).thenReturn(createJavaMethod());
    CppMethod cppMethod = createCppMethod();
    cppMethod.getSpecifiers().add(CppMethod.Specifier.STATIC);
    when(cppBuilder.getFinalResult(any())).thenReturn(cppMethod);

    modelBuilder.finishBuilding(francaMethod);

    JniMethod jniMethod = modelBuilder.getFinalResult(JniMethod.class);
    assertNotNull(jniMethod);
    assertTrue(jniMethod.isStatic());
  }

  @Test
  public void finishBuildingFrancaMethodReadsConstMethods() {
    contextStack.injectResult(jniParameter);
    when(javaBuilder.getFinalResult(any())).thenReturn(createJavaMethod());
    CppMethod cppMethod = createCppMethod();
    cppMethod.getQualifiers().add(CppMethod.Qualifier.CONST);
    when(cppBuilder.getFinalResult(any())).thenReturn(cppMethod);

    modelBuilder.finishBuilding(francaMethod);

    JniMethod jniMethod = modelBuilder.getFinalResult(JniMethod.class);
    assertNotNull(jniMethod);
    assertTrue(jniMethod.isConst());
  }

  @Test
  public void finishBuildingFrancaMethodReadsSelector() {
    when(francaMethod.getSelector()).thenReturn("Foo");
    when(javaBuilder.getFinalResult(any())).thenReturn(createJavaMethod());
    when(cppBuilder.getFinalResult(any())).thenReturn(createCppMethod());

    modelBuilder.finishBuilding(francaMethod);

    JniMethod jniMethod = modelBuilder.getFinalResult(JniMethod.class);
    assertNotNull(jniMethod);
    assertTrue(jniMethod.isOverloaded());

    verify(francaMethod).getSelector();
  }

  @Test
  public void finishBuildingFrancaMethodReadsExceptionName() {
    JavaMethod javaMethod =
        JavaMethod.builder(JAVA_INT_METHOD_NAME)
            .returnType(JavaPrimitiveType.INT)
            .exception(new JavaCustomType("FooException", JavaPackage.DEFAULT))
            .build();
    javaMethod.parameters.add(new JavaParameter(JavaPrimitiveType.INT, BASE_NAME_PARAMETER));
    when(javaBuilder.getFinalResult(any())).thenReturn(javaMethod);
    when(cppBuilder.getFinalResult(any())).thenReturn(createCppMethod());

    modelBuilder.finishBuilding(francaMethod);

    JniMethod jniMethod = modelBuilder.getFinalResult(JniMethod.class);
    assertNotNull(jniMethod);
    assertNotNull(jniMethod.getException());
    assertEquals("com/example/FooException", jniMethod.getException().getJavaClassName());
  }

  @Test
  public void finishBuildingFrancaMethodReadsExceptionEnum() {
    JavaMethod javaMethod =
        JavaMethod.builder(JAVA_INT_METHOD_NAME)
            .returnType(JavaPrimitiveType.INT)
            .exception(new JavaCustomType("FooException", JavaPackage.DEFAULT))
            .build();
    javaMethod.parameters.add(new JavaParameter(JavaPrimitiveType.INT, BASE_NAME_PARAMETER));
    when(javaBuilder.getFinalResult(any())).thenReturn(javaMethod);
    when(cppBuilder.getFinalResult(any())).thenReturn(createCppMethod());
    contextStack.injectResult(jniType);

    modelBuilder.finishBuilding(francaMethod);

    JniMethod jniMethod = modelBuilder.getFinalResult(JniMethod.class);
    assertNotNull(jniMethod);
    assertNotNull(jniMethod.getException());
    assertEquals(jniType, jniMethod.getException().getJniEnum());
  }

  @Test
  public void finishBuildingInstantiableFrancaInterface() {
    // arrange
    CppMethod nonStaticMethod = new CppMethod("nonStaticMethod");
    cppClass.methods.add(nonStaticMethod);

    // act
    modelBuilder.finishBuilding(francaInterface);

    // assert
    JniContainer jniContainer = modelBuilder.getFinalResult(JniContainer.class);
    assertNotNull(jniContainer);
    assertFalse(jniContainer.isInterface());
  }

  @Test
  public void finishBuildingInstantiableFrancaInterfaceReadsJavaCppClasses() {
    // act
    modelBuilder.finishBuilding(francaInterface);

    // assert
    JniContainer jniContainer = modelBuilder.getFinalResult(JniContainer.class);
    assertNotNull(jniContainer);
    assertEquals(CPP_CLASS_NAME, jniContainer.getCppName());
    assertEquals(JAVA_CLASS_NAME, jniContainer.getJavaName());
    assertEquals(CPP_NAMESPACE_MEMBERS, jniContainer.getCppNameSpaces());
    assertEquals(JAVA_PACKAGES, jniContainer.getJavaPackages());
    assertFalse(jniContainer.isInterface());
  }

  @Test
  public void finishBuildingInstantiableFrancaInterfaceReadsJavaInterface() {
    JavaInterface javaInterface = new JavaInterface(JAVA_INTERFACE_NAME);
    javaInterface.javaPackage = new JavaPackage(JAVA_PACKAGES);
    when(javaBuilder.getFinalResult(JavaTopLevelElement.class)).thenReturn(javaInterface);
    when(javaBuilder.getFinalResult(JavaClass.class)).thenReturn(javaClass);

    modelBuilder.finishBuilding(francaInterface);

    JniContainer jniContainer = modelBuilder.getFinalResult(JniContainer.class);
    assertNotNull(jniContainer);
    assertFalse(jniContainer.isInterface());
    assertEquals(JAVA_CLASS_NAME, jniContainer.getJavaName());
    assertEquals(JAVA_INTERFACE_NAME, jniContainer.getJavaInterfaceName());
    assertEquals(JAVA_PACKAGES, jniContainer.getJavaPackages());
  }

  @Test
  public void finishBuildingInstantiableFrancaInterfaceReadsMethods() {
    contextStack.injectResult(createJniMethod(null));

    // act
    modelBuilder.finishBuilding(francaInterface);

    // assert
    JniContainer jniContainer = modelBuilder.getFinalResult(JniContainer.class);
    assertNotNull(jniContainer);
    assertFalse(jniContainer.getMethods().isEmpty());
    assertFalse(jniContainer.isInterface());
    assertEquals(createJniMethod(jniContainer), jniContainer.getMethods().get(0));
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsIsInterface() {
    // arrange
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);

    // act
    modelBuilder.finishBuilding(francaInterface);

    // assert
    JniContainer jniContainer = modelBuilder.getFinalResult(JniContainer.class);
    assertNotNull(jniContainer);
    assertTrue(jniContainer.isInterface());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsJavaCppClasses() {
    // arrange
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);

    // act
    modelBuilder.finishBuilding(francaInterface);

    // assert
    JniContainer jniContainer = modelBuilder.getFinalResult(JniContainer.class);
    assertNotNull(jniContainer);
    assertTrue(jniContainer.isInterface());
    assertEquals(CPP_CLASS_NAME, jniContainer.getCppName());
    assertEquals(JAVA_CLASS_NAME, jniContainer.getJavaName());
    assertEquals(CPP_NAMESPACE_MEMBERS, jniContainer.getCppNameSpaces());
    assertEquals(JAVA_PACKAGES, jniContainer.getJavaPackages());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsJavaInterface() {
    when(deploymentModel.isInterface(francaInterface)).thenReturn(true);
    JavaInterface javaInterface = new JavaInterface(JAVA_INTERFACE_NAME);
    javaInterface.javaPackage = new JavaPackage(JAVA_PACKAGES);
    when(javaBuilder.getFinalResult(JavaTopLevelElement.class)).thenReturn(javaInterface);
    when(javaBuilder.getFinalResult(JavaClass.class)).thenReturn(javaClass);

    modelBuilder.finishBuilding(francaInterface);

    JniContainer jniContainer = modelBuilder.getFinalResult(JniContainer.class);
    assertNotNull(jniContainer);
    assertTrue(jniContainer.isInterface());
    assertEquals(JAVA_CLASS_NAME, jniContainer.getJavaName());
    assertEquals(JAVA_INTERFACE_NAME, jniContainer.getJavaInterfaceName());
    assertEquals(JAVA_PACKAGES, jniContainer.getJavaPackages());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsParentMethods() {
    // Arrange
    JniContainer parentContainer = new JniContainer();
    parentContainer.getParentMethods().add(createJniMethod(null));
    parentContainer.getMethods().add(createJniMethod(null));

    contextStack.injectResult(parentContainer);

    // Act
    modelBuilder.finishBuilding(francaInterface);

    // Assert
    JniContainer jniContainer = modelBuilder.getFinalResult(JniContainer.class);
    assertNotNull(jniContainer);
    assertEquals(2, jniContainer.getParentMethods().size());
    assertEquals(jniContainer, jniContainer.getParentMethods().get(0).getOwningContainer());
    assertEquals(jniContainer, jniContainer.getParentMethods().get(1).getOwningContainer());
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsInterfaceInclude() {
    modelBuilder.finishBuilding(francaInterface);

    JniContainer jniContainer = modelBuilder.getFinalResult(JniContainer.class);
    assertNotNull(jniContainer);
    assertEquals(1, jniContainer.getIncludes().size());
    verify(cppIncludeResolver).resolveInclude(francaInterface);
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsTypeIncludes() {
    types.add(francaStructType);
    when(cppIncludeResolver.resolveInclude(any(FType.class)))
        .thenReturn(Include.Companion.createInternalInclude("Bar.h"));

    modelBuilder.finishBuilding(francaInterface);

    JniContainer jniContainer = modelBuilder.getFinalResult(JniContainer.class);
    assertNotNull(jniContainer);
    assertEquals(2, jniContainer.getIncludes().size());
    verify(cppIncludeResolver).resolveInclude(francaStructType);
  }

  @Test
  public void finishBuildingInputArgumentReadsJavaCppParameters() {
    JavaParameter javaParameter = new JavaParameter(javaCustomType, "relative");
    CppParameter cppParameter =
        new CppParameter("absolute", new CppComplexTypeRef.Builder(CPP_CLASS_NAME).build());
    when(javaBuilder.getFinalResult(any())).thenReturn(javaParameter);
    when(cppBuilder.getFinalResult(any())).thenReturn(cppParameter);
    when(francaArgument.getType()).thenReturn(mock(FTypeRef.class));

    modelBuilder.finishBuildingInputArgument(francaArgument);

    JniParameter resultParameter = modelBuilder.getFinalResult(JniParameter.class);
    assertNotNull(resultParameter);
    assertEquals(javaParameter.name, resultParameter.name);
    assertEquals(javaParameter.type.name, resultParameter.type.javaName);
    assertEquals(cppParameter.type.name, resultParameter.type.cppName);
  }

  @Test
  public void finishBuildingFrancaStructReadsJavaCppClasses() {
    when(cppBuilder.getFinalResult(any())).thenReturn(cppStruct);

    modelBuilder.finishBuilding(francaStructType);

    JniStruct jniStruct = modelBuilder.getFinalResult(JniStruct.class);
    assertNotNull(jniStruct);
    assertEquals(javaClass, jniStruct.javaClass);
    assertEquals(cppStruct, jniStruct.cppStruct);
    assertEquals(javaClass.javaPackage, jniStruct.javaPackage);
  }

  @Test
  public void finishBuildingFrancaStructReadsFields() {
    JniField jniField = new JniField(javaField, cppField);
    contextStack.injectResult(jniField);
    when(javaBuilder.getFinalResult(any())).thenReturn(javaClass);
    when(cppBuilder.getFinalResult(any())).thenReturn(null);

    modelBuilder.finishBuilding(francaStructType);

    JniStruct jniStruct = modelBuilder.getFinalResult(JniStruct.class);
    assertNotNull(jniStruct);
    assertFalse(jniStruct.fields.isEmpty());
    assertEquals(jniField, jniStruct.fields.get(0));
  }

  @Test
  public void finishBuildingFrancaFieldReadsJavaCppFields() {
    when(javaBuilder.getFinalResult(any())).thenReturn(javaField);
    when(cppBuilder.getFinalResult(any())).thenReturn(cppField);

    modelBuilder.finishBuilding(francaField);

    JniField jniField = modelBuilder.getFinalResult(JniField.class);
    assertNotNull(jniField);
    assertEquals(javaField, jniField.getJavaField());
    assertEquals(cppField, jniField.getCppField());
  }

  @Test
  public void finishBuildingFrancaFieldReadsJniType() {
    when(javaBuilder.getFinalResult(any())).thenReturn(javaField);
    when(cppBuilder.getFinalResult(any())).thenReturn(cppField);
    contextStack.injectResult(jniType);

    modelBuilder.finishBuilding(francaField);

    JniField jniField = modelBuilder.getFinalResult(JniField.class);
    assertNotNull(jniField);
    assertEquals(jniType, jniField.getType());
  }

  @Test
  public void finishBuildingFrancaFieldReadsExternalAccessors() {
    when(javaBuilder.getFinalResult(any())).thenReturn(javaField);
    when(cppBuilder.getFinalResult(any())).thenReturn(cppField);
    when(deploymentModel.getExternalGetter(any())).thenReturn("get_foo");
    when(deploymentModel.getExternalSetter(any())).thenReturn("setFoo");

    modelBuilder.finishBuilding(francaField);

    JniField jniField = modelBuilder.getFinalResult(JniField.class);
    assertNotNull(jniField);
    assertEquals("get_foo", jniField.getCppGetterName());
    assertEquals("setFoo", jniField.getCppSetterName());
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsStructs() {
    when(francaTypeCollection.getName()).thenReturn(TYPE_COLLECTION_NAME);
    JniStruct jniStruct = new JniStruct(javaClass, cppStruct, null);
    contextStack.injectResult(jniStruct);

    modelBuilder.finishBuilding(francaTypeCollection);

    JniContainer jniContainer = modelBuilder.getFinalResult(JniContainer.class);
    assertNotNull(jniContainer);
    assertFalse(jniContainer.getStructs().isEmpty());
    assertEquals(jniStruct.javaClass, jniContainer.getStructs().get(0).javaClass);
    String expectedNamespace = "my::cpp::stuffs::namespace";
    assertEquals(expectedNamespace, String.join("::", jniContainer.getCppNameSpaces()));
    assertNull(jniContainer.getJavaName());
    assertNull(jniContainer.getCppName());
  }

  @Test
  public void finishBuildingFrancaTypeCollectionWithNoStruct() {
    when(francaTypeCollection.getName()).thenReturn(TYPE_COLLECTION_NAME);

    modelBuilder.finishBuilding(francaTypeCollection);
    JniContainer jniContainer = modelBuilder.getFinalResult(JniContainer.class);

    assertNotNull(jniContainer);
    assertTrue(jniContainer.getStructs().isEmpty());
    assertTrue(jniContainer.getJavaPackages().isEmpty());
    assertEquals("my.cpp.stuffs.namespace", String.join(".", jniContainer.getCppNameSpaces()));
    assertNull(jniContainer.getJavaName());
    assertNull(jniContainer.getCppName());
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsTypeIncludes() {
    types.add(francaStructType);
    when(cppIncludeResolver.resolveInclude(any(FType.class)))
        .thenReturn(Include.Companion.createInternalInclude("Bar.h"));

    modelBuilder.finishBuilding(francaTypeCollection);

    JniContainer jniContainer = modelBuilder.getFinalResult(JniContainer.class);
    assertNotNull(jniContainer);
    assertEquals(1, jniContainer.getIncludes().size());
    verify(cppIncludeResolver).resolveInclude(francaStructType);
  }

  @Test
  public void finishBuildingFrancaAttributeCreatesGetter() {
    when(javaBuilder.getFinalResults()).thenReturn(Arrays.asList(javaGetter, javaSetter));
    when(cppBuilder.getFinalResults()).thenReturn(Arrays.asList(cppGetter, cppSetter));

    modelBuilder.finishBuilding(francaAttribute);

    JniMethod jniMethod = modelBuilder.getFinalResult(JniMethod.class);
    assertNotNull(jniMethod);
    assertEquals(javaGetter.name, jniMethod.getJavaMethodName());
    assertEquals(cppGetter.name, jniMethod.getCppMethodName());
    assertNotNull(jniMethod.getReturnType());
    assertEquals(javaGetter.returnType.name, jniMethod.getReturnType().javaName);
    assertEquals(cppGetter.getReturnType().name, jniMethod.getReturnType().cppName);
    assertTrue(jniMethod.isConst());
  }

  @Test
  public void finishBuildingFrancaAttributeCreatesSetter() {
    when(javaBuilder.getFinalResults()).thenReturn(Arrays.asList(javaGetter, javaSetter));
    when(cppBuilder.getFinalResults()).thenReturn(Arrays.asList(cppGetter, cppSetter));

    modelBuilder.finishBuilding(francaAttribute);

    List<JniMethod> methods =
        CollectionsHelper.getAllOfType(modelBuilder.getFinalResults(), JniMethod.class);
    assertEquals("Both a getter and a setter should be created", 2, methods.size());

    JniMethod jniMethod = methods.get(1);
    assertEquals(javaSetter.name, jniMethod.getJavaMethodName());
    assertEquals(cppSetter.name, jniMethod.getCppMethodName());
    assertNull(jniMethod.getReturnType());
  }

  @Test
  public void finishBuildingFrancaAttributeReadsParametersIntoSetter() {
    // Arrange
    when(javaBuilder.getFinalResults()).thenReturn(Arrays.asList(javaGetter, javaSetter));
    when(cppBuilder.getFinalResults()).thenReturn(Arrays.asList(cppGetter, cppSetter));

    // Act
    modelBuilder.finishBuilding(francaAttribute);

    // Assert
    List<JniMethod> methods =
        CollectionsHelper.getAllOfType(modelBuilder.getFinalResults(), JniMethod.class);
    assertEquals("Both a getter and a setter should be created", 2, methods.size());
    JniMethod jniMethod = methods.get(1);
    assertEquals(1, jniMethod.getParameters().size());
    JniParameter setterParameter = jniMethod.getParameters().get(0);
    assertEquals(javaSetter.parameters.get(0).name, setterParameter.name);
    assertEquals(javaSetter.parameters.get(0).type.name, setterParameter.type.javaName);
    assertEquals(cppSetter.getParameters().get(0).type.name, setterParameter.type.cppName);
  }

  @Test
  public void finishBuildingFrancaAttributeReadonly() {
    // Arrange
    when(francaAttribute.isReadonly()).thenReturn(true);
    when(javaBuilder.getFinalResults()).thenReturn(Collections.singletonList(javaGetter));
    when(cppBuilder.getFinalResults()).thenReturn(Collections.singletonList(cppGetter));

    // Act
    modelBuilder.finishBuilding(francaAttribute);

    // Assert
    List<JniMethod> methods =
        CollectionsHelper.getAllOfType(modelBuilder.getFinalResults(), JniMethod.class);
    assertEquals("Only a getter should be created", 1, methods.size());
    JniMethod jniMethod = methods.get(0);
    assertEquals(javaGetter.name, jniMethod.getJavaMethodName());
    assertEquals(cppGetter.name, jniMethod.getCppMethodName());
    assertNotNull(jniMethod.getReturnType());
    assertEquals(javaGetter.returnType.name, jniMethod.getReturnType().javaName);
    assertEquals(cppGetter.getReturnType().name, jniMethod.getReturnType().cppName);
  }

  @Test
  public void finishBuildingFrancaEnumerationsReadsNames() {
    // Arrange
    when(cppBuilder.getFinalResult(any())).thenReturn(cppEnum, cppCustomType);
    when(javaBuilder.getFinalResult(any())).thenReturn(javaEnum, javaCustomType);

    // Act
    modelBuilder.finishBuilding(francaEnumType);

    // Assert
    JniEnum jniEnum = modelBuilder.getFinalResult(JniEnum.class);
    assertNotNull(jniEnum);
    assertEquals(javaEnum.name, jniEnum.getJavaEnumName());
    assertEquals(cppEnum.fullyQualifiedName, jniEnum.getCppEnumName());
  }

  @Test
  public void finishBuildingFrancaEnumerationsReadsEnumerators() {
    // Arrange
    when(cppBuilder.getFinalResult(any())).thenReturn(cppEnum, cppCustomType);
    when(javaBuilder.getFinalResult(any())).thenReturn(javaEnum, javaCustomType);
    contextStack.injectResult(new JniEnumerator("oneJ", "oneC"));
    contextStack.injectResult(new JniEnumerator("twoJ", "twoC"));
    contextStack.injectResult(new JniEnumerator("threeJ", "threeC"));

    // Act
    modelBuilder.finishBuilding(francaEnumType);

    // Assert
    JniEnum jniEnum = modelBuilder.getFinalResult(JniEnum.class);
    assertNotNull(jniEnum);
    assertEquals(3, jniEnum.getEnumerators().size());
    assertEquals("oneC", jniEnum.getEnumerators().get(0).cppName);
    assertEquals("oneJ", jniEnum.getEnumerators().get(0).javaName);
    assertEquals("twoC", jniEnum.getEnumerators().get(1).cppName);
    assertEquals("twoJ", jniEnum.getEnumerators().get(1).javaName);
    assertEquals("threeC", jniEnum.getEnumerators().get(2).cppName);
    assertEquals("threeJ", jniEnum.getEnumerators().get(2).javaName);
  }

  @Test
  public void finishBuildingFrancaEnumerationsReadsTypeReferences() {
    // Arrange
    when(cppBuilder.getFinalResult(any())).thenReturn(cppEnum, cppCustomType);
    when(javaBuilder.getFinalResult(any())).thenReturn(javaEnum, javaCustomType);

    // Act
    modelBuilder.finishBuilding(francaEnumType);

    // Assert
    JniType resultType = modelBuilder.getFinalResult(JniType.class);
    assertNotNull(resultType);
    assertEquals(javaCustomType.name, resultType.javaName);
    assertEquals(cppCustomType.name, resultType.cppName);
  }

  @Test
  public void finishBuildingFEnumerator() {
    // Arrange
    when(cppBuilder.getFinalResult(any())).thenReturn(new CppEnumItem("cppEnumerator", null));
    when(javaBuilder.getFinalResult(any())).thenReturn(new JavaEnumItem("javaEnumerator"));

    // Act
    modelBuilder.finishBuilding(francaEnumerator);

    // Assert
    JniEnumerator jniEnumItem = modelBuilder.getFinalResult(JniEnumerator.class);
    assertNotNull(jniEnumItem);
    assertEquals(jniEnumItem.cppName, "cppEnumerator");
    assertEquals(jniEnumItem.javaName, "javaEnumerator");
  }

  @Test
  public void finishBuildingFrancaTypeCollectionReadsEnums() {
    // Arrange
    when(francaTypeCollection.getName()).thenReturn(TYPE_COLLECTION_NAME);
    JniEnum jniEnum = new JniEnum(JavaPackage.DEFAULT, "MyJavaEnumName", "MyCppEnumName");
    contextStack.injectResult(jniEnum);

    // Act
    modelBuilder.finishBuilding(francaTypeCollection);

    // Assert
    JniContainer jniContainer = modelBuilder.getFinalResult(JniContainer.class);
    assertNotNull(jniContainer);
    assertFalse(jniContainer.getEnums().isEmpty());
    assertEquals(jniEnum, jniContainer.getEnums().get(0));
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsEnums() {
    // Arrange
    JniEnum jniEnum = new JniEnum(null, "MyJavaEnumName", "MyCppEnumName");
    contextStack.injectResult(jniEnum);

    // Act
    modelBuilder.finishBuilding(francaInterface);

    // Assert
    JniContainer jniContainer = modelBuilder.getFinalResult(JniContainer.class);
    assertNotNull(jniContainer);
    assertFalse(jniContainer.getEnums().isEmpty());
    assertEquals(jniEnum, jniContainer.getEnums().get(0));
  }
}
