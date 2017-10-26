package com.example.here.hello.utils;

import android.content.Context;
import android.os.IBinder;
import android.view.inputmethod.InputMethodManager;

import static android.content.Context.INPUT_METHOD_SERVICE;

public final class InputMethodHelper {
    private InputMethodHelper() {}

    public static void hideSoftKeyboard(final Context context, final IBinder windowToken) {
        InputMethodManager imm = (InputMethodManager) context.getSystemService(INPUT_METHOD_SERVICE);
        if (imm != null) {
            imm.hideSoftInputFromWindow(windowToken, 0);
        }
    }
}
