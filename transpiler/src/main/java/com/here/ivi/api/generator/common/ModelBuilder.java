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

package com.here.ivi.api.generator.common;

import org.franca.core.franca.FArgument;
import org.franca.core.franca.FConstantDef;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FStructType;
import org.franca.core.franca.FTypeCollection;
import org.franca.core.franca.FTypeRef;
import org.franca.core.franca.FTypedElement;

/** An interface for a model builder, used by @see FrancaTreeWalker. */
public interface ModelBuilder {

  void startBuilding(FInterface francaInterface);

  void startBuilding(FTypeCollection francaTypeCollection);

  void startBuilding(FMethod francaMethod);

  void startBuildingInputArgument(FArgument francaArgument);

  void startBuildingOutputArgument(FArgument francaArgument);

  void startBuilding(FTypeRef francaTypeRef);

  void startBuilding(FConstantDef francaConstant);

  void startBuilding(FTypedElement francaTypedElement);

  void startBuilding(FStructType francaStructType);

  void finishBuilding(FInterface francaInterface);

  void finishBuilding(FTypeCollection francaTypeCollection);

  void finishBuilding(FMethod francaMethod);

  void finishBuildingInputArgument(FArgument francaArgument);

  void finishBuildingOutputArgument(FArgument francaArgument);

  void finishBuilding(FTypeRef francaTypeRef);

  void finishBuilding(FConstantDef francaConstant);

  void finishBuilding(FTypedElement francaTypedElement);

  void finishBuilding(FStructType francaStructType);
}
