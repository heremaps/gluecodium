/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
public class Color {
    public short red;
    public short green;
    public short blue;
    public Color() {
        this((short)0, (short)0, (short)0);
    }
    public Color(short red, short green, short blue) {
        this.red = red;
        this.green = green;
        this.blue = blue;
    }
    public static class Builder {
        private short red = (short)0;
        private short green = (short)0;
        private short blue = (short)0;
        public Builder() {
        }
        public Builder setRed(short red) {
            this.red = red;
            return this;
        }
        public Builder setGreen(short green) {
            this.green = green;
            return this;
        }
        public Builder setBlue(short blue) {
            this.blue = blue;
            return this;
        }
        public Color build() {
            return new Color(red, green, blue);
        }
    }
}
