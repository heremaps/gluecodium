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
package com.here.android;

import android.annotation.SuppressLint;
import android.app.Application;
import android.util.Log;
import com.here.android.lorem.ipsum.NativeBase;
import com.here.gluecodium.test.functional.BuildConfig;
import java.io.File;
import java.io.FilenameFilter;
import org.powermock.reflect.Whitebox;
import org.robolectric.shadows.ShadowLog;

/**
 * Custom {@link Application} class to load x86_64 shared libraries at runtime.
 *
 * <p>Allows to run tests containing native code on the host JVM with Robolectric.
 */
public final class RobolectricApplication extends Application {
  private static final String TAG = RobolectricApplication.class.getSimpleName();
  private static final FilenameFilter SHARED_LIBRARY_FILENAME_FILTER =
      (dir, name) -> name.contains(".so") || name.endsWith(".dylib");
  private static boolean isFirstTime = true;

  static {
    ShadowLog.stream = System.out; // Android logcat output.
  }

  @Override
  public void onCreate() {
    super.onCreate();

    if (isFirstTime) {
      isFirstTime = false; // Only load libraries once
      loadNativeLibraries();
      Runtime.getRuntime()
          .addShutdownHook(
              new Thread() {
                @Override
                public void run() {
                  try {
                    Whitebox.invokeMethod(NativeBase.class, "cleanUpQueue");
                  } catch (Exception e) {
                    e.printStackTrace();
                  }
                }
              });
    }
  }

  /**
   * Separate method to load libraries in case you want to subclass and can't load in onCreate().
   */
  @SuppressLint("UnsafeDynamicallyLoadedCode")
  private void loadNativeLibraries() {
    File appLibraryPath = new File(BuildConfig.NATIVE_LIB_HOST_DIR);

    Log.d(TAG, "loadNativeLibraries: Using app library path: " + appLibraryPath);
    for (File sharedObject : appLibraryPath.listFiles(SHARED_LIBRARY_FILENAME_FILTER)) {
      Log.i(TAG, "loadNativeLibraries: Loading app library '" + sharedObject.getName() + "'...");
      System.load(sharedObject.getAbsolutePath());
    }
  }
}
