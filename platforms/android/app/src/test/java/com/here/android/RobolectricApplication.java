/*
 * Copyright (C) 2018 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */
package com.here.android;

import android.annotation.SuppressLint;
import android.app.Application;
import android.util.Log;
import java.io.File;
import java.io.FilenameFilter;
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
  private static final String LOCAL_PROPERTIES_FILE = "local.properties";
  private static final FilenameFilter LOCAL_PROPERTIES_FILENAME_FILTER =
      (dir, name) -> name.equals(LOCAL_PROPERTIES_FILE);
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
    }
  }

  /**
   * Separate method to load libraries in case you want to subclass and can't load in onCreate().
   */
  @SuppressLint("UnsafeDynamicallyLoadedCode")
  private void loadNativeLibraries() {
    String appArchPath; // Where to find app and NDK shared objects (last path component)
    String systemArch = System.getProperty("os.arch"); // See http://lopica.sourceforge.net/os.html
    if (systemArch.equals("amd64") || systemArch.equals("x86_64")) {
      appArchPath = "x86_64";
    } else { // x86, i386, i686
      appArchPath = "x86";
    }

    File currentWorkingDirAbsolute = new File("").getAbsoluteFile();
    if (currentWorkingDirAbsolute.listFiles(LOCAL_PROPERTIES_FILENAME_FILTER).length == 0) {
      // We didn't find local.properties and are likely in the Gradle module path. We should
      // find the project root one level up...
      currentWorkingDirAbsolute = currentWorkingDirAbsolute.getParentFile();
    }

    // Load application shared libraries (found in app/libs or AARs included via compile(...))
    File appLibraryPath =
        new File(
            currentWorkingDirAbsolute
                + File.separator
                + "app"
                + File.separator
                + "libs"
                + File.separator
                + "host-"
                + appArchPath);

    Log.d(TAG, "loadNativeLibraries: Using app library path: " + appLibraryPath);
    for (File sharedObject : appLibraryPath.listFiles(SHARED_LIBRARY_FILENAME_FILTER)) {
      Log.i(TAG, "loadNativeLibraries: Loading app library '" + sharedObject.getName() + "'...");
      System.load(sharedObject.getAbsolutePath());
    }
  }
}
