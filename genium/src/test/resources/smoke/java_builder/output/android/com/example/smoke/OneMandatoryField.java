/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
public class OneMandatoryField {
    public int mandatory;
    public OneMandatoryField(final int mandatory) {
        this.mandatory = mandatory;
    }
    /**
     * Allows to construct a new OneMandatoryField instance by calling the following setters for mandatory fields in the
     * following order before {@link FinalBuilder#build build} can be called:
     * <pre>
     *
     * OneMandatoryField instance = new OneMandatoryField.Builder()
     *     .setMandatory(mandatory)
     *     .build();
     * </pre>
     */
    public static class Builder {
        private int mandatory = 0;
        public Builder() { }
        /**
         * Sets mandatory.
         */
        public FinalBuilder setMandatory(int mandatory) {
            Builder.this.mandatory = mandatory;
            return new FinalBuilder();
        }
        /**
         * After all mandatory fields are set, this builder is returned which allows
         * setting all fields and constructing a new OneMandatoryField instance by calling {@link #build build}.
         */
        public class FinalBuilder {
            FinalBuilder() { }
            /**
             * Sets mandatory.
             */
            public FinalBuilder setMandatory(int mandatory) {
                Builder.this.mandatory = mandatory;
                return this;
            }
            public OneMandatoryField build() {
                return new OneMandatoryField(mandatory);
            }
        }
    }
}