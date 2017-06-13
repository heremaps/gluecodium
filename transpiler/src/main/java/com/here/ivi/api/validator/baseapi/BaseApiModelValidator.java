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

package com.here.ivi.api.validator.baseapi;

import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.validator.common.ModelValidator;
import navigation.BaseApiSpec;

public class BaseApiModelValidator
    implements ModelValidator<
        BaseApiSpec.InterfacePropertyAccessor, BaseApiSpec.TypeCollectionPropertyAccessor> {

  @Override
  public boolean validate(
      FrancaModel<BaseApiSpec.InterfacePropertyAccessor, BaseApiSpec.TypeCollectionPropertyAccessor>
          model) {
    //TODO put here baseapi specific validation.
    return true;
  }
}
