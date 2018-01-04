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

package com.here.android.smoke;

public class Color {
    public long red;
    public long green;
    public long blue;
    public Color() {}
    public Color(long red, long green, long blue) {
        this.red = red;
        this.green = green;
        this.blue = blue;
    }
    public static ColorBuilder builder() {
        return new ColorBuilder();
    }
    public static class ColorBuilder {
        public long red;
        public long green;
        public long blue;
        ColorBuilder() {
        }
        public ColorBuilder red(long red) {
            this.red = red;
            return this;
        }
        public ColorBuilder green(long green) {
            this.green = green;
            return this;
        }
        public ColorBuilder blue(long blue) {
            this.blue = blue;
            return this;
        }
        public Color build() {
            return new Color(red, green, blue);
        }
    }
}