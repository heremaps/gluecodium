/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
/**
 * <p>This is also nicely documented</p>
 */
public final class AllOptional {
    /**
     * <p>This field may or may not be set</p>
     */
    public int field0;
    /**
     * <p>This field is also optional</p>
     */
    public int field1;
    /**
     * <p>This field is not mandatory</p>
     */
    public int field2;
    /**
     * <p>This field has a default</p>
     */
    public int field3;
    /**
     * <p>Create this all optional struct</p>
     */
    public AllOptional() {
        this.field0 = 0;
        this.field1 = 1;
        this.field2 = 2;
        this.field3 = 3;
    }
    /**
     * <p>Create this all optional struct</p>
     * @param field0 <p>This field may or may not be set</p>
     * @param field1 <p>This field is also optional</p>
     * @param field2 <p>This field is not mandatory</p>
     * @param field3 <p>This field has a default</p>
     */
    public AllOptional(final int field0, final int field1, final int field2, final int field3) {
        this.field0 = field0;
        this.field1 = field1;
        this.field2 = field2;
        this.field3 = field3;
    }
    /**
     * Allows to construct a new AllOptional instance by calling the desired setters one after the other in any order.
     */
    public static class Builder {
        private int field0 = 0;
        private int field1 = 1;
        private int field2 = 2;
        private int field3 = 3;
        public Builder() { }
        /**
         * Sets field0.
         * @param field0 <p>This field may or may not be set</p>
         */
        public Builder setField0(int field0) {
            Builder.this.field0 = field0;
            return this;
        }
        /**
         * Sets field1.
         * @param field1 <p>This field is also optional</p>
         */
        public Builder setField1(int field1) {
            Builder.this.field1 = field1;
            return this;
        }
        /**
         * Sets field2.
         * @param field2 <p>This field is not mandatory</p>
         */
        public Builder setField2(int field2) {
            Builder.this.field2 = field2;
            return this;
        }
        /**
         * Sets field3.
         * @param field3 <p>This field has a default</p>
         */
        public Builder setField3(int field3) {
            Builder.this.field3 = field3;
            return this;
        }
        /**
         * <p>Create this all optional struct</p>
         */
        public AllOptional build() {
            return new AllOptional(field0, field1, field2, field3);
        }
    }
}
