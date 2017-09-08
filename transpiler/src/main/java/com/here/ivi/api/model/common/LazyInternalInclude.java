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

package com.here.ivi.api.model.common;

import com.here.ivi.api.model.franca.DefinedBy;
import lombok.EqualsAndHashCode;
import org.franca.core.franca.FModelElement;
import org.franca.core.franca.FTypeCollection;

@EqualsAndHashCode(callSuper = true)
public class LazyInternalInclude extends Include {

  public final FTypeCollection typeCollection;

  public LazyInternalInclude(final FTypeCollection typeCollection) {
    super(null, false);
    this.typeCollection = typeCollection;
  }

  public LazyInternalInclude(final FModelElement modelElement) {
    this(DefinedBy.findDefiningTypeCollection(modelElement));
  }
}
