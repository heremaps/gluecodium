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

package com.here.ivi.api.generator.android;

import com.here.ivi.api.model.javamodel.JavaPackage;
import java.util.List;

public abstract class AbstractAndroidGenerator {

  protected final JavaPackage basePackage;

  protected AbstractAndroidGenerator(final List<String> packageList) {
    this.basePackage =
        packageList == null || packageList.isEmpty()
            ? JavaPackage.DEFAULT
            : new JavaPackage(packageList);
  }
}
