/*
 *
 */
package com.example.smoke;
@OnEnumeration
public enum AttributesEnum {
    @OnEnumerator
    NOPE(0);
    public final int value;
    AttributesEnum(final int value) {
        this.value = value;
    }
}
