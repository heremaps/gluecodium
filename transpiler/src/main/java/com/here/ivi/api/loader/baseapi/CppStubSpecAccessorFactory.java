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

package com.here.ivi.api.loader.baseapi;

import com.here.ivi.api.loader.SpecAccessorFactory;
import navigation.CppStubSpec;
import org.franca.deploymodel.core.FDeployedInterface;
import org.franca.deploymodel.core.FDeployedTypeCollection;

public class CppStubSpecAccessorFactory
    implements SpecAccessorFactory<
        CppStubSpec.InterfacePropertyAccessor, CppStubSpec.TypeCollectionPropertyAccessor> {
  @Override
  public String getSpecPath() {
    return "classpath:/franca/spec/CppStubSpec.fdepl";
  }

  @Override
  public CppStubSpec.InterfacePropertyAccessor createInterfaceAccessor(
      FDeployedInterface fdInterface) {
    return new CppStubSpec.InterfacePropertyAccessor(fdInterface);
  }

  @Override
  public CppStubSpec.TypeCollectionPropertyAccessor createTypeCollectionAccessor(
      FDeployedTypeCollection fdTypeCollection) {
    return new CppStubSpec.TypeCollectionPropertyAccessor(fdTypeCollection);
  }
}
