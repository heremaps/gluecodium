/*

 *
 */

package com.example.smoke;


@OnException
public final class AttributesCrashException extends Exception {
    /**
     * @hidden
     * @param error The error.
     */
    public AttributesCrashException(final String error) {
        super(error.toString());
        this.error = error;
    }

    /**
     * @hidden
     */
    public final String error;
}
