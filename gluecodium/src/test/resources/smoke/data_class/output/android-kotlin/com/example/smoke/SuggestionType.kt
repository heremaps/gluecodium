/*

 *
 */

@file:JvmName("SuggestionTypeExtensions")


package com.example.smoke


/**
 * The kind of a search suggestion.
 */
enum class SuggestionType(@JvmField val value: Int) {
    CATEGORY(0),
    CHAIN(1),
    PLACE(2);
}
