/*
 *
 */
package com.example.smoke;
public final class WithPayloadException extends Exception {
    public WithPayloadException(final Payload error) {
        super(error.toString());
        this.error = error;
    }
    public final Payload error;
}
