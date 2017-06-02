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

import com.here.ivi.api.generator.common.GeneratedFile
import com.here.ivi.api.generator.common.GeneratorSuite
import com.here.ivi.api.generator.objc.model.ObjCClass
import com.here.ivi.api.generator.objc.model.ObjCMethod
import com.here.ivi.api.generator.objc.model.ObjCMethodParameter
import com.here.ivi.api.generator.objc.model.ObjCType
import com.here.ivi.api.generator.objc.templates.ObjCHeaderFileTemplate
import com.here.ivi.api.model.Interface
import java.util.LinkedList
import java.util.List
import navigation.LegacySpec

class ObjCHeaderGenerator {

    ObjCNameRules nameRules
    ObjCIncludeResolver includeResolver
    GeneratorSuite generatorSuite

    new(GeneratorSuite suite, ObjCNameRules rules, ObjCIncludeResolver resolver) {
        nameRules = rules
        includeResolver = resolver
        generatorSuite = suite
    }

    def List<GeneratedFile> generate(Interface<LegacySpec.InterfacePropertyAccessor> api) {
        // TODO: APIGEN-175 Implement Swift Generator and create the view models from the Franca data model
        // The templates should not have any logic other than formatting what the view model (ObjCClass)
        // tells them
        val outputFile = nameRules.getHeaderFileName(api)
        var objclass = new ObjCClass(api.name, "NSObject")
        objclass.prefix = "ABC"
        objclass.comment = "The greatest class ever"
        val method1 = new ObjCMethod("sayHello")
        val method2 = new ObjCMethod(#{new ObjCMethodParameter("sayHelloTo",
            new ObjCType("NSString", ObjCType.Subtype.POINTER), "name")})
        objclass.methods = #[method1, method2]
        val content = ObjCHeaderFileTemplate.generate(objclass)
        val generateFiled = new GeneratedFile(content, outputFile)
        val list = new LinkedList
        list.add(generateFiled)
        return list
    }
}
