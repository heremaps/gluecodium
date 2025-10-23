/*

 *
 */

@file:JvmName("typesExtensions")

package com.example.package


class Types {

    enum class Enum(@JvmField val value: Int) {
        NA_N(0);
    }
    class ExceptionException(@JvmField val error: Types.Enum) : Exception(error.toString())


    class Struct {
        @JvmField var Null: Types.Enum



        constructor() {
            this.Null = Types.Enum.NA_N
        }





    }








    companion object {
        @JvmField final val CONST: Types.Enum = Types.Enum.NA_N
    }
}

