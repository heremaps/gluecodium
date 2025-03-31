/*
 * Copyright (C) 2016-2025 HERE Europe B.V.
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
package com.here.android.test

import com.here.android.RobolectricApplication
import org.junit.runner.RunWith
import org.junit.Assert.assertTrue
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class ListenerInheritanceTest {

    class SomeParentListener : ParentListener {
        var called: Boolean = false

        override fun listen() {
            called = true
        }
    }

    class SomeChildListener : ChildListener {
        var called: Boolean = false

        override fun listen() {
            called = true
        }
    }

    @org.junit.Test
    fun talkToParent() {
        val fakeParentListener = SomeParentListener()
        Talker.talkToParent(fakeParentListener)

        assertTrue(fakeParentListener.called)
    }

    @org.junit.Test
    fun talkToChild() {
        val fakeChildListener = SomeChildListener()
        Talker.talkToChild(fakeChildListener)

        assertTrue(fakeChildListener.called)
    }

    @org.junit.Test
    fun talkToChildAsParent() {
        val fakeChildListener = SomeChildListener()
        Talker.talkToParent(fakeChildListener)

        assertTrue(fakeChildListener.called)
    }

    @org.junit.Test
    fun addRemoveParentListener() {
        val fakeParentListener = SomeParentListener()
        val caster: Broadcaster = Broadcaster()
        caster.addParentListener(fakeParentListener)

        val result: Boolean = caster.removeListener(fakeParentListener)
        assertTrue(result)
    }

    @org.junit.Test
    fun addRemoveChildListener() {
        val fakeChildListener = SomeChildListener()
        val caster: Broadcaster = Broadcaster()
        caster.addChildListener(fakeChildListener)

        val result: Boolean = caster.removeListener(fakeChildListener)
        assertTrue(result)
    }
}