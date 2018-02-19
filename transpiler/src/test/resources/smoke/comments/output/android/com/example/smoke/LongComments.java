/*
 * Copyright (C) 2018 HERE Global B.V. and/or its affiliated companies. All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import com.example.NativeBase;
/**
 * This is some very useful interface. There is a lot to say about this interface. at least it has a long comment.
 */
public class LongComments extends NativeBase {
    /** For internal use only */
    protected LongComments(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    /**
     * This is very important method. It has very important parameters. It has side effects.
     * @param input Very useful input parameter. You must not confuse it with the second parameter. But they are similar.
     * @param ratio Not as useful as the first parameter. But still useful. use a positive value for more happiness.
     * @return If you provide a useful input and a useful ratio you can expect a useful output. Just kidding do not expect anything from a method until you see its body.
     */
    public native float someMethodWithLongComment(final String input, final double ratio);
}