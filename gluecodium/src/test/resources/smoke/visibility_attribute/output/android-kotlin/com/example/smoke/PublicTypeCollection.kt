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





        @JvmSynthetic @JvmName("fooBar") internal external fun fooBar() : Unit


    }








}

