/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
public class FreeEnumException extends Exception {
    public FreeEnumException(final FreeEnum error) {
        super(Integer.toString(error.value));
        this.error = error;
    }
    public final FreeEnum error;
}
