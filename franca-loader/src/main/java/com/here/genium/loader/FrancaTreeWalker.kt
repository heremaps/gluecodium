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

package com.here.genium.loader

import com.here.genium.common.GenericTreeWalker
import org.eclipse.emf.ecore.EObject
import org.franca.core.franca.FArgument
import org.franca.core.franca.FArrayType
import org.franca.core.franca.FAttribute
import org.franca.core.franca.FConstantDef
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FEnumerator
import org.franca.core.franca.FField
import org.franca.core.franca.FInitializerExpression
import org.franca.core.franca.FInterface
import org.franca.core.franca.FMapType
import org.franca.core.franca.FMethod
import org.franca.core.franca.FStructType
import org.franca.core.franca.FTypeCollection
import org.franca.core.franca.FTypeDef
import org.franca.core.franca.FTypeRef
import org.franca.core.franca.FTypedElement

/**
 * Tree walker for the Franca model tree decouples tree traversal from the creation of
 * language-specific models. The tree walker has a list of "model builders" and invokes all of the
 * builders for every node.
 *
 * The invocation sequence for each node is the same, regardless of the node type:
 *
 *  1. Call builder.startBuilding(node) for each builder.
 *  2. Walk all child nodes of the current node (recursively).
 *  3. Call builder.finishBuilding(node) for each builder.
 *
 * For example, a model element representing a class requires all model elements for its methods
 * to be built beforehand. So it could only be built in the finishBuilding() step. However, for some
 * language models the method elements might need to know the class name to be built. The class name
 * could be calculated at startBuilding() step and thus made available to the children.
 */
