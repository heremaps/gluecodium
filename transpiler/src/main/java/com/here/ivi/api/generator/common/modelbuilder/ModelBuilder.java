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

package com.here.ivi.api.generator.common.modelbuilder;

import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.*;

/** An interface for a model builder, used by {@link FrancaTreeWalker}. */
@SuppressWarnings({"PMD.TooManyMethods"})
public interface ModelBuilder {

  void startBuilding(EObject object);

  void startBuilding(FInterface francaInterface);

  void startBuilding(FTypeCollection francaTypeCollection);

  void startBuildingInputArgument(FArgument francaArgument);

  void startBuildingOutputArgument(FArgument francaArgument);

  void finishBuilding(FInterface francaInterface);

  void finishBuilding(FTypeCollection francaTypeCollection);

  void finishBuilding(FMethod francaMethod);

  void finishBuildingInputArgument(FArgument francaArgument);

  void finishBuildingOutputArgument(FArgument francaArgument);

  void finishBuilding(FTypeRef francaTypeRef);

  void finishBuilding(FConstantDef francaConstant);

  void finishBuilding(FField francaField);

  void finishBuilding(FStructType francaStructType);

  void finishBuilding(FTypeDef francaTypeDef);

  void finishBuilding(FArrayType francaArrayType);

  void finishBuilding(FMapType francaMapType);

  void finishBuilding(FEnumerationType francaEnumerationType);

  void finishBuilding(FEnumerator francaEnumerator);

  void finishBuilding(FExpression francaExpression);

  void finishBuilding(FAttribute francaAttribute);
}
