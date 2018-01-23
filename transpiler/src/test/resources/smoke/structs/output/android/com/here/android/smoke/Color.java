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
    public static class Builder {
        private long red;
        private long green;
        private long blue;
        public Builder() {
        }
        public Builder setRed(long red) {
            this.red = red;
            return this;
        }
        public Builder setGreen(long green) {
            this.green = green;
            return this;
        }
        public Builder setBlue(long blue) {
            this.blue = blue;
            return this;
        }
        public Color build() {
            return new Color(red, green, blue);
        }
    }
}