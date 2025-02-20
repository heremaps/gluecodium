/*

 *
 */

package com.example.smoke

import com.example.NativeBase

class StructsWithConstantsInterface : NativeBase {

    class MultiRoute {
        var descriptions: MutableList<String>
        var type: RouteUtils.RouteType



        constructor(descriptions: MutableList<String>, type: RouteUtils.RouteType) {
            this.descriptions = descriptions
            this.type = type
        }



        companion object {
            val DEFAULT_DESCRIPTION: String = "Foo"
            val DEFAULT_TYPE: RouteUtils.RouteType = RouteUtils.RouteType.NONE
        }
    }

    class StructWithConstantsOnly {






        companion object {
            val DEFAULT_DESCRIPTION: String = "Foo"
        }
    }



    /*
     * For internal use only.
     * @hidden
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}






    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
