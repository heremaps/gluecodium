/*

 *
 */

@file:JvmName("MapScene")

package com.example.smoke

import com.example.NativeBase

class MapScene : NativeBase {

    fun interface LoadSceneCallback {
        fun apply(p0: String?) : Unit
    }

    /**
     * @suppress
     */
    class LoadSceneCallbackImpl : NativeBase, LoadSceneCallback {
        protected constructor(nativeHandle: Long, tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}

        override external fun apply(p0: String?) : Unit



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
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



    external fun loadScene(mapScheme: Int, callback: MapScene.LoadSceneCallback?) : Unit
    external fun loadScene(configurationFile: String, callback: MapScene.LoadSceneCallback?) : Unit




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}
