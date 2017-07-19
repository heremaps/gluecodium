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
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;

/**
 * This class builds a correspondence-tree containing correspondences between java and cpp model
 * elements. Currently only corresponding classes and theirs corresponding methods are calculated.
 *
 * <p>Preconditions:
 *
 * <p>For correspondence calculation it is assumed to have one to one mapping, i.e. one franca
 * element is mapped to at least one target model element.
 *
 * <p>It is assumed that Java- and StubModelBuilder's finishBuilding methods are called in advance
 * of calling finishBuilding on JniModelBuilder (constructed java and cpp elements need to be
 * accessible via getResults(..) ).
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

    JavaClass javaClass = javaBuilder.getFirstResult(JavaClass.class);
    CppClass cppClass = stubBuilder.getFirstResult(CppClass.class);

    JniModel jniModel = new JniModel();
    jniModel.cppClassName = cppClass.name;
    jniModel.cppNameSpaces = stubBuilder.getNamespaceMembers();
    jniModel.javaClassName = javaClass.getName();
    jniModel.javaPackages = javaClass.javaPackage.packageNames;

    List<JniMethod> methodList =
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, JniMethod.class);
    methodList.forEach(method -> method.owningModel = jniModel);
    jniModel.methods.addAll(methodList);

    storeResult(jniModel);
    closeContext();
  }

  @Override
  public void finishBuilding(FMethod francaMethod) {

    JavaMethod javaMethod = javaBuilder.getFirstResult(JavaMethod.class);
    CppMethod cppMethod = stubBuilder.getFirstResult(CppMethod.class);

    JniMethod jniMethod = new JniMethod();
    jniMethod.javaReturnType = javaMethod.returnType;
    jniMethod.javaMethodName = javaMethod.getName();
    jniMethod.cppMethodName = cppMethod.name;
    jniMethod.cppReturnType = cppMethod.getReturnType().name;
    jniMethod.parameters.addAll(
        CollectionsHelper.getAllOfType(getCurrentContext().previousResults, JniParameter.class));

    storeResult(jniMethod);
    closeContext();
  }

  @Override
  public void finishBuildingInputArgument(FArgument francaArgument) {

    JavaParameter javaParameter = javaBuilder.getFirstResult(JavaParameter.class);
    CppParameter cppParameter = stubBuilder.getFirstResult(CppParameter.class);

    storeResult(new JniParameter(javaParameter.getName(), javaParameter.type, cppParameter.type));
    closeContext();
  }
}