class FrancaTreeWalker(
    builders: Collection<ModelBuilder>,
    private val companionHelper: FrancaCompanionHelper
) : GenericTreeWalker<ModelBuilder>(builders, FRANCA_TREE_STRUCTURE) {

    fun walkTree(francaTypeCollection: FTypeCollection) {
        walk(francaTypeCollection)
    }

    private fun walkChildNodes(francaInterface: FInterface) {
        // Code is generated only for the "top" level interface.
        // Walking "base" just provides additional inheritance data to the child.
        walk(francaInterface.base)

        walkCollection(francaInterface.methods)
        walkCollection(francaInterface.attributes)
        walkChildNodes(francaInterface as FTypeCollection)
    }

    private fun walkChildNodes(francaTypeCollection: FTypeCollection) {
        walkCollection(francaTypeCollection.constants)
        walkCollection(francaTypeCollection.types)
    }

    private fun walkChildNodes(francaMethod: FMethod) {
        walkCollection(IN_ARG_KEY, francaMethod.inArgs)
        walkCollection(OUT_ARG_KEY, francaMethod.outArgs)
        walk(francaMethod.errorEnum)
    }

    private fun walkChildNodes(francaStructType: FStructType) {
        walkCollection(francaStructType.elements)
        companionHelper.getCompanion(francaStructType)?.let {
            walkCollection(it.methods)
            walkCollection(it.constants)
        }
    }

    private fun walkChildNodes(francaTypedElement: FTypedElement) {
        walk(francaTypedElement.type)
    }

    private fun walkChildNodes(francaEnumerationType: FEnumerationType) {
        walkCollection(francaEnumerationType.enumerators)
    }

    private fun walkChildNodes(francaEnumerator: FEnumerator) {
        walk(francaEnumerator.value)
    }

    private fun walkChildNodes(francaTypeDef: FTypeDef) {
        walk(francaTypeDef.actualType)
    }

    private fun walkChildNodes(francaArrayType: FArrayType) {
        walk(francaArrayType.elementType)
    }

    private fun walkChildNodes(francaMapType: FMapType) {
        walk(francaMapType.keyType)
        walk(francaMapType.valueType)
    }

    private fun walkChildNodes(francaConstant: FConstantDef) {
        walk(francaConstant.type)
        walk(francaConstant.rhs)
    }

    companion object {
        private const val IN_ARG_KEY = "InputArgument"
        private const val OUT_ARG_KEY = "OutputArgument"
        private val FRANCA_TREE_STRUCTURE =
            mutableMapOf<Any, TreeNodeInfo<ModelBuilder, *>>()

        init {
            // Regular nodes
            initTreeNode(
                FInterface::class.java,
                ModelBuilder::startBuilding,
                ModelBuilder::finishBuilding,
                FrancaTreeWalker::walkChildNodes
            )
            initTreeNode<FTypeCollection>(
                FTypeCollection::class.java,
                ModelBuilder::startBuilding,
                ModelBuilder::finishBuilding,
                FrancaTreeWalker::walkChildNodes
            )
            initTreeNode(
                FMethod::class.java,
                ModelBuilder::finishBuilding,
                FrancaTreeWalker::walkChildNodes
            )
            initTreeNode(
                FAttribute::class.java,
                ModelBuilder::finishBuilding,
                FrancaTreeWalker::walkChildNodes
            )
            initTreeNode(
                FConstantDef::class.java,
                ModelBuilder::finishBuilding,
                FrancaTreeWalker::walkChildNodes
            )
            initTreeNode(
                FStructType::class.java,
                ModelBuilder::finishBuilding,
                FrancaTreeWalker::walkChildNodes
            )
            initTreeNode(
                FEnumerationType::class.java,
                ModelBuilder::finishBuilding,
                FrancaTreeWalker::walkChildNodes
            )
            initTreeNode(
                FEnumerator::class.java,
                ModelBuilder::finishBuilding,
                FrancaTreeWalker::walkChildNodes
            )
            initTreeNode(
                FField::class.java,
                ModelBuilder::finishBuilding,
                FrancaTreeWalker::walkChildNodes
            )
            initTreeNode(
                FTypeDef::class.java,
                ModelBuilder::finishBuilding,
                FrancaTreeWalker::walkChildNodes
            )
            initTreeNode(
                FArrayType::class.java,
                ModelBuilder::finishBuilding,
                FrancaTreeWalker::walkChildNodes
            )
            initTreeNode(
                FMapType::class.java,
                ModelBuilder::finishBuilding,
                FrancaTreeWalker::walkChildNodes
            )
            initTreeNode(
                IN_ARG_KEY,
                FArgument::class.java,
                ModelBuilder::startBuildingInputArgument,
                ModelBuilder::finishBuildingInputArgument,
                FrancaTreeWalker::walkChildNodes
            )
            initTreeNode(
                OUT_ARG_KEY,
                FArgument::class.java,
                ModelBuilder::startBuildingOutputArgument,
                ModelBuilder::finishBuildingOutputArgument,
                FrancaTreeWalker::walkChildNodes
            )

            // Leaf nodes
            initTreeNode(
                FInitializerExpression::class.java,
                ModelBuilder::finishBuilding,
                Companion::noChildNodes
            )
            initTreeNode(
                FTypeRef::class.java,
                ModelBuilder::finishBuilding,
                Companion::noChildNodes
            )
        }

        private fun <T : EObject> initTreeNode(
            clazz: Class<T>,
            finishMethod: ModelBuilder.(T) -> Unit,
            walkChildNodes: FrancaTreeWalker.(T) -> Unit
        ) = initTreeNode(clazz, clazz, { startBuilding(it) }, finishMethod, walkChildNodes)

        private fun <T : EObject> initTreeNode(
            clazz: Class<T>,
            startMethod: ModelBuilder.(T) -> Unit,
            finishMethod: ModelBuilder.(T) -> Unit,
            walkChildNodes: FrancaTreeWalker.(T) -> Unit
        ) = initTreeNode(clazz, clazz, startMethod, finishMethod, walkChildNodes)

        private fun <T> initTreeNode(
            key: Any,
            clazz: Class<T>,
            startMethod: ModelBuilder.(T) -> Unit,
            finishMethod: ModelBuilder.(T) -> Unit,
            walkChildNodes: FrancaTreeWalker.(T) -> Unit
        ) {
            FRANCA_TREE_STRUCTURE[key] =
                TreeNodeInfo(
                    clazz,
                    startMethod,
                    finishMethod,
                    { (this as FrancaTreeWalker).walkChildNodes(it) }
                )
        }

        @Suppress("UNUSED_PARAMETER")
        private fun noChildNodes(walker: FrancaTreeWalker, element: EObject) {
            // Do nothing
        }
    }
}
