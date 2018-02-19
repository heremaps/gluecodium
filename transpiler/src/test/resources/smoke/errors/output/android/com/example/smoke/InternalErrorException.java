/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.smoke;


public class InternalErrorException extends Exception {
    public InternalErrorException(final Errors.InternalError error) {
        super(Integer.toString(error.value));
        this.error = error;
    }
    public final Errors.InternalError error;
}
