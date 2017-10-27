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

import java.util.List;

public class Arrays {
    public static class SyncResult {
        public long lastUpdatedTimeStamp;
        public long numberOfChanges;
    }
    public static native List<Arrays.SyncResult> explicitArrayMethod(final List<Arrays.SyncResult> input);
    public static native List<Arrays.SyncResult> implicitArrayMethod(final List<Arrays.SyncResult> input);
}