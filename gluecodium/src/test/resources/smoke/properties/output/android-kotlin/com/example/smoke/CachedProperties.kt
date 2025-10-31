/*

 *
 */

@file:JvmName("CachedPropertiesExtensions")

package com.example.smoke

import com.example.NativeBase

class CachedProperties : NativeBase {



    /**
     * For internal use only.
     * @suppress
     * @param nativeHandle The handle to resources on C++ side.
     * @param tag Tag used by callers to avoid overload resolution problems.
     */
    protected constructor(nativeHandle: Long, @Suppress("UNUSED_PARAMETER") tag: Any?)
        : super(nativeHandle, { disposeNativeHandle(it) }) {}




    val cachedProperty: List<@JvmSuppressWildcards String>
        get() {
            if (!is_cached_cachedProperty) {
                cache_cachedProperty = getCachedProperty_private()
                is_cached_cachedProperty = true
            }

            return cache_cachedProperty!!
        }

    private var is_cached_cachedProperty = false
    private var cache_cachedProperty: List<@JvmSuppressWildcards String>? = null
    external private fun getCachedProperty_private() : List<@JvmSuppressWildcards String>





    companion object {
        @JvmStatic private external fun disposeNativeHandle(nativeHandle: Long)
        @JvmStatic val staticCachedProperty: ByteArray
            get() {
                if (!is_cached_staticCachedProperty) {
                    cache_staticCachedProperty = getStaticCachedProperty_private()
                    is_cached_staticCachedProperty = true
                }

                return cache_staticCachedProperty!!
            }

        @JvmStatic private var is_cached_staticCachedProperty = false
        @JvmStatic private var cache_staticCachedProperty: ByteArray? = null
        @JvmStatic external private fun getStaticCachedProperty_private() : ByteArray


    }
}

@JvmSynthetic
fun CachedProperties.Companion.getStaticCachedProperty(): ByteArray = CachedProperties.staticCachedProperty
