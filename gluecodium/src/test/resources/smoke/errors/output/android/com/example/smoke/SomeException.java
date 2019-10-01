/*
 *
 */
package com.example.smoke;
public final class SomeException extends Exception {
    public SomeException(final SomeTypeCollectionError error) {
        super(Integer.toString(error.value));
        this.error = error;
    }
    public final SomeTypeCollectionError error;
}
