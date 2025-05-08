/*

 *
 */

@file:JvmName("PublicInterface")

package com.example.smoke


interface PublicInterface {
    class InternalStruct {
        @JvmField var fieldOfInternalType: PublicClass.InternalStruct



        constructor(fieldOfInternalType: PublicClass.InternalStruct) {
            this.fieldOfInternalType = fieldOfInternalType
        }





    }




}

