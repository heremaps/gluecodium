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

package com.here.ivi.api.model.cppmodel;

import com.here.ivi.api.model.DefinedBy;
import com.here.ivi.api.model.FrancaElement;
import navigation.BaseApiSpec;

public class CppModelAccessor<DPA extends BaseApiSpec.IDataPropertyAccessor> {
  private final FrancaElement<DPA> francaElement;
  private final DefinedBy definer;

  public CppModelAccessor(FrancaElement<DPA> francaElement) {
    this.francaElement = francaElement;
    this.definer = DefinedBy.createFromFrancaElement(francaElement);
  }

  public DefinedBy getDefiner() {
    return definer;
  }

  public DPA getAccessor() {
    return francaElement.getPropertyAccessor();
  }
}
