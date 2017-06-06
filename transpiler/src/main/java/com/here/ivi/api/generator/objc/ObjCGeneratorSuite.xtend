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

package com.here.ivi.api.generator.objc

import com.here.ivi.api.Transpiler
import com.here.ivi.api.generator.common.AbstractGeneratorSuite
import com.here.ivi.api.generator.common.GeneratorSuite
import com.here.ivi.api.generator.common.Version
import com.here.ivi.api.loader.FrancaModelLoader
import com.here.ivi.api.loader.legacy.LegacySpecAccessorFactory
import com.here.ivi.api.model.FrancaModel
import com.here.ivi.api.model.ModelHelper
import com.here.ivi.api.model.rules.StructMethodRules
import com.here.ivi.api.validator.legacy.LegacyModelValidator
import com.here.ivi.api.validator.common.ResourceValidator
import java.io.File
import java.util.Objects
import java.util.stream.Collectors
import navigation.LegacySpec.InterfacePropertyAccessor
import navigation.LegacySpec.TypeCollectionPropertyAccessor

final class ObjCGeneratorSuite extends AbstractGeneratorSuite implements GeneratorSuite {

    // TODO: APIGEN-149 SpecAccessoryFactory for objective C will be implemented in separate patch
    val specAccessorFactory = new LegacySpecAccessorFactory
    File[] currentFiles
    FrancaModel<InterfacePropertyAccessor,TypeCollectionPropertyAccessor> model
    FrancaModelLoader<InterfacePropertyAccessor,TypeCollectionPropertyAccessor> modelLoader
    // TODO: APIGEN-149 Validator for objective C will be implemented in separate patch
    val validator = new LegacyModelValidator

    new (Transpiler transpiler) {
        super(transpiler)
    }

    override generateFiles() {
        val nameRules = new ObjCNameRules
        val includeResolver = new ObjCIncludeResolver
        val apiGenerator = new ObjCApiGenerator
        val typeCollectionGenerator = new ObjCTypeCollectionGenerator
        val structGenerator = new ObjCStructGenerator(this, nameRules, includeResolver)

        val generatorStreams = StructMethodRules.partitionModel(
                model,
                [apiGenerator.generateFiles(it)],
                [typeCollectionGenerator.generate(it)],
                [structGenerator.generate(it.iface, it.type)])
        return generatorStreams.filter([Objects.nonNull(it)]).collect(Collectors.toList)
    }

    override getSpecPath() {
        return specAccessorFactory.getSpecPath
    }

    override getVersion() {
        return new Version(0,0,1)
    }

    override getName() {
        return "com.here.ObjCGenerator"
    }

    override validate() {
        val resourceSet = modelLoader.getResourceSetProvider.get
        return new ResourceValidator(resourceSet).validate(currentFiles) && validator.validate(model)
    }

    override buildModel(String inputPath) {
        modelLoader = new FrancaModelLoader(specAccessorFactory)
        ModelHelper.getFdeplInjector.injectMembers(modelLoader)
        currentFiles = FrancaModelLoader.listFilesRecursively(new File(inputPath))
        model = modelLoader.load(specAccessorFactory.getSpecPath, currentFiles)
    }
}
