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
package com.example.here.hello.app;

import com.here.android.hello.HelloWorldStaticLogger;
import com.here.android.hello.Rectangle;

public class ParentJavaImplRectangle implements Rectangle {

  public ParentJavaImplRectangle() {}

  public void scale(double scaleFactor) {
    HelloWorldStaticLogger.append(
        "Scaling ParentJavaImplRectangle with factor=" + scaleFactor + "\n");
  }
}
