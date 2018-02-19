/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */

package com.example.examples;


public class InternalErrorsException extends Exception {
    public InternalErrorsException(final Errors.InternalErrors error) {
        super(Integer.toString(error.value));
        this.error = error;
    }
    public final Errors.InternalErrors error;
}
