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
import org.franca.core.franca.FModel;
import org.franca.core.franca.FTypeCollection;

public class LazyInternalInclude extends Include {

  public final FTypeCollection typeCollection;
  public final FModel model;

  public LazyInternalInclude(FTypeCollection typeCollection, FModel model) {
    super(null, false);
    this.typeCollection = typeCollection;
    this.model = model;
  }

  public LazyInternalInclude(DefinedBy def) {
    this(def.type, def.model);
  }

  @Override
  public String toString() {
    return model.getName() + "." + typeCollection.getName();
  }

  @Override
  public boolean equals(Object o) {

    if (this == o) {
      return true;
    }
    if (o == null || getClass() != o.getClass()) {
      return false;
    }

    LazyInternalInclude that = (LazyInternalInclude) o;

    if (typeCollection != null
        ? !typeCollection.equals(that.typeCollection)
        : that.typeCollection != null) {
      return false;
    }

    return model != null ? model.equals(that.model) : that.model == null;
  }

  @Override
  public int hashCode() {

    int result = typeCollection != null ? typeCollection.hashCode() : 0;
    return 31 * result + (model != null ? model.hashCode() : 0);
  }
}
