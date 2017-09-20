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

import org.franca.core.franca.*;

/** An interface for a model builder, used by @see FrancaTreeWalker. */
@SuppressWarnings({"PMD.TooManyMethods"})
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

  void startBuilding(FTypeDef francaTypeDef);

  void startBuilding(FArrayType francaArrayType);

  void startBuilding(FMapType francaMapType);

  void startBuilding(FEnumerationType francaEnumerationType);

  void startBuilding(FEnumerator francaEnumerator);

  void startBuilding(FExpression francaExpression);

  void startBuilding(FUnionType francaUnionType);

  void startBuilding(FAttribute francaAttribute);

  void finishBuilding(FInterface francaInterface);

  void finishBuilding(FTypeCollection francaTypeCollection);

  void finishBuilding(FMethod francaMethod);

  void finishBuildingInputArgument(FArgument francaArgument);

  void finishBuildingOutputArgument(FArgument francaArgument);

  void finishBuilding(FTypeRef francaTypeRef);

  void finishBuilding(FConstantDef francaConstant);

  void finishBuilding(FTypedElement francaTypedElement);

  void finishBuilding(FStructType francaStructType);

  void finishBuilding(FTypeDef francaTypeDef);

  void finishBuilding(FArrayType francaArrayType);

  void finishBuilding(FMapType francaMapType);

  void finishBuilding(FEnumerationType francaEnumerationType);

  void finishBuilding(FEnumerator francaEnumerator);

  void finishBuilding(FExpression francaExpression);

  void finishBuilding(FUnionType francaUnionType);

  void finishBuilding(FAttribute francaAttribute);
}
