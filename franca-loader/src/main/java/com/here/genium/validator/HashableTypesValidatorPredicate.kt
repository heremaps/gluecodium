/*
 * Copyright (C) 2016-2019 HERE Europe B.V.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 * SPDX-License-Identifier: Apache-2.0
 * License-Filename: LICENSE
 */

package com.here.genium.validator

import org.franca.core.framework.FrancaHelpers
import org.franca.core.franca.FBasicTypeId
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FModelElement
import org.franca.core.franca.FTypeRef

abstract class HashableTypesValidatorPredicate<T : FModelElement> : ValidatorPredicate<T> {
    companion object {
        @JvmStatic
        protected fun isHashableType(francaTypeRef: FTypeRef): Boolean {
            val actualDerived = FrancaHelpers.getActualDerived(francaTypeRef)
            if (actualDerived != null) {
                return actualDerived is FEnumerationType
            }

            // ByteBuffers are not allowed as keys. "Undefined" means either an Instance or
            // a broken type reference, neither of those are allowed too.
            val actualPredefined = FrancaHelpers.getActualPredefined(francaTypeRef)
            return actualPredefined != FBasicTypeId.BYTE_BUFFER &&
                actualPredefined != FBasicTypeId.UNDEFINED
        }
    }
}
