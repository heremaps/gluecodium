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

import com.here.ivi.api.generator.common.NameHelper
import com.here.ivi.api.model.FrancaElement
import com.here.ivi.api.model.Interface
import java.io.File
import org.franca.core.franca.FTypeCollection
import org.franca.core.franca.FMethod
import org.franca.core.franca.FArgument

class SwiftNameRules {

    def getImplementationFileName(FrancaElement<?> francaElement) {
        return "swift"
                + File.separator
                + String.join(File.separator, francaElement.getPackage())
                + File.separator
                + getFileName(francaElement)
                + ".swift";
    }

    private def getFileName(FrancaElement<?> francaElement) {
        switch francaElement {
            Interface<?>  : computeClassName(francaElement.francaInterface)
            default : getTypeCollectionName(francaElement.francaTypeCollection)
        }
    }

    def getMethodName(FMethod method) {
        return method.name
    }

    def getParameterName(FArgument argument) {
        return argument.name
    }

    def getClassName(FTypeCollection base) {
        return computeClassName(base);
    }

    def String getTypeCollectionName(FTypeCollection base) {
        return NameHelper.toUpperCamelCase(base.getName())
    }

    def static computeClassName(FTypeCollection base) {
        return NameHelper.toUpperCamelCase(base.getName());
    }

}
