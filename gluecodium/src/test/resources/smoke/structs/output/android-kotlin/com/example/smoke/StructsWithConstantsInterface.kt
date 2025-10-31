/*

 *
 */

@file:JvmName("StructsWithConstantsInterfaceExtensions")

package com.example.smoke

import com.example.NativeBase

class StructsWithConstantsInterface : NativeBase {

    class MultiRoute {
        @JvmField var descriptions: List<@JvmSuppressWildcards String>
        @JvmField var type: RouteUtils.RouteType



        constructor(descriptions: List<@JvmSuppressWildcards String>, type: RouteUtils.RouteType) {
            this.descriptions = descriptions
            this.type = type
        }





        companion object {
            @JvmField final val DEFAULT_DESCRIPTION: String = "Foo"
            @JvmField final val DEFAULT_TYPE: RouteUtils.RouteType = RouteUtils.RouteType.NONE
        }
    }

    class StructWithConstantsOnly {








        companion object {
            @JvmField final val DEFAULT_DESCRIPTION: String = "Foo"
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


