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

package com.here.ivi.api.generator.baseapi;

import com.here.ivi.api.generator.common.AbstractModelBuilder;
import com.here.ivi.api.generator.common.ModelBuilderContextStack;
import com.here.ivi.api.generator.common.cpp.CppNameRules;
import com.here.ivi.api.model.cppmodel.CppClass;
import com.here.ivi.api.model.cppmodel.CppElement;
import com.here.ivi.api.model.cppmodel.CppMethod;
import com.here.ivi.api.model.franca.FrancaElement;
import java.util.List;
import navigation.BaseApiSpec;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;

public class StubModelBuilder extends AbstractModelBuilder<CppElement> {

  private final FrancaElement<? extends BaseApiSpec.InterfacePropertyAccessor> rootModel;

  public StubModelBuilder(
      final ModelBuilderContextStack<CppElement> contextStack,
      final FrancaElement<? extends BaseApiSpec.InterfacePropertyAccessor> rootModel) {
    super(contextStack);
    this.rootModel = rootModel;
  }

  public StubModelBuilder(
      final FrancaElement<? extends BaseApiSpec.InterfacePropertyAccessor> rootModel) {
    super(new ModelBuilderContextStack<>());
    this.rootModel = rootModel;
  }

  @Override
  public void finishBuilding(FInterface francaInterface) {

    CppClass.Builder stubClassBuilder =
        new CppClass.Builder(CppNameRules.getClassName(francaInterface.getName()))
            .comment(StubCommentParser.parse(francaInterface).getMainBodyText());

    CppClass cppClass = stubClassBuilder.build();

    for (CppElement cppElement : getCurrentContext().previousResults) {
      if (cppElement instanceof CppMethod) {
        cppClass.methods.add((CppMethod) cppElement);
      }
    }

    storeResult(cppClass);
    closeContext();
  }

  @Override
  public void finishBuilding(FMethod francaMethod) {

    // TODO: APIGEN-261 process method arguments through the Builder as well
    StubMethodMapper.mapMethodElements(francaMethod, rootModel).forEach(this::storeResult);
    closeContext();
  }

  /*
   * This method returns the namespace members for the contained FrancaElement.
   *
   * As cpp namespace is not inheriting from cpp element and cpp class has no
   * namespace member, namespaces are not handled via tree walking but processed separately.
   */
  public List<String> getNamespaceMembers() {
    return rootModel.getPackage();
  }
}
