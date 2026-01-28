/*

 *
 */

@file:JvmName("InternalLambdaExtensions")


package com.example.smoke


internal fun interface InternalLambda {


    @JvmSynthetic fun apply() : Unit
}

