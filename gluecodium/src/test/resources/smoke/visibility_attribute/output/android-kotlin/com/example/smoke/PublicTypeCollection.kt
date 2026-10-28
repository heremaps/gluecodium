/*

 *
 */

@file:JvmName("PublicTypeCollectionExtensions")

package com.example.smoke


class PublicTypeCollection {

    internal class InternalStruct {
        @JvmField @JvmSynthetic internal var stringField: String



        private constructor(stringField: String) {
            this.stringField = stringField
        }





        @JvmSynthetic @JvmName("fooBar") internal external fun fooBar() : Unit


        internal companion object {
            @JvmSynthetic internal operator fun invoke(stringField: String): InternalStruct = InternalStruct(stringField)
        }
    }








}

