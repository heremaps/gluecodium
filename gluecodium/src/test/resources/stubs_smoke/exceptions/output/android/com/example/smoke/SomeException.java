/*
 *
 */
package com.example.smoke;
public class SomeException extends Exception {
    public SomeException(final boolean error) {
        super(error.toString());
        this.error = error;
    }
    public boolean error;
}
