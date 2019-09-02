/*
 *

 */
package com.example.smoke;
public final class FreeEnumException extends Exception {
    public FreeEnumException(final FreeEnum error) {
        super(Integer.toString(error.value));
        this.error = error;
    }
    public final FreeEnum error;
}
