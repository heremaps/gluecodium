/*
 * Copyright (C) 2017 HERE Global B.V. and its affiliate(s). All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 */

package com.here.ivi.api.platform.android;

import com.here.ivi.api.cli.OptionReader;
import com.here.ivi.api.generator.androidmanifest.AndroidManifestGenerator;
import com.here.ivi.api.generator.jni.JniGenerator;
import com.here.ivi.api.model.java.*;
import java.util.*;

/**
 * Combines generators {@link AndroidManifestGenerator}, {@link JniGenerator} and {@link
 * JavaGenerator} to generate Java code and bindings to BaseAPI layer for Android.
 */
public final class AndroidGeneratorSuite extends JavaGeneratorSuite {

  public static final String GENERATOR_NAME = "android";

  public AndroidGeneratorSuite(final OptionReader.TranspilerOptions transpilerOptions) {
    super(transpilerOptions, true);
  }

  @Override
  public String getName() {
    return "com.here.AndroidGeneratorSuite";
  }

  @Override
  protected String getGeneratorName() {
    return GENERATOR_NAME;
  }
}
