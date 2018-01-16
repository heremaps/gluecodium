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
package com.example.here.hello.utils;

import static android.content.Context.INPUT_METHOD_SERVICE;

import android.content.Context;
import android.os.IBinder;
import android.view.inputmethod.InputMethodManager;

public final class InputMethodHelper {
  private InputMethodHelper() {}

  public static void hideSoftKeyboard(final Context context, final IBinder windowToken) {
    InputMethodManager imm = (InputMethodManager) context.getSystemService(INPUT_METHOD_SERVICE);
    if (imm != null) {
      imm.hideSoftInputFromWindow(windowToken, 0);
    }
  }
}
