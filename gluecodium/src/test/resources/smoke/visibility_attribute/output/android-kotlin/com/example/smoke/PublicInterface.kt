/*

 *
 */

package com.example.smoke


interface PublicInterface {
    class InternalStruct {
        internal var fieldOfInternalType: PublicClass.InternalStruct



        internal constructor(fieldOfInternalType: PublicClass.InternalStruct) {
            this.fieldOfInternalType = fieldOfInternalType
        }




    }




}

