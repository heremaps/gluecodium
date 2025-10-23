/*

 *
 */

@file:JvmName("MapSceneExtensions")

package com.example.smoke

import com.example.NativeBase

/**
 * Referencing some type [com.example.smoke.MapScene.loadScene].
 */
class MapScene : NativeBase {

    fun interface LoadSceneCallback {


        fun apply(p0: String?) : Unit
    }

    /**
     * @suppress
     */
    class LoadSceneCallbackImpl : NativeBase, LoadSceneCallback {
        protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
            : super(nativeHandle, { disposeNativeHandle(it) }) {}



        override external fun apply(p0: String?) : Unit



        companion object {
            @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
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





    external fun loadScene(mapScheme: Int, callback: MapScene.LoadSceneCallback?) : Unit


    external fun loadScene(configurationFile: String, callback: MapScene.LoadSceneCallback?) : Unit




    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
    }
}

