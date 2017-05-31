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

import com.here.ivi.api.generator.common.GeneratedFile;
import com.here.ivi.api.generator.common.GeneratorSuite;
import com.here.ivi.api.generator.common.cpp.AbstractCppGenerator;
import com.here.ivi.api.generator.common.cpp.CppNameRules;
import com.here.ivi.api.generator.common.cpp.CppTemplateDelegator;
import com.here.ivi.api.generator.common.cpp.templates.CppCommentHeaderTemplate;
import com.here.ivi.api.generator.common.cpp.templates.CppDelegatorTemplate;
import com.here.ivi.api.generator.converter.templates.CppConverterMethodsTemplate;
import com.here.ivi.api.model.FrancaModel;
import com.here.ivi.api.model.TypeCollection;
import com.here.ivi.api.model.cppmodel.CppIncludeResolver;
import com.here.ivi.api.model.cppmodel.CppModelAccessor;
import com.here.ivi.api.model.cppmodel.CppNamespace;
import navigation.CppStubSpec;
import org.franca.core.franca.*;

public class ConverterGenerator extends AbstractCppGenerator {

  public static final String conversionNamespaceName = "conversion";

  private final CppNameRules nameRulesOpposite;
  private final FrancaModel<?, ?> coreModel;

  /*
   * Generates a legacy converter generator. Such a generator produces convert methods from
   * cpp types defined by using <code>nameRules</code> to types defined by using <code>nameRulesOpposite</code>
   * (and vice versa).
   *
   * @param suite the generator suite this generator belongs to
   * @param nameRules the naming rules used for defining a cpp type
   * @param nameRules the naming rules used for defining the opposite cpp type to the one defined by <code>nameRules</code>
   * @param coreModel franca model containing all model related data
   * @param includeResolver include resolver
   */
  public ConverterGenerator(
      GeneratorSuite suite,
      CppNameRules nameRules,
      CppNameRules nameRulesOpposite,
      FrancaModel<?, ?> coreModel,
      CppIncludeResolver includeResolver) {

    super(suite, nameRules, includeResolver);
    this.nameRulesOpposite = nameRulesOpposite;
    this.coreModel = coreModel;
  }

  public GeneratedFile generate(final TypeCollection<?> tc) {

    CppNamespace ns = generateConversionNamespace(tc);

    String outputFileName = nameRules.getConversionHeaderPath(tc);
    super.includeResolver.resolveLazyIncludes(ns, outputFileName);

    CharSequence generatorNotice = getGeneratorNotice(tc, outputFileName);
    CharSequence innerContent =
        CppDelegatorTemplate.generate(
            new CppTemplateDelegator() {
              public CharSequence generate(CppNamespace cppNamespace) {
                return CppConverterMethodsTemplate.generate(this, cppNamespace);
              }
            },
            ns);
    String fileContent =
        CppCommentHeaderTemplate.generate(generatorNotice, innerContent).toString();

    return new GeneratedFile(fileContent, outputFileName);
  }

  private <DPA extends CppStubSpec.TypeCollectionPropertyAccessor>
      CppNamespace generateConversionNamespace(final TypeCollection<DPA> tc) {

    //conversion is done from a cpp type defined using rootType to the same
    //type but defined by rootTypeOpposite (and vice versa)
    CppModelAccessor<DPA> rootType = new CppModelAccessor<>(tc, super.nameRules);
    CppModelAccessor<DPA> rootTypeOpposite = new CppModelAccessor<>(tc, nameRulesOpposite);

    CppNamespace conversionNamespace = new CppNamespace(conversionNamespaceName);

    // find types to be converted
    for (FType type : tc.getFrancaTypeCollection().getTypes()) {
      // struct TODO: APIGEN-144
      if (type instanceof FStructType) {
        // arrays, sets TODO: APIGEN-143 APIGEN-145
      } else if (type instanceof FArrayType) {
        //maps TODO: APIGEN-142
      } else if (type instanceof FMapType) {
        //enumeration
      } else if (type instanceof FEnumerationType) {
        conversionNamespace.members.add(
            ConverterGeneratorHelper.buildConvertMethod(
                coreModel, rootType, rootTypeOpposite, (FEnumerationType) type));
        conversionNamespace.members.add(
            ConverterGeneratorHelper.buildConvertMethod(
                coreModel, rootTypeOpposite, rootType, (FEnumerationType) type));
      }
    }
    return conversionNamespace;
  }
}
