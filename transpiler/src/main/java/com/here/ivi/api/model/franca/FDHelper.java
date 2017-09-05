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

package com.here.ivi.api.model.franca;

import com.here.ivi.api.TranspilerExecutionException;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FTypeCollection;
import org.franca.deploymodel.core.FDeployedInterface;
import org.franca.deploymodel.core.FDeployedTypeCollection;
import org.franca.deploymodel.core.MappingGenericPropertyAccessor;
import org.franca.deploymodel.dsl.fDeploy.FDInterface;
import org.franca.deploymodel.dsl.fDeploy.FDSpecification;
import org.franca.deploymodel.dsl.fDeploy.FDTypes;
import org.franca.deploymodel.dsl.fDeploy.FDeployFactory;

public class FDHelper {

  public static MappingGenericPropertyAccessor createDummyFDElement(
      FDSpecification spec, EObject obj) {
    if (obj instanceof FInterface) {
      FDInterface el = FDeployFactory.eINSTANCE.createFDInterface();
      el.setSpec(spec);
      el.setTarget((FInterface) obj);
      return new FDeployedInterface(el);
    } else if (obj instanceof FTypeCollection) {
      FDTypes el = FDeployFactory.eINSTANCE.createFDTypes();
      el.setSpec(spec);
      el.setTarget((FTypeCollection) obj);
      return new FDeployedTypeCollection(el);
    }

    throw new TranspilerExecutionException("Unknown type");
  }
}
