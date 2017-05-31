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

package com.here.ivi.api.generator.converter;

import com.here.ivi.api.TranspilerExecutionException;
import com.here.ivi.api.generator.common.cpp.CppTypeMapper;
import com.here.ivi.api.generator.converter.templates.EnumConvertBodyTemplate;
import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.model.cppmodel.*;
import java.util.LinkedList;
import java.util.List;
import org.franca.core.franca.*;

public class ConverterGeneratorHelper {

  private static final String CONVERSION_METHOD_NAME = "convert";
  private static final String INPUT_PARAMETER_NAME = "in";
  private static final String OUTPUT_PARAMETER_NAME = "out";

  //convert enum
  public static CppMethod buildConvertMethod(
      FrancaModel<?, ?> model,
      CppModelAccessor<?> rootTypeSource,
      CppModelAccessor<?> rootTypeTarget,
      FEnumerationType fEnumType) {

    CppMethod result = new CppMethod();
    result.name = CONVERSION_METHOD_NAME;
    CppParameter in = new CppParameter();
    in.name = INPUT_PARAMETER_NAME;
    in.mode = CppParameter.Mode.Input;
    in.type = CppTypeMapper.mapEnum(rootTypeSource, fEnumType);
    CppParameter out = new CppParameter();
    out.name = OUTPUT_PARAMETER_NAME;
    out.mode = CppParameter.Mode.Output;
    out.type = CppTypeMapper.mapEnum(rootTypeTarget, fEnumType);
    result.inParameters.add(in);
    result.outParameters.add(out);

    List<CppAssignments.CppAssignment> conversions = new LinkedList<>();
    generateConversions(
        fEnumType, model, rootTypeTarget, OUTPUT_PARAMETER_NAME, INPUT_PARAMETER_NAME, conversions);

    if (conversions.size() != 1) {
      throw new TranspilerExecutionException("invalid conversion count for enumeration");
    }

    result.bodyTemplate = new EnumConvertBodyTemplate(conversions.get(0));

    return result;
  }

  //FTypeRef
  private static void generateConversions(
      FTypeRef typeRef,
      FrancaModel<?, ?> model,
      CppModelAccessor<?> rootTypeTarget,
      String targetName,
      String sourceName,
      List<CppAssignments.CppAssignment> conversions) {

    // complex type
    if (typeRef.getDerived() != null) {
      FType derived = typeRef.getDerived();
      generateConversions(derived, model, rootTypeTarget, targetName, sourceName, conversions);
      // for primitive type plain assignment is possible
    } else if (typeRef.getPredefined() != null) {
      CppAssignments.PlainAssignment assign = new CppAssignments.PlainAssignment();
      assign.leftHandSide = new CppValue(targetName);
      assign.rightHandSide = new CppValue(sourceName);
      conversions.add(assign);
    }
  }

  //FType
  private static void generateConversions(
      FType type,
      FrancaModel<?, ?> model,
      CppModelAccessor<?> rootTypeTarget,
      String targetName,
      String sourceName,
      List<CppAssignments.CppAssignment> conversions) {

    //follow type definition
    if (type instanceof FTypeDef) {
      FTypeDef typeDef = (FTypeDef) type;
      FTypeRef typeRefInner = typeDef.getActualType();
      if (typeRefInner != null) {
        generateConversions(
            typeRefInner, model, rootTypeTarget, targetName, sourceName, conversions);
      }
    }

    //array/map/ struct
    if (type instanceof FArrayType || type instanceof FMapType || type instanceof FStructType) {
      //TODO APIGEN-142 APIGEN-143 APIGEN-145
    }
    //enumeration -> static cast assignment
    if (type instanceof FEnumerationType) {
      CppAssignments.PlainAssignment assign = new CppAssignments.PlainAssignment();
      assign.leftHandSide = new CppValue(targetName);
      CppType targetType = CppTypeMapper.mapEnum(rootTypeTarget, (FEnumerationType) type);
      String castedSource = "static_cast<" + targetType.name + ">(" + sourceName + ")";
      assign.rightHandSide = new CppValue(castedSource);
      conversions.add(assign);
    }
  }
}
