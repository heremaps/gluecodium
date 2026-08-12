/*

 *
 */

package com.example.smoke;

import android.support.annotation.NonNull;

/**
 * <p>Test case 1
 * <p>Input:
 * <ul>
 * <li>This structure does not define explicit constructors / field constructors.</li>
 * <li>It has fields without default values.</li>
 * <li>One of fields is internal.</li>
 * </ul>
 * <p>Expected outcome:
 * <ul>
 * <li>Generated all args constructor is not public (because it would expose internal field).</li>
 * </ul>
 */
public final class NoCtorsUninitializedFieldsOneInternalField {
    @NonNull
    String internalField;
    public boolean publicField;

    NoCtorsUninitializedFieldsOneInternalField(@NonNull final String internalField, final boolean publicField) {
        this.internalField = internalField;
        this.publicField = publicField;
    }


}

