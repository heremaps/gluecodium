/*
 *
 */
package com.example.package;
import android.support.annotation.NonNull;
public final class Types {
    public static final Types.Enum CONST = Types.Enum.NA_N;
    public enum Enum {
        NA_N(0);
        public final int value;
        Enum(final int value) {
            this.value = value;
        }
    }
    public static final class ExceptionException extends Exception {
        public ExceptionException(final Types.Enum error) {
            super(error.toString());
            this.error = error;
        }
        public final Types.Enum error;
    }
    public static final class Struct {
        @NonNull
        public Types.Enum null;
        public Struct() {
            this.null = Types.Enum.NA_N;
        }
    }
}
