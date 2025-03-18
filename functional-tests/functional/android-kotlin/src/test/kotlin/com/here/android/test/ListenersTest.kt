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
import org.robolectric.RobolectricTestRunner
import org.robolectric.annotation.Config

class MessageListener : StringListener {
    override fun onMessage(message: String) {}
    override fun onConstMessage(message: String) {}
    override fun onStructMessage(message: StringListener.StringStruct) {}
}

@RunWith(RobolectricTestRunner::class)
@Config(application = RobolectricApplication::class)
class ListenersTest {
    @org.junit.Test
    fun stringListenerDoesNotCrash() {
        DummyLogger.relayMessage(MessageListener(), "Hi!")
    }

    @org.junit.Test
    fun stringConstListenerDoesNotCrash() {
        DummyLogger.relayConstMessage(MessageListener(), "Hi!")
    }
}