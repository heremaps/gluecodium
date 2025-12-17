/*

 *
 */

@file:JvmName("PublicTypeCollectionExtensions")

package com.example.smoke


class PublicTypeCollection {

    internal class InternalStruct {
        @JvmField @JvmSynthetic internal var stringField: String



        internal constructor(stringField: String) {
            this.stringField = stringField
        }





        external fun fooBar() : Unit


    }








}

