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

package com.here.ivi.api.common;

import java.util.Collection;
import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.*;

public final class FrancaTypeHelper {
  public static boolean isImplicitArray(final FTypeRef typeRef) {
    EObject container = typeRef.eContainer();
    return (container instanceof FTypedElement) && ((FTypedElement) container).isArray();
  }

  public static String getNamespace(final FType type) {
    EObject container = type.eContainer();
    return (container instanceof FInterface) ? ((FInterface) container).getName() : null;
  }

  public static boolean hasArrayParameters(final FMethod francaMethod) {
    Collection<FArgument> francaArguments = francaMethod.getInArgs();
    return francaArguments != null
        && !francaArguments.isEmpty()
        && francaArguments.stream().anyMatch(FrancaTypeHelper::isArray);
  }

  private static boolean isArray(final FTypedElement francaTypedElement) {
    return francaTypedElement.isArray() || isArray(francaTypedElement.getType().getDerived());
  }

  private static boolean isArray(final FType francaType) {
    return francaType instanceof FArrayType
        || (francaType instanceof FTypeDef
            && isArray(((FTypeDef) francaType).getActualType().getDerived()));
  }

  public static boolean hasErrorType(final FMethod francaMethod) {
    return francaMethod.getErrorEnum() != null || francaMethod.getErrors() != null;
  }
}
