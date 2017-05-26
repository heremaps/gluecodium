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
import com.here.ivi.api.generator.converter.templates.StructConvertBodyTemplate;
import com.here.ivi.api.model.DefinedBy;
import com.here.ivi.api.model.FrancaElement;
import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.model.Includes;
import com.here.ivi.api.model.cppmodel.*;
import java.util.*;
import java.util.stream.Collectors;
import navigation.CppStubSpec;
import org.franca.core.franca.*;

public class ConverterGeneratorHelper {

  private static final String CONVERSION_METHOD_NAME = "convert";
  private static final String INPUT_PARAMETER_NAME = "in";
  private static final String OUTPUT_PARAMETER_NAME = "out";

  public static CppMethod buildConvertMethod(
      FrancaModel<?, ?> model,
      CppModelAccessor<? extends CppStubSpec.TypeCollectionPropertyAccessor> rootTypeSource,
      CppModelAccessor<? extends CppStubSpec.TypeCollectionPropertyAccessor> rootTypeTarget,
      FStructType fStruct) {

    CppMethod result = new CppMethod();
    result.name = CONVERSION_METHOD_NAME;
    CppParameter in = new CppParameter();
    in.name = INPUT_PARAMETER_NAME;
    in.mode = CppParameter.Mode.Input;
    in.type = CppTypeMapper.mapStruct(rootTypeSource, fStruct);
    CppParameter out = new CppParameter();
    out.name = OUTPUT_PARAMETER_NAME;
    out.mode = CppParameter.Mode.Output;
    out.type = CppTypeMapper.mapStruct(rootTypeTarget, fStruct);
    result.inParameters.add(in);
    result.outParameters.add(out);

    List<CppAssignments.CppAssignment> conversions = new LinkedList<>();
    generateConversions(
        fStruct,
        model,
        rootTypeSource,
        rootTypeTarget,
        OUTPUT_PARAMETER_NAME,
        INPUT_PARAMETER_NAME,
        conversions);

    result.bodyTemplate = new StructConvertBodyTemplate(conversions);

    //overtake includes
    Set<Includes.Include> includes =
        conversions
            .stream()
            .filter(p -> p instanceof CppElementWithIncludes)
            .map(t -> ((CppElementWithIncludes) t).includes)
            .flatMap(Set::stream)
            .collect(Collectors.toSet());
    result.includes.addAll(includes);

    return result;
  }

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

  private static void generateConversions(
      FStructType structType,
      FrancaModel<?, ?> model,
      CppModelAccessor<? extends CppStubSpec.TypeCollectionPropertyAccessor> rootTypeSource,
      CppModelAccessor<? extends CppStubSpec.TypeCollectionPropertyAccessor> rootTypeTarget,
      String targetNamePrefix,
      String sourceNamePrefix,
      List<CppAssignments.CppAssignment> conversions) {
    Iterator<FField> memberIterator = structType.getElements().iterator();

    while (memberIterator.hasNext()) {
      FField field = memberIterator.next();
      FTypeRef typeRef = field.getType();

      generateConversions(
          typeRef,
          model,
          rootTypeTarget,
          targetNamePrefix + "." + rootTypeTarget.getRules().getFieldName(field.getName()),
          sourceNamePrefix + "." + rootTypeSource.getRules().getFieldName(field.getName()),
          conversions);
    }
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

    if (type instanceof FTypeDef) {
      //type definition will be followed
      FTypeDef typeDef = (FTypeDef) type;
      FTypeRef typeRefInner = typeDef.getActualType();
      if (typeRefInner != null) {
        generateConversions(
            typeRefInner, model, rootTypeTarget, targetName, sourceName, conversions);
      }
    } else if (type instanceof FArrayType || type instanceof FMapType) {
      //TODO APIGEN-142 APIGEN-143 APIGEN-145
    } else if (type instanceof FStructType) {
      // structs are converted via convert-method call
      CppAssignments.MethodAssignment convert =
          new CppAssignments.MethodAssignment(
              CONVERSION_METHOD_NAME, new CppValue(sourceName), new CppValue(targetName));
      //include handling
      DefinedBy definer = DefinedBy.createFromFModelElement(type);

      Optional<? extends FrancaElement> francaElementOpt = model.find(definer);
      if (!francaElementOpt.isPresent()) {
        throw new TranspilerExecutionException(
            "could not find Franca Element. Invalid franca definition");
      }
      /* As source/ target conversion are defined in the same converter header file,
      we can choose any of their nameRules */
      String includeName =
          rootTypeTarget.getRules().getConversionHeaderPath(francaElementOpt.get());
      convert.includes.add(new Includes.InternalPublicInclude(includeName));
      conversions.add(convert);
    }
    //enumeration are converted via static cast assignment
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
