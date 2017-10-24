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

import org.eclipse.emf.ecore.EObject;
import org.franca.deploymodel.core.MappingGenericPropertyAccessor;

/**
 * Property accessor that returns "false" for all boolean properties. Used as a stub for FIDL
 * definitions that don't have an associated FDEPL.
 */
public final class DummyPropertyAccessor extends MappingGenericPropertyAccessor {

  DummyPropertyAccessor() {
    super(null, null);
  }

  @Override
  public Boolean getBoolean(final EObject obj, final String property) {
    return false;
  }
}
