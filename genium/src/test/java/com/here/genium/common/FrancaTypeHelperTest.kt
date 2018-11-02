/*
 * Copyright (C) 2016-2018 HERE Europe B.V.
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

package com.here.genium.common

import junit.framework.TestCase.assertEquals
import junit.framework.TestCase.assertFalse
import junit.framework.TestCase.assertTrue
import org.mockito.Mockito.mock
import org.mockito.Mockito.verify
import org.mockito.Mockito.`when`

import org.eclipse.emf.ecore.EObject
import org.franca.core.franca.FInterface
import org.franca.core.franca.FType
import org.franca.core.franca.FTypeRef
import org.franca.core.franca.FTypedElement
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.junit.runners.JUnit4
import org.mockito.Mock
import org.mockito.MockitoAnnotations

@RunWith(JUnit4::class)
class FrancaTypeHelperTest {
    @Mock
    private val typeRef: FTypeRef? = null
    @Mock
    private val typedElement: FTypedElement? = null
    @Mock
    private val type: FType? = null
    @Mock
    private val francaInterface: FInterface? = null

    @Before
    fun beforeMocks() = MockitoAnnotations.initMocks(this)

    @Test
    fun nonTypedElement() {
        `when`(typeRef!!.eContainer()).thenReturn(mock(EObject::class.java))

        assertFalse(FrancaTypeHelper.isImplicitArray(typeRef))

        verify(typeRef).eContainer()
    }

    @Test
    fun nonImplicitArrayTypedElement() {
        `when`(typeRef!!.eContainer()).thenReturn(typedElement)
        `when`(typedElement!!.isArray).thenReturn(false)

        assertFalse(FrancaTypeHelper.isImplicitArray(typeRef))

        verify(typeRef).eContainer()
        verify(typedElement).isArray
    }

    @Test
    fun implicitArrayTypedElement() {
        `when`(typeRef!!.eContainer()).thenReturn(typedElement)
        `when`(typedElement!!.isArray).thenReturn(true)

        assertTrue(FrancaTypeHelper.isImplicitArray(typeRef))

        verify(typeRef).eContainer()
        verify(typedElement).isArray
    }

    @Test
    fun namespaceContainer() {
        `when`(type!!.eContainer()).thenReturn(francaInterface)
        `when`(francaInterface!!.name).thenReturn("testBase")

        val namespace = FrancaTypeHelper.getNamespace(type)
        assertEquals("testBase", namespace)

        verify(type).eContainer()
    }
}
