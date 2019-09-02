/*
 *

 */
package com.example.smoke;
import android.support.annotation.NonNull;
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
    public final static class InternalErrorException extends Exception {
        public InternalErrorException(final ErrorsInterface.InternalError error) {
            super(Integer.toString(error.value));
            this.error = error;
        }
        public final ErrorsInterface.InternalError error;
    }
    public final static class ExternalErrorsException extends Exception {
        public ExternalErrorsException(final ErrorsInterface.ExternalErrors error) {
            super(Integer.toString(error.value));
            this.error = error;
        }
        public final ErrorsInterface.ExternalErrors error;
    }
    void methodWithErrors() throws ErrorsInterface.InternalErrorException;
    void methodWithExternalErrors() throws ErrorsInterface.ExternalErrorsException;
    @NonNull
    String methodWithErrorsAndReturnValue() throws ErrorsInterface.InternalErrorException;
}