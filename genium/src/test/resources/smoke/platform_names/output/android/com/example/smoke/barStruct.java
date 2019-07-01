/*
 *
 * Automatically generated. Do not modify. Your changes will be lost.
 */
package com.example.smoke;
public class barStruct {
    public String BAR_FIELD;
    public barStruct(final String BarParameter) {
        barStruct _other = BarCreate(BarParameter);
        this.BAR_FIELD = _other.BAR_FIELD;
    }
    private static native barStruct BarCreate(final String BarParameter);
}
