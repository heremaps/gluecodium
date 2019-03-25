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

package com.here.genium.generator.common.modelbuilder

import com.here.genium.model.lime.LimeConstant
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeElement
import com.here.genium.model.lime.LimeEnumeration
import com.here.genium.model.lime.LimeEnumerator
import com.here.genium.model.lime.LimeField
import com.here.genium.model.lime.LimeMethod
import com.here.genium.model.lime.LimeParameter
import com.here.genium.model.lime.LimeProperty
import com.here.genium.model.lime.LimeStruct
import com.here.genium.model.lime.LimeTypeDef
import com.here.genium.model.lime.LimeTypeRef
import com.here.genium.model.lime.LimeValue

class LimeTreeWalker(builders: Collection<LimeBasedModelBuilder>) :
    GenericTreeWalker<LimeBasedModelBuilder>(builders, LIME_TREE_STRUCTURE) {

    fun walkTree(limeContainer: LimeContainer) {
        walk(limeContainer)
    }

    private fun walkChildNodes(limeContainer: LimeContainer) {
        walk(limeContainer.parent?.type)
        walkCollection(limeContainer.methods)
        walkCollection(limeContainer.structs)
        walkCollection(limeContainer.typeDefs)
        walkCollection(limeContainer.properties)
        walkCollection(limeContainer.enumerations)
        walkCollection(limeContainer.constants)
    }

    private fun walkChildNodes(limeMethod: LimeMethod) {
        walk(limeMethod.errorType)
        walkCollection(limeMethod.parameters)
    }

    private fun walkChildNodes(limeParameter: LimeParameter) {
        walk(limeParameter.typeRef)
    }

    private fun walkChildNodes(limeStruct: LimeStruct) {
        walkCollection(limeStruct.fields)
    }

    private fun walkChildNodes(limeField: LimeField) {
        walk(limeField.typeRef)
        walk(limeField.defaultValue)
    }

    private fun walkChildNodes(limeTypeDef: LimeTypeDef) {
        walk(limeTypeDef.typeRef)
    }

    private fun walkChildNodes(limeEnumeration: LimeEnumeration) {
        walkCollection(limeEnumeration.enumerators)
    }

    private fun walkChildNodes(limeEnumerator: LimeEnumerator) {
        walk(limeEnumerator.value)
    }

    private fun walkChildNodes(limeConstant: LimeConstant) {
        walk(limeConstant.typeRef)
        walk(limeConstant.value)
    }

    private fun walkChildNodes(limeProperty: LimeProperty) {
        walk(limeProperty.typeRef)
    }

    companion object {
        private val LIME_TREE_STRUCTURE =
            mutableMapOf<Any, GenericTreeWalker.TreeNodeInfo<LimeBasedModelBuilder, *>>()

        init {
            // Regular nodes
            initTreeNode(
                LimeContainer::class.java,
                LimeBasedModelBuilder::finishBuilding,
                LimeTreeWalker::walkChildNodes
            )
            initTreeNode(
                LimeMethod::class.java,
                LimeBasedModelBuilder::finishBuilding,
                LimeTreeWalker::walkChildNodes
            )
            initTreeNode(
                LimeParameter::class.java,
                LimeBasedModelBuilder::finishBuilding,
                LimeTreeWalker::walkChildNodes
            )
            initTreeNode(
                LimeStruct::class.java,
                LimeBasedModelBuilder::finishBuilding,
                LimeTreeWalker::walkChildNodes
            )
            initTreeNode(
                LimeField::class.java,
                LimeBasedModelBuilder::finishBuilding,
                LimeTreeWalker::walkChildNodes
            )
            initTreeNode(
                LimeTypeDef::class.java,
                LimeBasedModelBuilder::finishBuilding,
                LimeTreeWalker::walkChildNodes
            )
            initTreeNode(
                LimeProperty::class.java,
                LimeBasedModelBuilder::finishBuilding,
                LimeTreeWalker::walkChildNodes
            )
            initTreeNode(
                LimeEnumeration::class.java,
                LimeBasedModelBuilder::finishBuilding,
                LimeTreeWalker::walkChildNodes
            )
            initTreeNode(
                LimeEnumerator::class.java,
                LimeBasedModelBuilder::finishBuilding,
                LimeTreeWalker::walkChildNodes
            )
            initTreeNode(
                LimeConstant::class.java,
                LimeBasedModelBuilder::finishBuilding,
                LimeTreeWalker::walkChildNodes
            )

            // Leaf nodes
            initTreeNode(
                LimeTypeRef::class.java,
                LimeBasedModelBuilder::finishBuilding,
                Companion::noChildNodes
            )
            initTreeNode(
                LimeValue::class.java,
                LimeBasedModelBuilder::finishBuilding,
                Companion::noChildNodes
            )
        }

        private fun <T : LimeElement> initTreeNode(
            clazz: Class<T>,
            finishMethod: LimeBasedModelBuilder.(T) -> Unit,
            walkChildNodes: LimeTreeWalker.(T) -> Unit
        ) {
            LIME_TREE_STRUCTURE[clazz] = TreeNodeInfo(
                clazz,
                LimeBasedModelBuilder::startBuilding,
                finishMethod,
                { (this as LimeTreeWalker).walkChildNodes(it) }
            )
        }

        @Suppress("UNUSED_PARAMETER")
        private fun noChildNodes(walker: LimeTreeWalker, element: LimeElement) {
            // Do nothing
        }
    }
}
