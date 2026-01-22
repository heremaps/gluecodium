/*

 *
 */

@file:JvmName("StructsWithMethodsInterfaceExtensions")


package com.example.smoke

import com.example.NativeBase

class StructsWithMethodsInterface : NativeBase {

    class Vector3 {
        @JvmField var x: Double
        @JvmField var y: Double
        @JvmField var z: Double





       constructor(input: String) {
            val _other = create(input)
            this.x = _other.x
            this.y = _other.y
            this.z = _other.z
        }


    @Throws(ValidationUtils.ValidationException::class)
       constructor(other: StructsWithMethodsInterface.Vector3) {
            val _other = create(other)
            this.x = _other.x
            this.y = _other.y
            this.z = _other.z
        }






        external fun distanceTo(other: StructsWithMethodsInterface.Vector3) : Double


        external fun add(other: StructsWithMethodsInterface.Vector3) : StructsWithMethodsInterface.Vector3


        companion object {


            @JvmStatic external fun validate(x: Double, y: Double, z: Double) : Boolean

            @JvmStatic private external fun create(input: String) : Vector3
            @Throws(ValidationUtils.ValidationException::class)
            @JvmStatic private external fun create(other: StructsWithMethodsInterface.Vector3) : Vector3
        }
    }

    class StructWithStaticMethodsOnly {








        companion object {


            @JvmStatic external fun doStuff() : Unit
        }
    }



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}







    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}


