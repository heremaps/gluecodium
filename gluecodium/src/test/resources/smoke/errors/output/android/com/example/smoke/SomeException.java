/*
 *
 */
package com.example.smoke;
public final class SomeException extends Exception {
    public SomeException(final SomeTypeCollectionError error) {
        super(error.toString());
        this.error = error;
    }
    public final SomeTypeCollectionError error;
}
