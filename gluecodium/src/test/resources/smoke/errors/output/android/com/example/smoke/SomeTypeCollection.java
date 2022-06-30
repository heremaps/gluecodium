/*
 *
 */
package com.example.smoke;
public final class SomeTypeCollection {
    public enum SomeTypeCollectionError {
        ERROR_A(0),
        ERROR_B(1);
        public final int value;
        SomeTypeCollectionError(final int value) {
            this.value = value;
        }
    }
    public static final class SomeException extends Exception {
        public SomeException(final SomeTypeCollection.SomeTypeCollectionError error) {
            super(error.toString());
            this.error = error;
        }
        public final SomeTypeCollection.SomeTypeCollectionError error;
    }
}
