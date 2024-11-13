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

package com.here.gluecodium.model.lime

/*
 *  The structured comments for properties are split in the following way:
 *   1. '@value':
 *       a) stored in: 'LimeProperty.valueComment'
 *       b) purpose: short description of property (ideally single line)
 *       c) usage: declaration of property (Swift/Dart) or setter_param/getter_return (Java/C++)
 *   2. '@description':
 *       a) stored in: 'LimeProperty.additionalDescriptionComment'
 *       b) purpose: extended information about property that is required to use it correctly
 *       c) usage: declaration of property (Swift/Dart), declaration of getter/setter (Java/C++)
 *   3. '@get':
 *       a) stored in: 'LimeProperty.getter.comment'
 *       b) purpose: documents getter function
 *       c) usage: declaration of getter function
 *   4. '@set'
 *       a) stored in: 'LimeProperty.setter.comment'
 *       b) purpose: documents setter function
 *       c) usage: declaration of setter function
 *
 * Moreover, if '@value' is not provided, then we try to use the first lines of the comment that
 * are not associated with any annotation (LimeProperty.comment).
 *
 * Due to the fact, that the generators use the same mustache templates for many purposes 'LimeProperty.comment'
 * getter is overridden to ensure seamless integration of value/description logic with the usual path.
 */
class LimeProperty(
    path: LimePath,
    comment: LimeComment = LimeComment(),
    attributes: LimeAttributes? = null,
    typeRef: LimeTypeRef,
    val getter: LimeFunction,
    val setter: LimeFunction? = null,
    val valueComment: LimeComment = LimeComment(),
    val additionalDescriptionComment: LimeComment = LimeComment(),
    val isStatic: Boolean = false,
) : LimeTypedElement(path, comment, attributes, typeRef = typeRef) {
    override val comment: LimeComment = comment
        get() = if (!field.isEmpty()) field else valueComment
}
