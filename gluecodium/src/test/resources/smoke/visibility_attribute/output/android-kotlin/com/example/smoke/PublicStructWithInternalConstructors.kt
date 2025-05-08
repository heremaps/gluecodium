/*

 *
 */

@file:JvmName("PublicStructWithInternalConstructors")

package com.example.smoke


class PublicStructWithInternalConstructors {
    @JvmField var someVar: Int



    constructor() {
        val _other = make()
        this.someVar = _other.someVar
    }


    constructor(someVar: Int) {
        this.someVar = someVar
    }





    companion object {
        @JvmStatic external fun make() : PublicStructWithInternalConstructors
    }
}

