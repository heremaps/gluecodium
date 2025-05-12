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

package com.here.android

import android.annotation.SuppressLint
import android.app.Application
import android.util.Log
import com.here.android.lorem.ipsum.NativeBase
import com.here.gluecodium.test.functional.BuildConfig
import org.powermock.reflect.Whitebox
import org.robolectric.shadows.ShadowLog
import java.io.File

class RobolectricApplication : Application() {
    private val TAG: String = RobolectricApplication::class.java.getSimpleName()

    override fun onCreate() {
        super.onCreate()

        if (isFirstTime) {
            isFirstTime = false

            loadNativeLibraries();
            Runtime.getRuntime().addShutdownHook(Thread{
                try {
                    Whitebox.invokeMethod(NativeBase::class.java, "cleanUpQueue")
                } catch (e: Exception) {
                    e.printStackTrace()
                }
            })
        }
    }

    /**
     * Separate method to load libraries in case you want to subclass and can't load in onCreate().
     */
    @SuppressLint("UnsafeDynamicallyLoadedCode")
    private fun loadNativeLibraries() {
        val appLibraryPath: java.io.File = java.io.File(BuildConfig.NATIVE_LIB_HOST_DIR)

        Log.d(TAG, "loadNativeLibraries: Using app library path: " + appLibraryPath)

        val files = appLibraryPath.listFiles {
            _, name -> name.contains(".so") || name.endsWith(".dylib")
        }

        if (files == null) {
            throw NullPointerException("loadNativeLibraries: files array is null")
        }

        for (sharedObject in files)  {
            Log.i(TAG, "loadNativeLibraries: Loading app library '" + sharedObject.getName() + "'...")
            System.load(sharedObject.getAbsolutePath())
        }
    }

    companion object {
        private var isFirstTime: Boolean = true

        init {
            ShadowLog.stream = System.out // Android logcat output.
        }
    }
}