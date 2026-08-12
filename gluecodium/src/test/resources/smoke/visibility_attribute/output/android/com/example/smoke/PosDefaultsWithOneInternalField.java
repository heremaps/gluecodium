/*

 *
 */

package com.example.smoke;

import android.support.annotation.NonNull;

/**
 * <p>Test case 4
 * <p>Input:
 * <ul>
 * <li>The structure uses <code>PositionalDefaults</code> and should get such constructor.</li>
 * <li>This structure does not define other constructors / field constructors.</li>
 * <li>It has one public field with default value.</li>
 * <li>One of fields is internal.</li>
 * </ul>
 * <p>Expected outcome:
 * <ul>
 * <li>Generated positional defaults constructor is not public (because it would expose internal field).</li>
 * </ul>
 */
public final class PosDefaultsWithOneInternalField {
    @NonNull
    String internalField;
    public boolean publicField;
    public int initializedField;

    PosDefaultsWithOneInternalField(@NonNull final String internalField, final boolean publicField) {
        this.internalField = internalField;
        this.publicField = publicField;
        this.initializedField = 77;
    }

    public PosDefaultsWithOneInternalField(@NonNull final String internalField, final boolean publicField, final int initializedField) {
        this.internalField = internalField;
        this.publicField = publicField;
        this.initializedField = initializedField;
    }


}

