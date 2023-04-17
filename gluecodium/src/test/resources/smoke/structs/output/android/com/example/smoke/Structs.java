/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.NativeBase;
import java.util.List;
public final class Structs extends NativeBase {
    public enum FooBar {
        FOO(0),
        BAR(1);
        public final int value;
        FooBar(final int value) {
            this.value = value;
        }
    }
    public static final class Point {
        public double x;
        public double y;
        public Point(final double x, final double y) {
            this.x = x;
            this.y = y;
        }
    }
    public static final class Line {
        @NonNull
        public Structs.Point a;
        @NonNull
        public Structs.Point b;
        public Line(@NonNull final Structs.Point a, @NonNull final Structs.Point b) {
            this.a = a;
            this.b = b;
        }
    }
    public static final class AllTypesStruct {
        public final byte int8Field;
        public final short uint8Field;
        public final short int16Field;
        public final int uint16Field;
        public final int int32Field;
        public final long uint32Field;
        public final long int64Field;
        public final long uint64Field;
        public final float floatField;
        public final double doubleField;
        @NonNull
        public final String stringField;
        public final boolean booleanField;
        @NonNull
        public final byte[] bytesField;
        @NonNull
        public final Structs.Point pointField;
        public AllTypesStruct(final byte int8Field, final short uint8Field, final short int16Field, final int uint16Field, final int int32Field, final long uint32Field, final long int64Field, final long uint64Field, final float floatField, final double doubleField, @NonNull final String stringField, final boolean booleanField, @NonNull final byte[] bytesField, @NonNull final Structs.Point pointField) {
            this.int8Field = int8Field;
            this.uint8Field = uint8Field;
            this.int16Field = int16Field;
            this.uint16Field = uint16Field;
            this.int32Field = int32Field;
            this.uint32Field = uint32Field;
            this.int64Field = int64Field;
            this.uint64Field = uint64Field;
            this.floatField = floatField;
            this.doubleField = doubleField;
            this.stringField = stringField;
            this.booleanField = booleanField;
            this.bytesField = bytesField;
            this.pointField = pointField;
        }
    }
    public static final class NestingImmutableStruct {
        @NonNull
        public Structs.AllTypesStruct structField;
        public NestingImmutableStruct(@NonNull final Structs.AllTypesStruct structField) {
            this.structField = structField;
        }
    }
    public static final class DoubleNestingImmutableStruct {
        @NonNull
        public Structs.NestingImmutableStruct nestingStructField;
        public DoubleNestingImmutableStruct(@NonNull final Structs.NestingImmutableStruct nestingStructField) {
            this.nestingStructField = nestingStructField;
        }
    }
    public static final class StructWithArrayOfImmutable {
        @NonNull
        public List<Structs.AllTypesStruct> arrayField;
        public StructWithArrayOfImmutable(@NonNull final List<Structs.AllTypesStruct> arrayField) {
            this.arrayField = arrayField;
        }
    }
    public static final class ImmutableStructWithCppAccessors {
        @NonNull
        public final String stringField;
        public ImmutableStructWithCppAccessors(@NonNull final String stringField) {
            this.stringField = stringField;
        }
    }
    public static final class MutableStructWithCppAccessors {
        @NonNull
        public String stringField;
        public MutableStructWithCppAccessors(@NonNull final String stringField) {
            this.stringField = stringField;
        }
    }
    /**
     * For internal use only.
     * @hidden
     */
    protected Structs(final long nativeHandle, final Object dummy) {
        super(nativeHandle, new Disposer() {
            @Override
            public void disposeNative(long handle) {
                disposeNativeHandle(handle);
            }
        });
    }
    private static native void disposeNativeHandle(long nativeHandle);
    @NonNull
    public static native Structs.Point swapPointCoordinates(@NonNull final Structs.Point input);
    @NonNull
    public static native Structs.AllTypesStruct returnAllTypesStruct(@NonNull final Structs.AllTypesStruct input);
    @NonNull
    public static native TypeCollection.Point createPoint(final double x, final double y);
    @NonNull
    public static native TypeCollection.AllTypesStruct modifyAllTypesStruct(@NonNull final TypeCollection.AllTypesStruct input);
}
