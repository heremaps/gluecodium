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

package com.here.ivi.api.model.rules;

import com.here.ivi.api.model.franca.DefinedBy;
import java.util.Optional;
import java.util.logging.Logger;
import org.franca.core.franca.FQualifiedElementRef;
import org.franca.core.franca.FTypeCollection;

/**
 * This class handles the specific rules for using target language BuiltIn values, such as MaxFloat
 * or NaN.
 *
 * <p>Each generator has to use the rules to determine the right target structure to use for the
 * values. <code>
 * package navigation
 *
 * import navigation.* from "classpath:/franca/spec/BuiltIn.fidl"
 *
 * typeCollection MyTypes {
 *     version {
 *         major 1
 *         minor 0
 *     }
 *
 *     const UInt8 InvalidSatellitesCount = BuiltIn.MaxFloat
 * }
 * </code>
 */
public class BuiltInValueRules {

  private static final Logger LOGGER = Logger.getLogger(BuiltInValueRules.class.getName());

  // TODO move to shared Helper with CppTypeMapper
  private static final String BUILTIN_MODEL = "navigation.BuiltIn";

  private static final String FLOAT_MAX_CONSTANT = "MaxFloat";
  private static final String FLOAT_NAN_CONSTANT = "NaNFloat";
  private static final String DOUBLE_NAN_CONSTANT = "NaNDouble";

  public enum BuiltInValues {
    FloatMax,
    FloatNan,
    DoubleNan
  }

  public static Optional<BuiltInValues> resolveReference(
      final FQualifiedElementRef qualifiedElementRef) {

    FTypeCollection typeCollection = DefinedBy.findDefiningTypeCollection(qualifiedElementRef);

    String modelName = DefinedBy.getModelName(typeCollection);
    String qualifiedName = modelName + "." + typeCollection.getName();

    if (BUILTIN_MODEL.equals(qualifiedName)) {
      switch (qualifiedElementRef.getElement().getName()) {
        case FLOAT_MAX_CONSTANT:
          return Optional.of(BuiltInValues.FloatMax);
        case FLOAT_NAN_CONSTANT:
          return Optional.of(BuiltInValues.FloatNan);
        case DOUBLE_NAN_CONSTANT:
          return Optional.of(BuiltInValues.DoubleNan);
        default:
          LOGGER.severe(
              "Could not resolve built-in value. Invalid franca definition. "
                  + qualifiedElementRef);
          break;
      }
    }

    return Optional.empty();
  }
}
