/*
 *

 */
package com.example.smoke;
public final class SomeTypeCollectionErrorException extends Exception {
    public SomeTypeCollectionErrorException(final SomeTypeCollectionError error) {
        super(Integer.toString(error.value));
        this.error = error;
    }
    public final SomeTypeCollectionError error;
}