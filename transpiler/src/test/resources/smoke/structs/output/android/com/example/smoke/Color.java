/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.smoke;

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