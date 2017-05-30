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
import com.here.ivi.api.generator.common.cpp.CppGeneratorHelper
import com.here.ivi.api.generator.common.cpp.templates.CppCommentHeaderTemplate
import com.here.ivi.api.model.Interface
import com.here.ivi.api.model.TypeCollection
import org.franca.core.franca.FBasicTypeId
import org.franca.core.franca.FInterface
import org.franca.core.franca.FMethod
import org.franca.core.franca.FTypeRef

class ObjCStructGenerator {

    ObjCNameRules nameRules
    ObjCIncludeResolver includeResolver
    GeneratorSuite generatorSuite

    new(GeneratorSuite suite, ObjCNameRules rules, ObjCIncludeResolver resolver) {
        nameRules = rules
        includeResolver = resolver
        generatorSuite = suite
    }

    def GeneratedFile generate(Interface<?> methods, TypeCollection<?> typeCollection) {
        val outputFile = nameRules.getHeaderPath(typeCollection)
        var CharSequence generatorNotice = CppGeneratorHelper.generateGeneratorNotice(generatorSuite, typeCollection,
            outputFile)
        val interfaces = typeCollection.modelInfo.FModel.interfaces
        if (interfaces.size > 0) {
            var CharSequence innerContent = generateInterface(interfaces.get(0))
            var String fileContent = CppCommentHeaderTemplate.generate(generatorNotice, innerContent).toString()
            return new GeneratedFile(fileContent, outputFile)
        }

    }

    def generateInterface (FInterface api) '''
        «api.generateHeader»

        «FOR t : api.types»
        #import "«t.name.toFirstUpper».hpp"
        «ENDFOR»

        @interface «api.classname»
            // getters for attributes
            «FOR a : api.attributes»
            «a.type.generate» get«a.name.toFirstUpper»() const;
            «ENDFOR»

            // methods
            «FOR m : api.methods»
            «m.generateMethodDecl»
            «ENDFOR»

            // attributes
            «FOR a : api.attributes»
            «a.type.generate» m«a.name.toFirstUpper»;
            «ENDFOR»
        @end
    '''

    def private generateHeader (FInterface api) '''
        #include <Foundation/Foundation.h>
    '''

    def generateMethodDecl (FMethod it) '''
        -(void) «name»With«FOR a : inArgs SEPARATOR ' '»«a.name»:(«a.type.generate») «a.name»«ENDFOR»;
    '''

    def generate (FTypeRef it) {
        if (derived!==null) {
            derived.name
        } else {
            switch (predefined) {
                case FBasicTypeId::INT8   : "NSInteger"
                case FBasicTypeId::INT16  : "NSInteger"
                case FBasicTypeId::INT32  : "NSInteger"
                case FBasicTypeId::UINT8  : "NSUInteger"
                case FBasicTypeId::UINT16 : "NSUInteger"
                case FBasicTypeId::UINT32 : "NSUInteger"
                case FBasicTypeId::STRING : "NSString*"
                case FBasicTypeId::DOUBLE : "double"
                default                   : "/*" + predefined.toString + "*/"
            }
        }
    }

    def getClassname (FInterface it) {
        "ABC" + name // TODO: Create a real prefix, depending on the library name
    }
}
