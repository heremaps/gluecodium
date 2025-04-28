/*

 *
 */

@file:JvmName("LearnToReadAgain")

package com.example.smoke

import com.example.smoke.bar.Alphabet
import com.example.smoke.foo.Alphabet

class LearnToReadAgain {
    @JvmField var fieldB: Alphabet
    @JvmField var fieldC: Alphabet



    constructor() {
        this.fieldB = Alphabet.BETA
        this.fieldC = Alphabet.GIMEL
    }





}

