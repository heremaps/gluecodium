/*
 *
 */
package com.example.smoke;
public final class ManyMandatoryAndOptionalFields {
    public int mandatory;
    public int alsoMandatory;
    public int moreMandatory;
    public int evenMoreMandatory;
    public int optional;
    public int alsoOptional;
    public int stillOptional;
    public ManyMandatoryAndOptionalFields(final int mandatory, final int alsoMandatory, final int moreMandatory, final int evenMoreMandatory) {
        this.mandatory = mandatory;
        this.alsoMandatory = alsoMandatory;
        this.moreMandatory = moreMandatory;
        this.evenMoreMandatory = evenMoreMandatory;
        this.optional = 1;
        this.alsoOptional = 2;
        this.stillOptional = 3;
    }
    public ManyMandatoryAndOptionalFields(final int mandatory, final int alsoMandatory, final int moreMandatory, final int evenMoreMandatory, final int optional, final int alsoOptional, final int stillOptional) {
        this.mandatory = mandatory;
        this.alsoMandatory = alsoMandatory;
        this.moreMandatory = moreMandatory;
        this.evenMoreMandatory = evenMoreMandatory;
        this.optional = optional;
        this.alsoOptional = alsoOptional;
        this.stillOptional = stillOptional;
    }
    /**
     * Allows to construct a new ManyMandatoryAndOptionalFields instance by calling the following setters for mandatory fields in the
     * following order before {@link FinalBuilder#build build} can be called:
     * <pre>
     *
     * ManyMandatoryAndOptionalFields instance = new ManyMandatoryAndOptionalFields.Builder()
     *     .setMandatory(mandatory)
     *     .setAlsoMandatory(alsoMandatory)
     *     .setMoreMandatory(moreMandatory)
     *     .setEvenMoreMandatory(evenMoreMandatory)
     *     .build();
     * </pre>
     * Setters for optional fields that already have a default value assigned can be chained in any desired order. The following setters are optional:
     * <ul>
     *     <li>{@link FinalBuilder#setOptional setOptional(optional)}</li>
     *     <li>{@link FinalBuilder#setAlsoOptional setAlsoOptional(alsoOptional)}</li>
     *     <li>{@link FinalBuilder#setStillOptional setStillOptional(stillOptional)}</li>
     * </ul>
     * @deprecated <p>To create a new instance use one of the available constructors.</p>
     */
    @Deprecated
    public static class Builder {
        private int mandatory = 0;
        private int alsoMandatory = 0;
        private int moreMandatory = 0;
        private int evenMoreMandatory = 0;
        private int optional = 1;
        private int alsoOptional = 2;
        private int stillOptional = 3;
        public Builder() { }
        /**
         * Sets mandatory.
         */
        public PartialBuilder1 setMandatory(int mandatory) {
            Builder.this.mandatory = mandatory;
            return new PartialBuilder1();
        }
        /** @exclude */
        public class PartialBuilder1 {
            PartialBuilder1() { }
            /**
             * Sets alsoMandatory.
             */
            public PartialBuilder2 setAlsoMandatory(int alsoMandatory) {
                Builder.this.alsoMandatory = alsoMandatory;
                return new PartialBuilder2();
            }
        }
        /** @exclude */
        public class PartialBuilder2 {
            PartialBuilder2() { }
            /**
             * Sets moreMandatory.
             */
            public PartialBuilder3 setMoreMandatory(int moreMandatory) {
                Builder.this.moreMandatory = moreMandatory;
                return new PartialBuilder3();
            }
        }
        /** @exclude */
        public class PartialBuilder3 {
            PartialBuilder3() { }
            /**
             * Sets evenMoreMandatory.
             */
            public FinalBuilder setEvenMoreMandatory(int evenMoreMandatory) {
                Builder.this.evenMoreMandatory = evenMoreMandatory;
                return new FinalBuilder();
            }
        }
        /**
         * After all mandatory fields are set, this builder is returned which allows
         * setting all fields and constructing a new ManyMandatoryAndOptionalFields instance by calling {@link #build build}.
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
            /**
             * Sets alsoMandatory.
             */
            public FinalBuilder setAlsoMandatory(int alsoMandatory) {
                Builder.this.alsoMandatory = alsoMandatory;
                return this;
            }
            /**
             * Sets moreMandatory.
             */
            public FinalBuilder setMoreMandatory(int moreMandatory) {
                Builder.this.moreMandatory = moreMandatory;
                return this;
            }
            /**
             * Sets evenMoreMandatory.
             */
            public FinalBuilder setEvenMoreMandatory(int evenMoreMandatory) {
                Builder.this.evenMoreMandatory = evenMoreMandatory;
                return this;
            }
            /**
             * Sets optional.
             */
            public FinalBuilder setOptional(int optional) {
                Builder.this.optional = optional;
                return this;
            }
            /**
             * Sets alsoOptional.
             */
            public FinalBuilder setAlsoOptional(int alsoOptional) {
                Builder.this.alsoOptional = alsoOptional;
                return this;
            }
            /**
             * Sets stillOptional.
             */
            public FinalBuilder setStillOptional(int stillOptional) {
                Builder.this.stillOptional = stillOptional;
                return this;
            }
            public ManyMandatoryAndOptionalFields build() {
                return new ManyMandatoryAndOptionalFields(mandatory, alsoMandatory, moreMandatory, evenMoreMandatory, optional, alsoOptional, stillOptional);
            }
        }
    }
}
