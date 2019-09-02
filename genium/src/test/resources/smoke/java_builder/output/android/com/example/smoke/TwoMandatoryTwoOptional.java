/*
 *

 */
package com.example.smoke;
/**
 * <p>Nicely documented struct</p>
 */
public final class TwoMandatoryTwoOptional {
    /**
     * <p>This field is important</p>
     */
    public boolean mandatory;
    /**
     * <p>This field is not so important</p>
     */
    public boolean optional;
    /**
     * <p>This field is very important</p>
     */
    public int alsoMandatory;
    /**
     * <p>This field is not at all important</p>
     */
    public int alsoOptional;
    /**
     * <p>Create this struct</p>
     * @param mandatory <p>This field is important</p>
     * @param alsoMandatory <p>This field is very important</p>
     */
    public TwoMandatoryTwoOptional(final boolean mandatory, final int alsoMandatory) {
        this.mandatory = mandatory;
        this.optional = true;
        this.alsoMandatory = alsoMandatory;
        this.alsoOptional = 8;
    }
    /**
     * <p>Create this struct</p>
     * @param mandatory <p>This field is important</p>
     * @param optional <p>This field is not so important</p>
     * @param alsoMandatory <p>This field is very important</p>
     * @param alsoOptional <p>This field is not at all important</p>
     */
    public TwoMandatoryTwoOptional(final boolean mandatory, final boolean optional, final int alsoMandatory, final int alsoOptional) {
        this.mandatory = mandatory;
        this.optional = optional;
        this.alsoMandatory = alsoMandatory;
        this.alsoOptional = alsoOptional;
    }
    /**
     * Allows to construct a new TwoMandatoryTwoOptional instance by calling the following setters for mandatory fields in the
     * following order before {@link FinalBuilder#build build} can be called:
     * <pre>
     *
     * TwoMandatoryTwoOptional instance = new TwoMandatoryTwoOptional.Builder()
     *     .setMandatory(mandatory)
     *     .setAlsoMandatory(alsoMandatory)
     *     .build();
     * </pre>
     * Setters for optional fields that already have a default value assigned can be chained in any desired order. The following setters are optional:
     * <ul>
     *     <li>{@link FinalBuilder#setOptional setOptional(optional)}</li>
     *     <li>{@link FinalBuilder#setAlsoOptional setAlsoOptional(alsoOptional)}</li>
     * </ul>
     */
    public static class Builder {
        private boolean mandatory = false;
        private boolean optional = true;
        private int alsoMandatory = 0;
        private int alsoOptional = 8;
        public Builder() { }
        /**
         * Sets mandatory.
         * @param mandatory <p>This field is important</p>
         */
        public PartialBuilder1 setMandatory(boolean mandatory) {
            Builder.this.mandatory = mandatory;
            return new PartialBuilder1();
        }
        /** @exclude */
        public class PartialBuilder1 {
            PartialBuilder1() { }
            /**
             * Sets alsoMandatory.
             * @param alsoMandatory <p>This field is very important</p>
             */
            public FinalBuilder setAlsoMandatory(int alsoMandatory) {
                Builder.this.alsoMandatory = alsoMandatory;
                return new FinalBuilder();
            }
        }
        /**
         * After all mandatory fields are set, this builder is returned which allows
         * setting all fields and constructing a new TwoMandatoryTwoOptional instance by calling {@link #build build}.
         */
        public class FinalBuilder {
            FinalBuilder() { }
            /**
             * Sets mandatory.
             * @param mandatory <p>This field is important</p>
             */
            public FinalBuilder setMandatory(boolean mandatory) {
                Builder.this.mandatory = mandatory;
                return this;
            }
            /**
             * Sets optional.
             * @param optional <p>This field is not so important</p>
             */
            public FinalBuilder setOptional(boolean optional) {
                Builder.this.optional = optional;
                return this;
            }
            /**
             * Sets alsoMandatory.
             * @param alsoMandatory <p>This field is very important</p>
             */
            public FinalBuilder setAlsoMandatory(int alsoMandatory) {
                Builder.this.alsoMandatory = alsoMandatory;
                return this;
            }
            /**
             * Sets alsoOptional.
             * @param alsoOptional <p>This field is not at all important</p>
             */
            public FinalBuilder setAlsoOptional(int alsoOptional) {
                Builder.this.alsoOptional = alsoOptional;
                return this;
            }
            /**
             * <p>Create this struct</p>
             */
            public TwoMandatoryTwoOptional build() {
                return new TwoMandatoryTwoOptional(mandatory, optional, alsoMandatory, alsoOptional);
            }
        }
    }
}
