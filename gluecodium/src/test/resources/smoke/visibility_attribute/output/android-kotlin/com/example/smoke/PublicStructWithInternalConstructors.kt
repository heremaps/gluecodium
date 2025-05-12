/*

 *
 */

@file:JvmName("PublicStructWithInternalConstructors")

package com.example.smoke


class PublicStructWithInternalConstructors {
    @JvmField var someVar: Int



    internal constructor() {
        val _other = make()
        this.someVar = _other.someVar
    }


    internal constructor(someVar: Int) {
        this.someVar = someVar
    }





    companion object {
        @JvmStatic internal external fun make() : PublicStructWithInternalConstructors
    }
}

