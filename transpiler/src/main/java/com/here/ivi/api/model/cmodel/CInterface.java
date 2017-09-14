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

package com.here.ivi.api.model.cmodel;

import static java.util.Collections.emptySet;
import static java.util.Collections.singletonList;

import com.here.ivi.api.generator.cbridge.CBridgeComponents;
import com.here.ivi.api.generator.cbridge.CBridgeNameRules;
import com.here.ivi.api.generator.cbridge.CppTypeInfo;
import com.here.ivi.api.model.common.Include;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;
import org.franca.core.franca.FInterface;

/** Collection of related methods and structs forming an interface (like a C header file) */
public class CInterface extends CElement {
  public Set<Include> headerIncludes = emptySet();
  public Set<Include> implementationIncludes = emptySet();
  public Set<Include> privateHeaderIncludes = emptySet();
  public List<CStructTypedef> structs = new LinkedList<>();
  public List<CFunction> functions = new LinkedList<>();

  public CInterface() {
    super("");
  }

  public CInterface(
      final CClassType classType, FInterface francaInterface, CBridgeNameRules cBridgeNameRules) {
    super("");
    if (classType == null) {
      return;
    }
    CStruct cStruct =
        new CStruct(
            cBridgeNameRules.getStructRefType(francaInterface),
            cBridgeNameRules.getStructBaseName(francaInterface),
            cBridgeNameRules.getBaseApiInstanceName(francaInterface),
            classType.classType);
    String returnType = "std::shared_ptr<" + cStruct.baseApiName + ">";
    CType fieldType = new CPointerType(CType.VOID);
    fieldType.isConst = true;

    CStructTypedef structDef =
        new CStructTypedef(
            cBridgeNameRules.getStructRefType(francaInterface),
            singletonList(new CField("private_pointer", new CppTypeInfo(fieldType))));

    CFunction cFunction = CBridgeComponents.createGetPointerFuntion(cStruct, returnType);
    CFunction cFunctionRelease = CBridgeComponents.createStructReleaseFunction(cStruct);
    this.functions.add(cFunction);
    this.functions.add(cFunctionRelease);
    this.structs.add(structDef);
  }
}
