/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
import com.example.smoke.foo.Alphabet;
public final class LearnToRead {
    @NonNull
    public com.example.smoke.Alphabet fieldA;
    @NonNull
    public com.example.smoke.foo.Alphabet fieldB;
    public LearnToRead() {
        this.fieldA = com.example.smoke.Alphabet.A;
        this.fieldB = com.example.smoke.foo.Alphabet.BETA;
    }
    public LearnToRead(@NonNull final com.example.smoke.Alphabet fieldA, @NonNull final com.example.smoke.foo.Alphabet fieldB) {
        this.fieldA = fieldA;
        this.fieldB = fieldB;
    }
}
