/*

 *
 */

@file:JvmName("PlaceTypeExtensions")


package com.example.smoke


/**
 * The kind of a place.
 */
enum class PlaceType(@JvmField val value: Int) {
    POI(0),
    AREA(1),
    STREET(2);
}
