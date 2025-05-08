/*

 *
 */

@file:JvmName("PublicTypeCollection")

package com.example.smoke


class PublicTypeCollection {

    class InternalStruct {
        @JvmField var stringField: String



        constructor(stringField: String) {
            this.stringField = stringField
        }



        external fun fooBar() : Unit


    }








}

