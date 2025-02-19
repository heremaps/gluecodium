/*

 *
 */

package com.example.smoke;


public interface SkipProxy {

    boolean notInSwift(final boolean input);

    float notInDart(final float input);

    float notInKotlin(final float input);

    boolean isSkippedInSwift();

    void setSkippedInSwift(final boolean value);

    float getSkippedInDart();

    void setSkippedInDart(final float value);

    float getSkippedInKotlin();

    void setSkippedInKotlin(final float value);
}

