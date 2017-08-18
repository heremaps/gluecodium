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

package com.here.ivi.api.generator.common.java.templates

import com.here.ivi.api.model.javamodel.JavaInterface
import com.here.ivi.api.generator.common.TemplateEngine
import com.here.ivi.api.model.javamodel.JavaElements

public class JavaInterfaceTemplate {
    def static generate(JavaInterface javaInterface) '''«TemplateEngine.render("java/Package", javaInterface.javaPackage)»
    «TemplateEngine.render("java/Import", JavaElements.collectImports(javaInterface))»

/**
 * «javaInterface.comment»
 */
interface «javaInterface.name» «JavaInheritanceTemplate.generate(javaInterface.inheritances)»{
«FOR m : javaInterface.methods»
«"  "»«JavaMethodTemplate.pureSignature(m)»;
«ENDFOR»
}'''
}
