/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.generator.common.modelbuilder;

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

  void finishBuilding(FInitializerExpression francaExpression);

  void finishBuilding(FAttribute francaAttribute);
}
