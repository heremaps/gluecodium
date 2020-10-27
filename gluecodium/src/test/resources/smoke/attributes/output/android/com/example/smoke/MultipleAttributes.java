/*
 *
 */
package com.example.smoke;
import com.example.NativeBase;
public final class MultipleAttributes extends NativeBase {
    /**
     * For internal use only.
     * @exclude
     */
    protected MultipleAttributes(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @Foo
    @Bar
    public native void noLists2();
    @Foo
    @Bar
    @Baz
    public native void noLists3();
    @Foo
    @Bar
    @Baz
    public native void listFirst();
    @Foo
    @Bar
    @Baz
    public native void listSecond();
    @Foo
    @Bar
    @Baz
    @Fizz
    public native void twoLists();
}
