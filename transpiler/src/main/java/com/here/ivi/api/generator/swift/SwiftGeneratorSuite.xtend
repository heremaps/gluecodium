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

package com.here.ivi.api.generator.swift

import com.here.ivi.api.Transpiler
import com.here.ivi.api.generator.common.AbstractGeneratorSuite
import com.here.ivi.api.generator.common.GeneratorSuite
import com.here.ivi.api.generator.common.Version
import com.here.ivi.api.loader.FrancaModelLoader
import com.here.ivi.api.loader.baseapi.CppStubSpecAccessorFactory
import com.here.ivi.api.model.FrancaModel
import com.here.ivi.api.model.ModelHelper
import com.here.ivi.api.validator.common.ResourceValidator
import java.io.File
import java.util.Objects
import java.util.stream.Collectors
import navigation.CppStubSpec;



final class SwiftGeneratorSuite extends AbstractGeneratorSuite implements GeneratorSuite {

    // TODO: APIGEN-149 - Create an ObjCSpecAccessorFactory
    val specAccessorFactory = new CppStubSpecAccessorFactory
    File[] currentFiles
    FrancaModel<CppStubSpec.InterfacePropertyAccessor,CppStubSpec.TypeCollectionPropertyAccessor> model
    FrancaModelLoader<CppStubSpec.InterfacePropertyAccessor,CppStubSpec.TypeCollectionPropertyAccessor> modelLoader

    new (Transpiler transpiler) {
        super(transpiler)
    }

    override generateFiles() {
        val nameRules = new SwiftNameRules
        val includeResolver = new SwiftIncludeResolver
        // TODO: APIGEN-108 Add all other possible generators and call them here
        val headerGenerator = new SwiftGenerator(this, nameRules, includeResolver)
        val generatorStream = model.getInterfaces().stream().filter([
            getPropertyAccessor().getIsMethodContainer(it.getFrancaInterface()) === null ||
                !it.getPropertyAccessor().getIsMethodContainer(it.getFrancaInterface())
        ]).map([headerGenerator.generate(it)]).flatMap([stream]);

        return generatorStream.filter([Objects.nonNull(it)]).collect(Collectors.toList)
    }

    override getSpecPath() {
        return specAccessorFactory.getSpecPath
    }

    override getVersion() {
        return new Version(0,0,1)
    }

    override getName() {
        return "com.here.SwiftGenerator"
    }

    override validate() {
        val resourceSet = modelLoader.getResourceSetProvider.get
        return new ResourceValidator(resourceSet).validate(currentFiles)
    }

    override buildModel(String inputPath) {
        modelLoader = new FrancaModelLoader(specAccessorFactory)
        ModelHelper.getFdeplInjector.injectMembers(modelLoader)
        currentFiles = FrancaModelLoader.listFilesRecursively(new File(inputPath))
        model = modelLoader.load(specAccessorFactory.getSpecPath, currentFiles)
    }
}
