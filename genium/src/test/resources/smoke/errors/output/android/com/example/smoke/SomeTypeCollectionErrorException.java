/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
public class SomeTypeCollectionErrorException extends Exception {
    public SomeTypeCollectionErrorException(final SomeTypeCollectionError error) {
        super(Integer.toString(error.value));
        this.error = error;
    }
    public final SomeTypeCollectionError error;
}