/*

 *
 */

package com.example.smoke

import com.example.smoke.dodoTypes

class dodoTypes {

    enum class dodoEnum(private val value: Int) {
        DODO_ITEM(0);
    }
    class dodoStruct {
        var DODO_FIELD: String


        constructor(DodoParameter: String) {
            val _other = DodoCreate(DodoParameter)
            this.DODO_FIELD = _other.DODO_FIELD
        }





        companion object {
            @JvmStatic external fun DodoCreate(DodoParameter: String) : dodoStruct
        }
    }







}

