/*

 *
 */

@file:JvmName("EngineErrorExtensions")


package com.example.smoke


/**
 * Specifies possible errors that may result from the asynchronous engine work.
 */
enum class EngineError(@JvmField val value: Int) {
    /**
     * Generic internal error.
     */
    INTERNAL_ERROR(1),
    /**
     * An invalid input parameter.
     */
    INVALID_PARAMETER(2),
    /**
     * Engine on fire.
     */
    ENGINE_ON_FIRE(3);
}
