/*
 *
 */
package com.example.smoke;
@OnException
public final class AttributesCrashException extends Exception {
    public AttributesCrashException(final String error) {
        super(error.toString());
        this.error = error;
    }
    public final String error;
}
