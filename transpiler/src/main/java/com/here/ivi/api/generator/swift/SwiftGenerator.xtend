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

import com.here.ivi.api.generator.baseapi.StubCommentParser
import com.here.ivi.api.generator.common.GeneratedFile
import com.here.ivi.api.generator.common.GeneratorSuite
import com.here.ivi.api.model.swift.SwiftClass
import com.here.ivi.api.model.swift.SwiftMethod
import com.here.ivi.api.model.swift.SwiftMethodParameter
import com.here.ivi.api.model.swift.SwiftType
import com.here.ivi.api.generator.swift.templates.SwiftFileTemplate
import java.util.stream.Collectors;
import com.here.ivi.api.model.Interface
import java.util.List
import navigation.BaseApiSpec
import java.util.stream.IntStream
import org.franca.core.franca.FArgument
import org.franca.core.franca.FMethod

class SwiftGenerator {

    SwiftNameRules nameRules
    SwiftIncludeResolver includeResolver
    GeneratorSuite generatorSuite

    new(GeneratorSuite suite, SwiftNameRules rules, SwiftIncludeResolver resolver) {
        nameRules = rules
        includeResolver = resolver
        generatorSuite = suite
    }

    def List<GeneratedFile> generate(Interface<BaseApiSpec.InterfacePropertyAccessor> api) {
        val swiftClass = buildSwiftModel(api)
        val content = SwiftFileTemplate.generate(swiftClass)

        return #[new GeneratedFile(content, nameRules.getHeaderFileName(api))]
    }

    def buildSwiftModel(Interface<?> iface) {
        val className = nameRules.getClassName(iface.getFrancaInterface());
        var resultingClass = new SwiftClass(className) => [
            // TODO use own objective-c comment parser
            comment = StubCommentParser.parse(iface.getFrancaInterface()).getMainBodyText() ?: ""
            methods = iface.getFrancaInterface().getMethods().stream().map([constructMethod]).collect(Collectors.toList())
        ]
        return resultingClass;
    }
    def constructMethod(FMethod method) {
        if (method.getInArgs().isEmpty) {
            return new SwiftMethod(method.name) => [
                returnType = constructMethodReturnType(method)
            ]
        } else {
            val params = IntStream.range(0, method.getInArgs().size()).boxed().map([
                val arg = method.getInArgs.get(it)
                return new SwiftMethodParameter(arg.name, mapType(arg))
            ]).collect(Collectors.toList())

            return new SwiftMethod(method.name, params) => [
                returnType = constructMethodReturnType(method)
            ]
        }
    }

    def constructMethodReturnType(FMethod method) {
        // TODO Wrap multiple return values and/or error code with subsequemt version of Hello World milestone
        return method.getOutArgs.stream.findFirst().map([mapType]).orElse(new SwiftType("void"))
    }

    def mapType(FArgument argument) {
        return new SwiftType("NSString", SwiftType.Subtype.POINTER)
    }
}
