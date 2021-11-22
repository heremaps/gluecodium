/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
public final class LevelOne extends NativeBase {
    public static final class LevelTwo extends NativeBase {
        public static final class LevelThree extends NativeBase {
            public enum LevelFourEnum {
                NONE(0);
                public final int value;
                LevelFourEnum(final int value) {
                    this.value = value;
                }
            }
            public static final class LevelFour {
                public static final boolean FOO = false;
                @NonNull
                public String stringField;
                public LevelFour(@NonNull final String stringField) {
                    this.stringField = stringField;
                }
                @NonNull
                public static native LevelOne.LevelTwo.LevelThree.LevelFour fooFactory();
            }
            /**
             * For internal use only.
             * @hidden
             */
            protected LevelThree(final long nativeHandle, final Object dummy) {
                super(nativeHandle, new Disposer() {
                    @Override
                    public void disposeNative(long handle) {
                        disposeNativeHandle(handle);
                    }
                });
            }
            private static native void disposeNativeHandle(long nativeHandle);
            @NonNull
            public native OuterInterface.InnerClass foo(@NonNull final OuterClass.InnerInterface input);
        }
        /**
         * For internal use only.
         * @hidden
         */
        protected LevelTwo(final long nativeHandle, final Object dummy) {
            super(nativeHandle, new Disposer() {
                @Override
                public void disposeNative(long handle) {
                    disposeNativeHandle(handle);
                }
            });
        }
        private static native void disposeNativeHandle(long nativeHandle);
    }
    /**
     * For internal use only.
     * @hidden
     */
    protected LevelOne(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
}
