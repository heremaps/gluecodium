/*
 *
 */
package com.example.smoke;
import android.support.annotation.NonNull;
public final class LearnToReadAgain {
    @NonNull
    public com.example.smoke.foo.Alphabet fieldB;
    @NonNull
    public com.example.smoke.bar.Alphabet fieldC;
    public LearnToReadAgain() {
        this.fieldB = com.example.smoke.foo.Alphabet.BETA;
        this.fieldC = com.example.smoke.bar.Alphabet.GIMEL;
    }
    public LearnToReadAgain(@NonNull final com.example.smoke.foo.Alphabet fieldB, @NonNull final com.example.smoke.bar.Alphabet fieldC) {
        this.fieldB = fieldB;
        this.fieldC = fieldC;
    }
}
