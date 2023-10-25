/*

 *
 */

package com.example.smoke;


public final class WithPayloadException extends Exception {
    /**
     * @hidden
     * @param error The error.
     */
    public WithPayloadException(final Payload error) {
        super(error.toString());
        this.error = error;
    }

    /**
     * @hidden
     */
    public final Payload error;
}
