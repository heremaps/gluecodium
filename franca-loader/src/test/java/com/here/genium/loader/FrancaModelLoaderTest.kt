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

import com.here.genium.franca.ModelHelper
import org.franca.core.franca.FInterface
import org.franca.core.franca.FModel
import org.franca.core.franca.FTypeCollection
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertNotSame
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Rule
import org.junit.Test
import org.junit.rules.ExpectedException
import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import java.io.File
import java.net.URISyntaxException
import java.util.Arrays

@RunWith(JUnit4::class)
class FrancaModelLoaderTest {

    @Rule @JvmField val exception = ExpectedException.none()

    private val loader = FrancaModelLoader()

    @Before
    fun setUp() {
        ModelHelper.getFdeplInjector().injectMembers(loader)
    }

    /**
     * The test reproduces bug APIGEN-82. Each fidl got a single fdepl file assigned based on the
     * includes in the fdepl. When two fdepl files included the same fidl, the second one read would
     * replace the first one in the mapping. The test reads two fdepls, the first defines a method
     * const, the second one just includes the fidl. If the mapping would get overridden the method
     * would lose the constness information.
     */
    @Test
    @Throws(URISyntaxException::class)
    fun multipleDeploymentsIncludingSameFidl() {
        val simpleFidl =
            ClassLoader.getSystemClassLoader().getResource("francamodelloadertest/Simple.fidl")
        val simpleFdepl =
            ClassLoader.getSystemClassLoader().getResource("francamodelloadertest/Simple.fdepl")
        // Additional deployment rule also includes Simple.fidl
        // and would replace the information from Simple.fdepl
        val additionalFdepl = ClassLoader.getSystemClassLoader()
            .getResource("francamodelloadertest/DependentOnSimple.fdepl")

        val currentFiles = listOf(
            File(simpleFdepl.toURI()),
            File(simpleFidl.toURI()),
            File(additionalFdepl.toURI())
        )
        val typeCollections = mutableListOf<FTypeCollection>()
        val deploymentModel =
            loader.load(FrancaBasedLimeModelLoader.SPEC_PATH, currentFiles, typeCollections)

        assertEquals(1, typeCollections.size.toLong())
        assertTrue(typeCollections[0] is FInterface)
        val iface = typeCollections[0] as FInterface

        val methods = iface.methods
        assertEquals(1, methods.size.toLong())
        val constMethod = methods[0]

        assertTrue(deploymentModel.isConst(constMethod))
    }

    @Test
    @Throws(URISyntaxException::class)
    fun getDeploymentPropertiesForAlternativeRepresentation() {
        val instanceFidl =
            ClassLoader.getSystemClassLoader().getResource("francamodelloadertest/Instance.fidl")
        val instanceFdepl =
            ClassLoader.getSystemClassLoader().getResource("francamodelloadertest/Instance.fdepl")
        val refersToInstanceFidl = ClassLoader.getSystemClassLoader()
            .getResource("francamodelloadertest/RefersToInstance.fidl")

        val currentFiles = listOf(
            File(instanceFidl.toURI()),
            File(instanceFdepl.toURI()),
            File(refersToInstanceFidl.toURI())
        )
        val typeCollections = mutableListOf<FTypeCollection>()
        val deploymentModel =
            loader.load(FrancaBasedLimeModelLoader.SPEC_PATH, currentFiles, typeCollections)

        assertEquals(2, typeCollections.size.toLong())

        val barInterface = typeCollections[0] as FInterface
        assertEquals("Bar", barInterface.name)

        val factoryInterface = typeCollections[1] as FInterface
        assertEquals("BarFactory", factoryInterface.name)

        val factoryMethod = factoryInterface.methods[0]
        val parameterType = factoryMethod.outArgs[0].type.derived
        assertEquals("Bar", parameterType.name)

        // barInterface and barInterfaceThroughReferrer are two *different* in-memory
        // representations of the same Franca interface.
        val barInterfaceThroughReferrer = parameterType.eContainer() as FInterface
        assertNotSame(barInterfaceThroughReferrer, barInterface)

        // barInterfaceThroughReferrer deployment properties should be, nevertheless, accessible
        // through its cousin's wrapper.
        assertTrue(deploymentModel.isInterface(barInterfaceThroughReferrer))
    }

    @Test
    @Throws(URISyntaxException::class)
    fun getDeploymentPropertiesForSameNameInterfaces() {
        val instanceFidl =
            ClassLoader.getSystemClassLoader().getResource("francamodelloadertest/Instance.fidl")
        val instanceFdepl =
            ClassLoader.getSystemClassLoader().getResource("francamodelloadertest/Instance.fdepl")
        val otherInstanceFidl = ClassLoader.getSystemClassLoader()
            .getResource("francamodelloadertest/OtherInstance.fidl")
        val otherInstanceFdepl = ClassLoader.getSystemClassLoader()
            .getResource("francamodelloadertest/OtherInstance.fdepl")

        val currentFiles = Arrays.asList(
            File(instanceFidl.toURI()),
            File(instanceFdepl.toURI()),
            File(otherInstanceFidl.toURI()),
            File(otherInstanceFdepl.toURI())
        )
        val typeCollections = mutableListOf<FTypeCollection>()
        val deploymentModel =
            loader.load(FrancaBasedLimeModelLoader.SPEC_PATH, currentFiles, typeCollections)

        assertEquals(2, typeCollections.size.toLong())

        val fooBarInterface = typeCollections[0] as FInterface
        assertEquals("Bar", fooBarInterface.name)
        assertEquals("foo", (fooBarInterface.eContainer() as FModel).name)

        val weeBarInterface = typeCollections[1] as FInterface
        assertEquals("Bar", weeBarInterface.name)
        assertEquals("wee", (weeBarInterface.eContainer() as FModel).name)

        assertTrue(deploymentModel.isInterface(fooBarInterface))
        assertFalse(deploymentModel.isInterface(weeBarInterface))
    }
}
