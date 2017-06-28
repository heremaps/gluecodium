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

import com.here.ivi.api.model.franca.FrancaElement;
import org.franca.core.franca.FArgument;
import org.franca.core.franca.FInterface;
import org.franca.core.franca.FMethod;
import org.franca.core.franca.FTypeRef;

/** An interface for a model builder, used by @see FrancaTreeWalker. */
public interface ModelBuilder {

  void startBuilding(FrancaElement<?> element);

  void startBuilding(FInterface francaInterface);

  void startBuilding(FMethod francaMethod);

  void startBuilding(FArgument francaArgument);

  void startBuilding(FTypeRef francaTypeRef);

  void finishBuilding(FrancaElement<?> element);

  void finishBuilding(FInterface francaInterface);

  void finishBuilding(FMethod francaMethod);

  void finishBuilding(FArgument francaArgument);

  void finishBuilding(FTypeRef francaTypeRef);
}
