/*

 *
 */

package com.example.smoke


interface ExternalInterface {
    enum class SomeEnum(private val value: Int) {
        SOME_VALUE(0);
    }
    class SomeStruct {
        var someField: String



        constructor(someField: String) {
            this.someField = someField
        }




    }


    fun someMethod(someParameter: Byte) : Unit

    val someProperty: String
        get


}

