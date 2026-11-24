/*

 *
 */

@file:JvmName("PublicStructWithInternalConstructorsExtensions")


package com.example.smoke


class PublicStructWithInternalConstructors {
    @JvmField var someVar: Int





   private constructor() {
        val _other = make()
        this.someVar = _other.someVar
    }



    private constructor(someVar: Int) {
        this.someVar = someVar
    }





    companion object {

        @JvmStatic @JvmSynthetic @JvmName("make") private external fun make() : PublicStructWithInternalConstructors
        @JvmSynthetic internal operator fun invoke(): PublicStructWithInternalConstructors = PublicStructWithInternalConstructors()
        @JvmSynthetic internal operator fun invoke(someVar: Int): PublicStructWithInternalConstructors = PublicStructWithInternalConstructors(someVar)
    }
}

