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




    val cachedProperty: List<String>
        get() {
            if (!is_cached_cachedProperty) {
                cache_cachedProperty = getCachedProperty_private()
                is_cached_cachedProperty = true
            }

            return cache_cachedProperty!!
        }

    private var is_cached_cachedProperty = false
    private var cache_cachedProperty: List<String>? = null
    external private fun getCachedProperty_private() : List<String>


    internal val internalCachedProperty: List<String>
        @JvmSynthetic get() {
            if (!is_cached_internalCachedProperty) {
                cache_internalCachedProperty = getInternalCachedProperty_private()
                is_cached_internalCachedProperty = true
            }

            return cache_internalCachedProperty!!
        }

    private var is_cached_internalCachedProperty = false
    private var cache_internalCachedProperty: List<String>? = null
    external private fun getInternalCachedProperty_private() : List<String>





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


        @JvmStatic internal val internalStaticCachedProperty: ByteArray
            @JvmSynthetic get() {
                if (!is_cached_internalStaticCachedProperty) {
                    cache_internalStaticCachedProperty = getInternalStaticCachedProperty_private()
                    is_cached_internalStaticCachedProperty = true
                }

                return cache_internalStaticCachedProperty!!
            }

        @JvmStatic private var is_cached_internalStaticCachedProperty = false
        @JvmStatic private var cache_internalStaticCachedProperty: ByteArray? = null
        @JvmStatic external private fun getInternalStaticCachedProperty_private() : ByteArray


    }
}


@JvmSynthetic
fun CachedProperties.Companion.getStaticCachedProperty(): ByteArray = CachedProperties.staticCachedProperty

@JvmSynthetic
internal fun CachedProperties.Companion.getInternalStaticCachedProperty(): ByteArray = CachedProperties.internalStaticCachedProperty

