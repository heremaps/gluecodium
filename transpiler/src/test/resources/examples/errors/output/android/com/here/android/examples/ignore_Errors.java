/*
 * Copyright (C) 2017 HERE Global B.V. and/or its affiliated companies. All rights reserved.
 *
 * This software, including documentation, is protected by copyright controlled by
 * HERE Global B.V. All rights are reserved. Copying, including reproducing, storing,
 * adapting or translating, any or all of this material requires the prior written
 * consent of HERE Global B.V. This material also contains confidential information,
 * which may not be disclosed to others without prior written consent of HERE Global B.V.
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.here.android.examples;

public class Errors {
    public enum InternalErrors {
        NONE(0),
        CRASHED(1),
        EXPLODED(2);

        public final int value;

        InternalErrors(final int value) {
            this.value = value;
        }
    }

    public static class InternalErrorsException extends Exception {
        public InternalErrorsException(final InternalErrors error) {
            super(Integer.toString(error.value));
            this.error = error;
        }
        public final InternalErrors error;
    }

    public static native void startSomethingOrFail() throws InternalErrorsException;

    public static native String getSomethingOrFail() throws CoreException;
}
