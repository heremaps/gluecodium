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

package com.here.gluecodium.generator.common.modelbuilder

import com.here.gluecodium.common.GenericTreeWalker
import com.here.gluecodium.model.lime.LimeConstant
import com.here.gluecodium.model.lime.LimeContainer
import com.here.gluecodium.model.lime.LimeContainerWithInheritance
import com.here.gluecodium.model.lime.LimeElement
import com.here.gluecodium.model.lime.LimeEnumeration
import com.here.gluecodium.model.lime.LimeEnumerator
import com.here.gluecodium.model.lime.LimeException
import com.here.gluecodium.model.lime.LimeField
import com.here.gluecodium.model.lime.LimeFunction
import com.here.gluecodium.model.lime.LimeLambda
import com.here.gluecodium.model.lime.LimeNamedElement
import com.here.gluecodium.model.lime.LimeParameter
import com.here.gluecodium.model.lime.LimeProperty
import com.here.gluecodium.model.lime.LimeStruct
import com.here.gluecodium.model.lime.LimeTypeAlias
import com.here.gluecodium.model.lime.LimeTypeRef
import com.here.gluecodium.model.lime.LimeTypesCollection
import com.here.gluecodium.model.lime.LimeValue

class LimeTreeWalker(builders: Collection<LimeBasedModelBuilder>) :
    GenericTreeWalker<LimeBasedModelBuilder>(builders, LIME_TREE_STRUCTURE) {

    fun walkTree(rootElement: LimeNamedElement) {
        walk(rootElement)
    }

    private fun walkChildNodes(limeContainer: LimeContainerWithInheritance) {
        walkCollection(limeContainer.classes)
        walkCollection(limeContainer.interfaces)
        walkCollection(limeContainer.lambdas)
        walkChildNodes(limeContainer as LimeContainer)
    }

    private fun walkChildNodes(limeTypes: LimeTypesCollection) {
        walkChildNodes(limeTypes as LimeContainer)
    }

    private fun walkChildNodes(limeStruct: LimeStruct) {
        walkCollection(limeStruct.fields)
        walkChildNodes(limeStruct as LimeContainer)
    }

    private fun walkChildNodes(limeContainer: LimeContainer) {
        walkCollection(limeContainer.functions)
        walkCollection(limeContainer.structs)
        walkCollection(limeContainer.typeAliases)
        walkCollection(limeContainer.properties)
        walkCollection(limeContainer.enumerations)
        walkCollection(limeContainer.constants)
        walkCollection(limeContainer.exceptions)
    }

    private fun walkChildNodes(limeMethod: LimeFunction) {
        walk(limeMethod.exception?.errorType)
        walkCollection(limeMethod.parameters)
    }

    private fun walkChildNodes(limeParameter: LimeParameter) {
        walk(limeParameter.typeRef)
    }

    private fun walkChildNodes(limeField: LimeField) {
        walk(limeField.typeRef)
        walk(limeField.defaultValue)
    }

    private fun walkChildNodes(limeTypeDef: LimeTypeAlias) {
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

    private fun walkChildNodes(limeValue: LimeValue) {
        walk(limeValue.typeRef)
    }

    private fun walkChildNodes(limeException: LimeException) {
        walk(limeException.errorType)
    }

    companion object {
        private val LIME_TREE_STRUCTURE =
            mutableMapOf<Any, TreeNodeInfo<LimeBasedModelBuilder, *>>()

        init {
            // Regular nodes
            initTreeNode(
                LimeContainerWithInheritance::class.java,
                LimeBasedModelBuilder::startBuilding,
                LimeBasedModelBuilder::finishBuilding,
                LimeTreeWalker::walkChildNodes
            )
            initTreeNode(
                LimeTypesCollection::class.java,
                LimeBasedModelBuilder::startBuilding,
                LimeBasedModelBuilder::finishBuilding,
                LimeTreeWalker::walkChildNodes
            )
            initTreeNode(
                LimeFunction::class.java,
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
                LimeBasedModelBuilder::startBuilding,
                LimeBasedModelBuilder::finishBuilding,
                LimeTreeWalker::walkChildNodes
            )
            initTreeNode(
                LimeField::class.java,
                LimeBasedModelBuilder::finishBuilding,
                LimeTreeWalker::walkChildNodes
            )
            initTreeNode(
                LimeTypeAlias::class.java,
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
            initTreeNode(
                LimeValue::class.java,
                LimeBasedModelBuilder::finishBuilding,
                LimeTreeWalker::walkChildNodes
            )
            initTreeNode(
                LimeException::class.java,
                LimeBasedModelBuilder::finishBuilding,
                LimeTreeWalker::walkChildNodes
            )

            // Leaf nodes
            initTreeNode(
                LimeLambda::class.java,
                LimeBasedModelBuilder::finishBuilding,
                Companion::noChildNodes
            )
            initTreeNode(
                LimeTypeRef::class.java,
                LimeBasedModelBuilder::finishBuilding,
                Companion::noChildNodes
            )
        }

        private fun <T : LimeElement> initTreeNode(
            clazz: Class<T>,
            finishMethod: LimeBasedModelBuilder.(T) -> Unit,
            walkChildNodes: LimeTreeWalker.(T) -> Unit
        ) {
            initTreeNode(clazz, { startBuilding(it) }, finishMethod, { this.walkChildNodes(it) })
        }

        private fun <T : LimeElement> initTreeNode(
            clazz: Class<T>,
            startMethod: LimeBasedModelBuilder.(T) -> Unit,
            finishMethod: LimeBasedModelBuilder.(T) -> Unit,
            walkChildNodes: LimeTreeWalker.(T) -> Unit
        ) {
            LIME_TREE_STRUCTURE[clazz] = TreeNodeInfo(
                clazz,
                startMethod,
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
