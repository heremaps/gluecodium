/*

 *
 */

@file:JvmName("PlaceExtensions")


package com.example.smoke


/**
 * An immutable representation of a searchable place.
 */
data class Place(
    /**
     * The human-readable name of the place.
     */
    val title: String,
    /**
     * The unique identifier of the place.
     */
    val id: String,
    /**
     * The kind of the place.
     */
    val placeType: PlaceType,
    /**
     * The latitude of the place, in degrees.
     */
    val latitude: Double,
    /**
     * The longitude of the place, in degrees.
     */
    val longitude: Double,
    /**
     * The distance from the search origin to the place, in meters, if known.
     */
    val distanceInMeters: Int? = null,
    /**
     * The political view under which this place was resolved, if any.
     */
    val politicalView: String? = null
) {




    /**
     * Serializes this place into a compact string representation.
     * @return
     */

    external fun serializeCompact() : String


    companion object {
        /**
         * Deserializes a place from its compact string representation.
         * @param serializedPlace
         * @return
         */

        @JvmStatic external fun deserialize(serializedPlace: String) : Place
    }
}

