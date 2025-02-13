/*

 *
 */

package com.example.smoke;

import android.support.annotation.NonNull;

public interface ErrorsInterface {
    public static final String ERROR_MESSAGE = "Some error message constant";
    public enum InternalError {
        ERROR_NONE(0),
        ERROR_FATAL(1);
        /**
         * @hidden
         */
        public final int value;

        InternalError(final int value) {
            this.value = value;
        }
    }
    public enum ExternalErrors {
        NONE(0),
        BOOM(1),
        BUST(2);
        /**
         * @hidden
         */
        public final int value;

        ExternalErrors(final int value) {
            this.value = value;
        }
    }
    public static final class InternalException extends Exception {
        /**
         * @hidden
         * @param error The error.
         */
        public InternalException(final ErrorsInterface.InternalError error) {
            super(error.toString());
            this.error = error;
        }

        /**
         * @hidden
         */
        public final ErrorsInterface.InternalError error;
    }
    public static final class ExternalException extends Exception {
        /**
         * @hidden
         * @param error The error.
         */
        public ExternalException(final ErrorsInterface.ExternalErrors error) {
            super(error.toString());
            this.error = error;
        }

        /**
         * @hidden
         */
        public final ErrorsInterface.ExternalErrors error;
    }

    void methodWithErrors() throws ErrorsInterface.InternalException;

    void methodWithExternalErrors() throws ErrorsInterface.ExternalException;

    @NonNull
    String methodWithErrorsAndReturnValue() throws ErrorsInterface.InternalException;

    static void methodWithPayloadError() throws WithPayloadException {
        ErrorsInterfaceImpl.methodWithPayloadError();
    }


    @NonNull
    static String methodWithPayloadErrorAndReturnValue() throws WithPayloadException {
        return ErrorsInterfaceImpl.methodWithPayloadErrorAndReturnValue();
    }

}

