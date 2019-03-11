/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
import com.example.NativeBase;
public class StructsInheritance extends NativeBase {
    public static class ColoredLineInherited extends Structs.Line {
        public Color color = new Color();
        public ColoredLineInherited() {}
        public ColoredLineInherited(Structs.Point a, Structs.Point b, Color color) {
            super(a, b);
            this.color = color;
        }
        public static class Builder {
            private Structs.Point a = new Structs.Point();
            private Structs.Point b = new Structs.Point();
            private Color color = new Color();
            public Builder() {
            }
            public Builder setA(Structs.Point a) {
                this.a = a;
                return this;
            }
            public Builder setB(Structs.Point b) {
                this.b = b;
                return this;
            }
            public Builder setColor(Color color) {
                this.color = color;
                return this;
            }
            public ColoredLineInherited build() {
                return new ColoredLineInherited(a, b, color);
            }
        }
    }
    /** For internal use only */
    protected StructsInheritance(final long nativeHandle) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    public static native StructsInheritance.ColoredLineInherited methodWithInheritedType(final StructsInheritance.ColoredLineInherited input);
}