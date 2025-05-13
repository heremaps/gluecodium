/*

 *
 */

@file:JvmName("LearnToRead")

package com.example.smoke


class LearnToRead {
    @JvmField var fieldA: com.example.smoke.Alphabet
    @JvmField var fieldB: com.example.smoke.foo.Alphabet



    constructor() {
        this.fieldA = com.example.smoke.Alphabet.A
        this.fieldB = com.example.smoke.foo.Alphabet.BETA
    }





}

