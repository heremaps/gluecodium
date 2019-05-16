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

import com.here.genium.franca.FrancaDeploymentModel
import com.here.genium.franca.ModelHelper
import com.here.genium.model.lime.LimeContainer
import com.here.genium.model.lime.LimeModel
import com.here.genium.model.lime.LimeModelLoader
import com.here.genium.validator.CompanionValidator
import com.here.genium.validator.ConstructorsValidatorPredicate
import com.here.genium.validator.DefaultsValidatorPredicate
import com.here.genium.validator.EquatableValidatorPredicate
import com.here.genium.validator.ErrorEnumsValidatorPredicate
import com.here.genium.validator.ExpressionValidatorPredicate
import com.here.genium.validator.ExternalElementsValidatorPredicate
import com.here.genium.validator.ExternalTypesValidatorPredicate
import com.here.genium.validator.FrancaModelValidator
import com.here.genium.validator.FrancaResourcesValidator
import com.here.genium.validator.InheritanceValidatorPredicate
import com.here.genium.validator.IntegerIntervalValidatorPredicate
import com.here.genium.validator.MapKeyValidatorPredicate
import com.here.genium.validator.NameValidator
import com.here.genium.validator.SerializationValidatorPredicate
import com.here.genium.validator.StaticAttributesValidatorPredicate
import com.here.genium.validator.StaticMethodsValidatorPredicate
import com.here.genium.validator.StructInheritanceValidatorPredicate
import com.here.genium.validator.UnionsValidatorPredicate
import com.here.genium.validator.visibility.ArrayVisibilityValidatorPredicate
import com.here.genium.validator.visibility.AttributeVisibilityValidatorPredicate
import com.here.genium.validator.visibility.FieldVisibilityValidatorPredicate
import com.here.genium.validator.visibility.InheritanceVisibilityValidatorPredicate
import com.here.genium.validator.visibility.InterfaceMethodVisibilityValidatorPredicate
import com.here.genium.validator.visibility.MethodVisibilityValidatorPredicate
import org.franca.core.franca.FTypeCollection
import java.io.File

internal object FrancaBasedLimeModelLoader : LimeModelLoader {
    const val SPEC_PATH = "classpath:/GeniumExtensions.fdepl"

    private val francaModelLoader: FrancaModelLoader
        get() {
            val francaModelLoader = FrancaModelLoader()
            ModelHelper.getFdeplInjector().injectMembers(francaModelLoader)
            return francaModelLoader
        }

    private class FrancaModel(
        val deploymentModel: FrancaDeploymentModel,
        val typeCollections: List<FTypeCollection>
    )

    override fun loadModel(fileNames: List<String>): LimeModel {
        val francaModel = loadFrancaModel(fileNames)

        val limeReferenceResolver = LimeReferenceResolver()
        val companionHelper =
            FrancaCompanionHelper(francaModel.typeCollections, francaModel.deploymentModel)
        val limeModelBuilder =
            LimeModelBuilder(francaModel.deploymentModel, limeReferenceResolver, companionHelper)

        val filteredTypeCollections =
            francaModel.typeCollections - companionHelper.getAllCompanions()
        val francaTreeWalker = FrancaTreeWalker(listOf(limeModelBuilder), companionHelper)
        val limeContainers = filteredTypeCollections.map {
            francaTreeWalker.walkTree(it)
            limeModelBuilder.getFinalResult(LimeContainer::class.java)
        }

        return LimeModel(limeReferenceResolver.referenceMap, limeContainers)
    }

    private fun loadFrancaModel(fileNames: List<String>): FrancaModel {
        val inputFiles =
            FrancaModelLoader.listFilesRecursively(fileNames.map { File(it) })

        val filesValidationResult = FrancaResourcesValidator.validate(
            this.francaModelLoader.resourceSetProvider.get(),
            inputFiles
        )
        if (!filesValidationResult) {
            throw FrancaLoadingException("Validation of Franca files Failed")
        }

        val typeCollections = mutableListOf<FTypeCollection>()
        val deploymentModel =
            this.francaModelLoader.load(SPEC_PATH, inputFiles, typeCollections)
        val modelValidationResult = validateFrancaModel(deploymentModel, typeCollections)
        if (!modelValidationResult) {
            throw FrancaLoadingException("Validation of Franca model Failed")
        }

        return FrancaModel(deploymentModel, typeCollections)
    }

    /**
     * Uses the internal validators to validate the model.
     *
     * @return boolean True if the model is valid, false otherwise.
     */
    private fun validateFrancaModel(
        deploymentModel: FrancaDeploymentModel,
        typeCollections: List<FTypeCollection>
    ) = NameValidator.validate(typeCollections) &&
            CompanionValidator.validate(deploymentModel, typeCollections) &&
            FrancaModelValidator(listOf(
                DefaultsValidatorPredicate(),
                ExpressionValidatorPredicate(),
                MapKeyValidatorPredicate(),
                IntegerIntervalValidatorPredicate(),
                StaticMethodsValidatorPredicate(),
                StaticAttributesValidatorPredicate(),
                ErrorEnumsValidatorPredicate(),
                InheritanceValidatorPredicate(),
                UnionsValidatorPredicate(),
                SerializationValidatorPredicate(),
                EquatableValidatorPredicate(),
                InheritanceVisibilityValidatorPredicate(),
                AttributeVisibilityValidatorPredicate(),
                MethodVisibilityValidatorPredicate(),
                FieldVisibilityValidatorPredicate(),
                ArrayVisibilityValidatorPredicate(),
                ExternalElementsValidatorPredicate(),
                ExternalTypesValidatorPredicate(),
                StructInheritanceValidatorPredicate(),
                ConstructorsValidatorPredicate(),
                InterfaceMethodVisibilityValidatorPredicate()
            )).validate(deploymentModel, typeCollections)
}

fun LimeModelLoader.Companion.getLoader(): LimeModelLoader = FrancaBasedLimeModelLoader
