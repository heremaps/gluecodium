/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
public interface ErrorsInterface {
    public enum InternalError {
        ERROR_NONE(0),
        ERROR_FATAL(1);
        public final int value;
        InternalError(final int value) {
            this.value = value;
        }
    }
    public enum ExternalErrors {
        NONE(0),
        BOOM(1),
        BUST(2);
        public final int value;
        ExternalErrors(final int value) {
            this.value = value;
        }
    }
    public static class InternalErrorException extends Exception {
        InternalErrorException(final ErrorsInterface.InternalError error) {
            super(Integer.toString(error.value));
            this.error = error;
        }
        public final ErrorsInterface.InternalError error;
    }
    public static class ExternalErrorsException extends Exception {
        ExternalErrorsException(final ErrorsInterface.ExternalErrors error) {
            super(Integer.toString(error.value));
            this.error = error;
        }
        public final ErrorsInterface.ExternalErrors error;
    }
    void methodWithErrors() throws ErrorsInterface.InternalErrorException;
    void methodWithExternalErrors() throws ErrorsInterface.ExternalErrorsException;
    String methodWithErrorsAndReturnValue() throws ErrorsInterface.InternalErrorException;
}
