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

import org.eclipse.emf.ecore.EObject
import org.franca.core.franca.FArgument
import org.franca.core.franca.FArrayType
import org.franca.core.franca.FAttribute
import org.franca.core.franca.FConstantDef
import org.franca.core.franca.FEnumerationType
import org.franca.core.franca.FEnumerator
import org.franca.core.franca.FExpression
import org.franca.core.franca.FField
import org.franca.core.franca.FInterface
import org.franca.core.franca.FMapType
import org.franca.core.franca.FMethod
import org.franca.core.franca.FStructType
import org.franca.core.franca.FTypeCollection
import org.franca.core.franca.FTypeDef
import org.franca.core.franca.FTypeRef
import org.franca.core.franca.FTypedElement
import java.util.HashMap
import java.util.function.BiConsumer

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
class FrancaTreeWalker(builders: Collection<ModelBuilder>) :
    GenericTreeWalker<ModelBuilder>(builders, FRANCA_TREE_STRUCTURE) {

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
            HashMap<Any, GenericTreeWalker.TreeNodeInfo<ModelBuilder, *>>()

        init {
            // Regular nodes
            initTreeNode(
                FInterface::class.java,
                BiConsumer(ModelBuilder::startBuilding),
                BiConsumer(ModelBuilder::finishBuilding),
                BiConsumer(FrancaTreeWalker::walkChildNodes)
            )
            initTreeNode(
                FTypeCollection::class.java,
                BiConsumer<ModelBuilder, FTypeCollection>(ModelBuilder::startBuilding),
                BiConsumer(ModelBuilder::finishBuilding),
                BiConsumer(FrancaTreeWalker::walkChildNodes)
            )
            initTreeNode(
                FMethod::class.java,
                BiConsumer(ModelBuilder::finishBuilding),
                BiConsumer(FrancaTreeWalker::walkChildNodes)
            )
            initTreeNode(
                FAttribute::class.java,
                BiConsumer(ModelBuilder::finishBuilding),
                BiConsumer(FrancaTreeWalker::walkChildNodes)
            )
            initTreeNode(
                FConstantDef::class.java,
                BiConsumer(ModelBuilder::finishBuilding),
                BiConsumer(FrancaTreeWalker::walkChildNodes)
            )
            initTreeNode(
                FStructType::class.java,
                BiConsumer(ModelBuilder::finishBuilding),
                BiConsumer(FrancaTreeWalker::walkChildNodes)
            )
            initTreeNode(
                FEnumerationType::class.java,
                BiConsumer(ModelBuilder::finishBuilding),
                BiConsumer(FrancaTreeWalker::walkChildNodes)
            )
            initTreeNode(
                FEnumerator::class.java,
                BiConsumer(ModelBuilder::finishBuilding),
                BiConsumer(FrancaTreeWalker::walkChildNodes)
            )
            initTreeNode(
                FField::class.java,
                BiConsumer(ModelBuilder::finishBuilding),
                BiConsumer(FrancaTreeWalker::walkChildNodes)
            )
            initTreeNode(
                FTypeDef::class.java,
                BiConsumer(ModelBuilder::finishBuilding),
                BiConsumer(FrancaTreeWalker::walkChildNodes)
            )
            initTreeNode(
                FArrayType::class.java,
                BiConsumer(ModelBuilder::finishBuilding),
                BiConsumer(FrancaTreeWalker::walkChildNodes)
            )
            initTreeNode(
                FMapType::class.java,
                BiConsumer(ModelBuilder::finishBuilding),
                BiConsumer(FrancaTreeWalker::walkChildNodes)
            )
            initTreeNode(
                IN_ARG_KEY,
                FArgument::class.java,
                BiConsumer(ModelBuilder::startBuildingInputArgument),
                BiConsumer(ModelBuilder::finishBuildingInputArgument),
                BiConsumer(FrancaTreeWalker::walkChildNodes)
            )
            initTreeNode(
                OUT_ARG_KEY,
                FArgument::class.java,
                BiConsumer(ModelBuilder::startBuildingOutputArgument),
                BiConsumer(ModelBuilder::finishBuildingOutputArgument),
                BiConsumer(FrancaTreeWalker::walkChildNodes)
            )

            // Leaf nodes
            initTreeNode<FExpression>(
                FExpression::class.java,
                BiConsumer(ModelBuilder::finishBuilding),
                BiConsumer(Companion::noChildNodes)
            )
            initTreeNode<FTypeRef>(
                FTypeRef::class.java,
                BiConsumer(ModelBuilder::finishBuilding),
                BiConsumer(Companion::noChildNodes)
            )
        }

        private fun <T : EObject> initTreeNode(
            clazz: Class<T>,
            finishMethod: BiConsumer<ModelBuilder, T>,
            walkChildNodes: BiConsumer<FrancaTreeWalker, T>
        ) = initTreeNode(
                clazz,
                clazz,
                BiConsumer<ModelBuilder, T>(ModelBuilder::startBuilding),
                finishMethod,
                walkChildNodes
            )

        private fun <T : EObject> initTreeNode(
            clazz: Class<T>,
            startMethod: BiConsumer<ModelBuilder, T>,
            finishMethod: BiConsumer<ModelBuilder, T>,
            walkChildNodes: BiConsumer<FrancaTreeWalker, T>
        ) = initTreeNode(clazz, clazz, startMethod, finishMethod, walkChildNodes)

        private fun <T> initTreeNode(
            key: Any,
            clazz: Class<T>,
            startMethod: BiConsumer<ModelBuilder, T>,
            finishMethod: BiConsumer<ModelBuilder, T>,
            walkChildNodes: BiConsumer<FrancaTreeWalker, T>
        ) {
            FRANCA_TREE_STRUCTURE[key] = GenericTreeWalker.TreeNodeInfo(
                clazz,
                startMethod,
                finishMethod,
                BiConsumer { walker, element ->
                    walkChildNodes.accept(walker as FrancaTreeWalker, element)
                })
        }

        @Suppress("UNUSED_PARAMETER")
        private fun noChildNodes(walker: FrancaTreeWalker, element: EObject) {
            // Do nothing
        }
    }
}
