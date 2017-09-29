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

import org.eclipse.emf.ecore.EObject;
import org.franca.core.franca.FTypeRef;
import org.franca.core.franca.FTypedElement;

public final class FrancaTypeHelper {
  public static boolean isImplicitArray(final FTypeRef typeRef) {
    EObject container = typeRef.eContainer();
    return (container instanceof FTypedElement) && ((FTypedElement) container).isArray();
  }
}
