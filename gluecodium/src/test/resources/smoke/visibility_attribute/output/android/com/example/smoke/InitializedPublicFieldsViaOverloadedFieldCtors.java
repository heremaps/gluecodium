/*

 *
 */

package com.example.smoke;

import android.support.annotation.NonNull;

/**
 * <p>Test case 3
 * <p>Input:
 * <ul>
 * <li>This structure does not define explicit constructors / field constructors.</li>
 * <li>It has three public fields with default values.</li>
 * <li>All fields use struct type and we check if the name of constructor is properly resolved.</li>
 * </ul>
 * <p>Expected outcome:
 * <ul>
 * <li>Generated initialized values ctor properly resolves names.</li>
 * </ul>
 */
public final class InitializedPublicFieldsViaOverloadedFieldCtors {
    @NonNull
    public StructWithNamedFieldConstructors initializedField1;
    @NonNull
    public StructWithNamedFieldConstructors initializedField2;
    @NonNull
    public StructWithNamedFieldConstructors initializedField3;

    public InitializedPublicFieldsViaOverloadedFieldCtors() {
        this.initializedField1 = new StructWithNamedFieldConstructors("abc", "def", 9, 11);
        this.initializedField2 = new StructWithNamedFieldConstructors("abc", "def", 123);
        this.initializedField3 = new StructWithNamedFieldConstructors("abc", "def");
    }


}

