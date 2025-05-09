/*

 *
 */

@file:JvmName("OuterStructWithFieldConstructor")

package com.example.smoke


class OuterStructWithFieldConstructor {
    @JvmField var outerStructField: OuterStructWithFieldConstructor.InnerStructWithDefaults

    class InnerStructWithDefaults {
        @JvmField var innerStructField: Double



        constructor() {
            this.innerStructField = 1.0
        }





    }




    constructor(outerStructField: OuterStructWithFieldConstructor.InnerStructWithDefaults) {
        this.outerStructField = outerStructField
    }





}

