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
    public final static class InternalException extends Exception {
        public InternalException(final ErrorsInterface.InternalError error) {
            super(error.toString());
            this.error = error;
        }
        public final ErrorsInterface.InternalError error;
    }
    public final static class ExternalException extends Exception {
        public ExternalException(final ErrorsInterface.ExternalErrors error) {
            super(error.toString());
            this.error = error;
        }
        public final ErrorsInterface.ExternalErrors error;
    }
    void methodWithErrors() throws ErrorsInterface.InternalException;
    void methodWithExternalErrors() throws ErrorsInterface.ExternalException;
    @NonNull
    String methodWithErrorsAndReturnValue() throws ErrorsInterface.InternalException;
    static void methodWithPayloadError() throws WithPayloadException;
    @NonNull
    static String methodWithPayloadErrorAndReturnValue() throws WithPayloadException;
}
