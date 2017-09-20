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

package com.here.ivi.api.generator.jni;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertTrue;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.baseapi.CppModelBuilder;
import com.here.ivi.api.generator.java.JavaModelBuilder;
import com.here.ivi.api.model.cppmodel.CppClass;
import com.here.ivi.api.model.cppmodel.CppComplexTypeRef;
import com.here.ivi.api.model.cppmodel.CppField;
import com.here.ivi.api.model.cppmodel.CppMethod;
import com.here.ivi.api.model.cppmodel.CppParameter;
import com.here.ivi.api.model.cppmodel.CppPrimitiveTypeRef;
import com.here.ivi.api.model.cppmodel.CppStruct;
import com.here.ivi.api.model.franca.FrancaElement;
import com.here.ivi.api.model.javamodel.*;
import com.here.ivi.api.model.jni.*;
import com.here.ivi.api.model.rules.InstanceRules;
import com.here.ivi.api.test.MockContextStack;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import org.franca.core.franca.*;
import org.franca.core.franca.FTypeDef;
import org.franca.core.franca.FTypeRef;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.Answers;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.powermock.api.mockito.PowerMockito;
import org.powermock.core.classloader.annotations.PrepareForTest;
import org.powermock.modules.junit4.PowerMockRunner;

@SuppressWarnings("PMD.TooManyFields")
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

  @Mock(answer = Answers.RETURNS_DEEP_STUBS)
  private FrancaElement rootModel;

  @Mock private FInterface francaInterface;
  @Mock private FTypeCollection francaTypeCollection;
  @Mock private FMethod francaMethod;
  @Mock private FArgument francaArgument;
  @Mock private FStructType francaStructType;
  @Mock private FField francaField;
  @Mock private FModel fModel;
  @Mock private FAttribute francaAttribute;

  @Mock private JavaModelBuilder javaBuilder;
  @Mock private CppModelBuilder cppBuilder;

  private final JavaClass javaClass = new JavaClass(JAVA_CLASS_NAME);
  private final CppClass cppClass = new CppClass(CPP_CLASS_NAME);
  private final JavaCustomType javaCustomType = new JavaCustomType(JAVA_CLASS_NAME);
  private final CppComplexTypeRef cppCustomType =
      new CppComplexTypeRef.Builder(CPP_CLASS_NAME).build();

  private final MockContextStack<JniElement> contextStack = new MockContextStack<>();

  private final JniParameter jniParameter = new JniParameter(BASE_NAME_PARAMETER, null);
  private final JavaMethod javaGetter = new JavaMethod("getFoo", new JavaCustomType("FooType"));
  private final CppMethod cppGetter =
      new CppMethod.Builder("shootFoot").returnType(CppPrimitiveTypeRef.INT32).build();
  private final JavaMethod javaSetter = new JavaMethod("setFoo", JavaPrimitiveType.VOID);
  private final CppMethod cppSetter = new CppMethod.Builder("shootBothFeet").build();

  private JniModelBuilder modelBuilder;

  @Before
  public void setUp() {
    MockitoAnnotations.initMocks(this);
    PowerMockito.mockStatic(InstanceRules.class);

    modelBuilder = new JniModelBuilder(contextStack, rootModel, javaBuilder, cppBuilder);

    javaSetter.parameters.add(new JavaParameter(JavaPrimitiveType.INT, "value"));
    cppSetter.parameters.add(new CppParameter("value", CppPrimitiveTypeRef.INT8));

    when(javaBuilder.getFirstResult(any())).thenReturn(javaClass);
    when(cppBuilder.getFirstResult(any())).thenReturn(cppClass);

    when(rootModel.getPackageNames()).thenReturn(CPP_NAMESPACE_MEMBERS);
  }

  private static JavaMethod createJavaMethod() {
    JavaMethod javaMethod = new JavaMethod(JAVA_INT_METHOD_NAME, JavaPrimitiveType.INT);
    javaMethod.parameters.add(new JavaParameter(JavaPrimitiveType.INT, BASE_NAME_PARAMETER));
    return javaMethod;
  }

  private static CppMethod createCppMethod() {
    CppPrimitiveTypeRef cppPrimitiveType = CppPrimitiveTypeRef.INT8;
    CppParameter cppParameter = new CppParameter("", cppPrimitiveType);

    return new CppMethod.Builder(CPP_INT_METHOD_NAME)
        .parameter(cppParameter)
        .returnType(cppPrimitiveType)
        .build();
  }

  private JniMethod createJniMethod(JniContainer jniContainer) {

    JniMethod result = new JniMethod.Builder(JAVA_VOID_METHOD_NAME, CPP_VOID_METHOD_NAME).build();
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
    assertEquals(cppMethod.name, jniMethod.cppMethodName);
    assertEquals(javaMethod.returnType.name, jniMethod.returnType.javaName);
    assertEquals(cppMethod.returnType.name, jniMethod.returnType.cppName);
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
    assertFalse(jniMethod.isStatic);
  }

  @Test
  public void finishBuildingFrancaMethodReadsStaticMethods() {
    contextStack.injectResult(jniParameter);
    when(javaBuilder.getFirstResult(any())).thenReturn(createJavaMethod());
    CppMethod cppMethod = createCppMethod();
    cppMethod.specifiers.add(CppMethod.Specifier.STATIC);
    when(cppBuilder.getFirstResult(any())).thenReturn(cppMethod);

    modelBuilder.finishBuilding(francaMethod);

    JniMethod jniMethod = modelBuilder.getFirstResult(JniMethod.class);
    assertNotNull(jniMethod);
    assertTrue(jniMethod.isStatic);
  }

  @Test
  public void finishBuildingFrancaMethodReadsConstMethods() {
    contextStack.injectResult(jniParameter);
    when(javaBuilder.getFirstResult(any())).thenReturn(createJavaMethod());
    CppMethod cppMethod = createCppMethod();
    cppMethod.qualifiers.add(CppMethod.Qualifier.CONST);
    when(cppBuilder.getFirstResult(any())).thenReturn(cppMethod);

    modelBuilder.finishBuilding(francaMethod);

    JniMethod jniMethod = modelBuilder.getFirstResult(JniMethod.class);
    assertNotNull(jniMethod);
    assertTrue(jniMethod.isConst);
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
    assertFalse(jniContainer.isInstantiable);
  }

  @Test
  public void finishBuildingFrancaInterfaceReadsJavaInterface() {
    JavaInterface javaInterface = new JavaInterface(JAVA_INTERFACE_NAME);
    javaInterface.javaPackage = new JavaPackage(JAVA_PACKAGES);
    when(javaBuilder.getFirstResult(JavaTopLevelElement.class)).thenReturn(javaInterface);
    when(javaBuilder.getFirstResult(JavaClass.class)).thenReturn(javaClass);

    modelBuilder.finishBuilding(francaInterface);

    JniContainer jniContainer = modelBuilder.getFirstResult(JniContainer.class);
    assertNotNull(jniContainer);
    assertEquals(JAVA_CLASS_NAME, jniContainer.javaName);
    assertEquals(JAVA_INTERFACE_NAME, jniContainer.javaInterfaceName);
    assertEquals(JAVA_PACKAGES, jniContainer.javaPackages);
  }

  @Test
  public void finishBuildingInstantiableFrancaInterface() {
    //arrange
    CppMethod nonStaticMethod = new CppMethod.Builder("nonStaticMethod").build();
    cppClass.methods.add(nonStaticMethod);

    //act
    modelBuilder.finishBuilding(francaInterface);

    //assert
    JniContainer jniContainer = modelBuilder.getFirstResult(JniContainer.class);
    assertNotNull(jniContainer);
    assertTrue(jniContainer.isInstantiable);
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
    when(francaArgument.getType()).thenReturn(mock(FTypeRef.class));

    modelBuilder.finishBuildingInputArgument(francaArgument);

    JniParameter resultParameter = modelBuilder.getFirstResult(JniParameter.class);
    assertNotNull(resultParameter);
    assertEquals(javaParameter.name, resultParameter.name);
    assertEquals(javaParameter.type.name, resultParameter.type.javaName);
    assertEquals(cppParameter.type.name, resultParameter.type.cppName);
  }

  @Test
  public void finishBuildingInputArgumentReadsInstance() {
    JavaParameter javaParameter = new JavaParameter(javaCustomType, "relative");
    CppParameter cppParameter =
        new CppParameter("absolute", new CppComplexTypeRef.Builder(CPP_CLASS_NAME).build());
    when(javaBuilder.getFirstResult(any())).thenReturn(javaParameter);
    when(cppBuilder.getFirstResult(any())).thenReturn(cppParameter);

    FTypeRef fTypeRef = mock(FTypeRef.class);
    when(fTypeRef.getDerived()).thenReturn(mock(FTypeDef.class));
    when(francaArgument.getType()).thenReturn(fTypeRef);
    when(InstanceRules.isInstanceId(any())).thenReturn(true);

    modelBuilder.finishBuildingInputArgument(francaArgument);

    JniParameter resultParameter = modelBuilder.getFirstResult(JniParameter.class);
    assertNotNull(resultParameter);
    assertTrue(resultParameter.type.isInstance);
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
  public void finishBuildingFrancaTypeCollectionReadsStructs() {
    when(francaTypeCollection.getName()).thenReturn(TYPE_COLLECTION_NAME);
    when(francaTypeCollection.eContainer()).thenReturn(fModel);
    when(fModel.getName()).thenReturn(String.join(".", CPP_NAMESPACE_MEMBERS));
    JniStruct jniStruct = new JniStruct(javaClass, new CppStruct(CPP_CLASS_NAME), null);
    contextStack.injectResult(jniStruct);

    modelBuilder.finishBuilding(francaTypeCollection);

    JniContainer jniContainer = modelBuilder.getFirstResult(JniContainer.class);
    assertNotNull(jniContainer);
    assertFalse(jniContainer.structs.isEmpty());
    assertEquals(jniStruct.javaClass, jniContainer.structs.get(0).javaClass);
    String expectedNamespace = "my::cpp::stuffs::namespace";
    assertEquals(expectedNamespace, String.join("::", jniContainer.cppNameSpaces));
    assertNull(jniContainer.javaName);
    assertNull(jniContainer.cppName);
  }

  @Test
  public void finishBuildingFrancaTypeCollectionWithNoStruct() {
    when(francaTypeCollection.getName()).thenReturn(TYPE_COLLECTION_NAME);
    when(francaTypeCollection.eContainer()).thenReturn(fModel);
    when(fModel.getName()).thenReturn(String.join(".", CPP_NAMESPACE_MEMBERS));

    modelBuilder.finishBuilding(francaTypeCollection);
    JniContainer jniContainer = modelBuilder.getFirstResult(JniContainer.class);

    assertNotNull(jniContainer);
    assertTrue(jniContainer.structs.isEmpty());
    assertTrue(jniContainer.javaPackages.isEmpty());
    assertEquals("my.cpp.stuffs.namespace", String.join(".", jniContainer.cppNameSpaces));
    assertNull(jniContainer.javaName);
    assertNull(jniContainer.cppName);
  }

  @Test
  public void finishBuildingFrancaAttributeCreatesGetter() {
    when(javaBuilder.getResults()).thenReturn(Arrays.asList(javaGetter, javaSetter));
    when(cppBuilder.getResults()).thenReturn(Arrays.asList(cppGetter, cppSetter));

    modelBuilder.finishBuilding(francaAttribute);

    JniMethod jniMethod = modelBuilder.getFirstResult(JniMethod.class);
    assertNotNull(jniMethod);
    assertEquals(javaGetter.name, jniMethod.javaMethodName);
    assertEquals(cppGetter.name, jniMethod.cppMethodName);
    assertEquals(javaGetter.returnType.name, jniMethod.returnType.javaName);
    assertEquals(cppGetter.returnType.name, jniMethod.returnType.cppName);
    assertFalse(jniMethod.isStatic);
  }

  @Test
  public void finishBuildingFrancaAttributeCreatesSetter() {
    when(javaBuilder.getResults()).thenReturn(Arrays.asList(javaGetter, javaSetter));
    when(cppBuilder.getResults()).thenReturn(Arrays.asList(cppGetter, cppSetter));

    modelBuilder.finishBuilding(francaAttribute);

    List<JniMethod> methods =
        CollectionsHelper.getAllOfType(modelBuilder.getResults(), JniMethod.class);
    assertEquals("Both a getter and a setter should be created", 2, methods.size());

    JniMethod jniMethod = methods.get(1);
    assertEquals(javaSetter.name, jniMethod.javaMethodName);
    assertEquals(cppSetter.name, jniMethod.cppMethodName);
    assertNull(jniMethod.returnType);
    assertFalse(jniMethod.isStatic);
  }

  @Test
  public void finishBuildingFrancaAttributeReadsParametersIntoSetter() {
    when(javaBuilder.getResults()).thenReturn(Arrays.asList(javaGetter, javaSetter));
    when(cppBuilder.getResults()).thenReturn(Arrays.asList(cppGetter, cppSetter));

    modelBuilder.finishBuilding(francaAttribute);

    List<JniMethod> methods =
        CollectionsHelper.getAllOfType(modelBuilder.getResults(), JniMethod.class);
    assertEquals("Both a getter and a setter should be created", 2, methods.size());

    JniMethod jniMethod = methods.get(1);
    assertEquals(1, jniMethod.parameters.size());

    JniParameter setterParameter = jniMethod.parameters.get(0);
    assertEquals(javaSetter.parameters.get(0).name, setterParameter.name);
    assertEquals(javaSetter.parameters.get(0).type.name, setterParameter.type.javaName);
    assertEquals(cppSetter.parameters.get(0).type.name, setterParameter.type.cppName);
  }

  @Test
  public void finishBuildingFrancaAttributeReadonly() {
    when(francaAttribute.isReadonly()).thenReturn(true);
    when(javaBuilder.getResults()).thenReturn(Collections.singletonList(javaGetter));
    when(cppBuilder.getResults()).thenReturn(Collections.singletonList(cppGetter));

    modelBuilder.finishBuilding(francaAttribute);

    List<JniMethod> methods =
        CollectionsHelper.getAllOfType(modelBuilder.getResults(), JniMethod.class);
    assertEquals("Only a getter should be created", 1, methods.size());

    JniMethod jniMethod = methods.get(0);
    assertEquals(javaGetter.name, jniMethod.javaMethodName);
    assertEquals(cppGetter.name, jniMethod.cppMethodName);
    assertEquals(javaGetter.returnType.name, jniMethod.returnType.javaName);
    assertEquals(cppGetter.returnType.name, jniMethod.returnType.cppName);
  }
}
