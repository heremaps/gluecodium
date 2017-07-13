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

import com.here.ivi.api.common.CollectionsHelper;
import com.here.ivi.api.generator.baseapi.StubModelBuilder;
import com.here.ivi.api.generator.common.AbstractModelBuilder;
import com.here.ivi.api.generator.common.ModelBuilderContextStack;
import com.here.ivi.api.generator.common.java.JavaModelBuilder;
import com.here.ivi.api.model.cppmodel.CppClass;
import com.here.ivi.api.model.cppmodel.CppMethod;
import com.here.ivi.api.model.cppmodel.CppParameter;
import com.here.ivi.api.model.javamodel.JavaClass;
import com.here.ivi.api.model.javamodel.JavaMethod;
import com.here.ivi.api.model.javamodel.JavaParameter;
import java.util.List;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;

/*
 * This class builds a correspondence-tree containing correspondences between java and cpp model
 * elements. Currently only corresponding classes and theirs corresponding methods are calculated.
 *
 * Preconditions:
 *
 * For correspondence calculation it is assumed to have one to one mapping, i.e. one franca element
 * is mapped to at least one target model element.
 *
 * It is assumed that Java- and StubModelBuilder's finishBuilding methods are called in advance
 * of calling finishBuilding on JniModelBuilder (constructed java and cpp elements need to be
 * accessible via getResults(..) ).
 *
 */
public class JniModelBuilder extends AbstractModelBuilder<JniElement> {

  private final JavaModelBuilder javaBuilder;
  private final StubModelBuilder stubBuilder;

  public JniModelBuilder(
      final ModelBuilderContextStack<JniElement> contextStack,
      final JavaModelBuilder javaBuilder,
      final StubModelBuilder stubBuilder) {
    super(contextStack);
    this.javaBuilder = javaBuilder;
    this.stubBuilder = stubBuilder;
  }

  public JniModelBuilder(final JavaModelBuilder javaBuilder, final StubModelBuilder stubBuilder) {
    super(new ModelBuilderContextStack<>());
    this.javaBuilder = javaBuilder;
    this.stubBuilder = stubBuilder;
  }

  @Override
  public void finishBuilding(FInterface francaInterface) {

    //collect classes
    JavaClass javaClass = javaBuilder.getFirstResult(JavaClass.class);
    CppClass cppClass = stubBuilder.getFirstResult(CppClass.class);

    JniModel result = new JniModel();
    result.cppClassName = cppClass.name;
    result.cppNameSpaces = stubBuilder.getNamespaceMembers();
    result.javaClassName = javaClass.getName();
    result.javaPackages = javaClass.javaPackage.packageNames;

    List<JniMethod> methodList =
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, JniMethod.class);

    for (JniMethod method : methodList) {
      method.owningModel = result;
      result.methods.add(method);
    }

    storeResult(result);
    closeContext();
  }

  private static JniMethod createJniMethod(JavaMethod javaMethod, CppMethod cppMethod) {
    JniMethod jniMethod = new JniMethod();
    jniMethod.javaReturnType = javaMethod.returnType;
    jniMethod.javaMethodName = javaMethod.getName();
    jniMethod.cppMethodName = cppMethod.name;
    jniMethod.cppReturnType = cppMethod.getReturnType().name;
    return jniMethod;
  }

  private static JniParameterData createJniParameter(
      JavaParameter javaParameter, CppParameter cppParameter) {

    JniParameterData jniParameter = new JniParameterData();
    jniParameter.javaType = javaParameter.type;
    jniParameter.baseName = javaParameter.getName();
    jniParameter.cppType = cppParameter.type.name;
    return jniParameter;
  }

  @Override
  public void finishBuilding(FMethod francaMethod) {

    //collect methods
    JavaMethod javaMethod = javaBuilder.getFirstResult(JavaMethod.class);
    CppMethod cppMethod = stubBuilder.getFirstResult(CppMethod.class);

    JniMethod jniMethod = createJniMethod(javaMethod, cppMethod);

    for (int i = 0; i < javaMethod.parameters.size(); ++i) {
      jniMethod.parameters.add(
          createJniParameter(javaMethod.parameters.get(i), cppMethod.getInParameters().get(i)));
    }

    storeResult(jniMethod);
    closeContext();
  }
}
