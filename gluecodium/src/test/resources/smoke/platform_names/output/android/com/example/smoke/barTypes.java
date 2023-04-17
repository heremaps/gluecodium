/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class barTypes {
    public enum barEnum {
        bar_item(0);
        public final int value;
        barEnum(final int value) {
            this.value = value;
        }
    }
    public static final class barStruct {
        @NonNull
        public String BAR_FIELD;
        public barStruct(@NonNull final String BarParameter) {
            barStruct _other = BarCreate(BarParameter);
            this.BAR_FIELD = _other.BAR_FIELD;
        }
        private static native barStruct BarCreate(@NonNull final String BarParameter);
    }
}
