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

import com.here.ivi.api.generator.common.cpp.CppTypeMapper;
import com.here.ivi.api.model.InstanceHelper;
import com.here.ivi.api.model.cppmodel.CppModelAccessor;
import com.here.ivi.api.model.cppmodel.CppType;
import com.here.ivi.api.model.cppmodel.CppUsing;
import org.franca.core.franca.FAnnotationBlock;
import org.franca.core.franca.FTypeDef;
import org.franca.core.franca.FTypeRef;

public class CppElementFactory {
  public static CppUsing create(CppModelAccessor<?> rootModel, FTypeDef typeDefinition) {
    /*
     The InstanceId type is used to allow interfaces to reference instances of other interfaces as
     this is not foreseen in franca. Useful only within Fidl files. No need to be resolved in the
     generated code
    */
    if (InstanceHelper.isInstanceId(typeDefinition)) {
      return null;
    }

    FTypeRef reference = typeDefinition.getActualType();
    CppType cppType = CppTypeMapper.map(rootModel, reference);
    CppUsing using = new CppUsing(typeDefinition.getName(), cppType);
    FAnnotationBlock annotationBlock = typeDefinition.getComment();
    if (annotationBlock != null) {
      using.comment = annotationBlock.toString();
    }

    return using;
  }
}
