/*

 *
 */

package com.example.smoke;

import android.support.annotation.NonNull;

/**
 * <p>A helper structure for test case 3.
 * It defines a few named field constructors.
 * All fields are public.
 * Two of them are initialized.
 */
public final class StructWithNamedFieldConstructors {
    @NonNull
    public String field1;
    @NonNull
    public String field2;
    public int initializedField1;
    public int initializedField2;

    public StructWithNamedFieldConstructors(@NonNull final String field1, @NonNull final String field2, final int initializedField1, final int initializedField2) {
        this.field1 = field1;
        this.field2 = field2;
        this.initializedField1 = initializedField1;
        this.initializedField2 = initializedField2;
    }

    public StructWithNamedFieldConstructors(@NonNull final String field1, @NonNull final String field2) {
        this.field1 = field1;
        this.field2 = field2;
        this.initializedField1 = 77;
        this.initializedField2 = 101;
    }

    public StructWithNamedFieldConstructors(@NonNull final String field1, @NonNull final String field2, final int initializedField1) {
        this.field1 = field1;
        this.field2 = field2;
        this.initializedField1 = initializedField1;
        this.initializedField2 = 101;
    }


}

