/*
 *

 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
import java.util.List;
import java.util.Map;
import java.util.Set;
public final class GenericTypesWithCompoundTypes extends NativeBase {
    public enum SomeEnum {
        FOO(0),
        BAR(1);
        public final int value;
        SomeEnum(final int value) {
            this.value = value;
        }
    }
    public enum ExternalEnum {
        ON(0),
        OFF(1);
        public final int value;
        ExternalEnum(final int value) {
            this.value = value;
        }
    }
    public static final class BasicStruct {
        public double value;
        public BasicStruct(final double value) {
            this.value = value;
        }
    }
    public static final class ExternalStruct {
        @NonNull
        public String string;
        public ExternalStruct(@NonNull final String string) {
            this.string = string;
        }
    }
    /**
     * For internal use only.
     * @hidden
     */
    protected GenericTypesWithCompoundTypes(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public native List<GenericTypesWithCompoundTypes.ExternalStruct> methodWithStructList(@NonNull final List<GenericTypesWithCompoundTypes.BasicStruct> input);
    @NonNull
    public native Map<String, GenericTypesWithCompoundTypes.ExternalStruct> methodWithStructMap(@NonNull final Map<String, GenericTypesWithCompoundTypes.BasicStruct> input);
    @NonNull
    public native List<GenericTypesWithCompoundTypes.ExternalEnum> methodWithEnumList(@NonNull final List<GenericTypesWithCompoundTypes.SomeEnum> input);
    @NonNull
    public native Map<GenericTypesWithCompoundTypes.ExternalEnum, Boolean> methodWithEnumMapKey(@NonNull final Map<GenericTypesWithCompoundTypes.SomeEnum, Boolean> input);
    @NonNull
    public native Map<Integer, GenericTypesWithCompoundTypes.ExternalEnum> methodWithEnumMapValue(@NonNull final Map<Integer, GenericTypesWithCompoundTypes.SomeEnum> input);
    @NonNull
    public native Set<GenericTypesWithCompoundTypes.ExternalEnum> methodWithEnumSet(@NonNull final Set<GenericTypesWithCompoundTypes.SomeEnum> input);
    @NonNull
    public native List<DummyInterface> methodWithInstancesList(@NonNull final List<DummyClass> input);
    @NonNull
    public native Map<Integer, DummyInterface> methodWithInstancesMap(@NonNull final Map<Integer, DummyClass> input);
}
