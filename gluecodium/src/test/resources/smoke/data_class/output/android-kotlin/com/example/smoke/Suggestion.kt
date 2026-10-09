/*

 *
 */

@file:JvmName("SuggestionExtensions")


package com.example.smoke


/**
 * An immutable representation of a single search suggestion.
 */
data class Suggestion(
    /**
     * The human-readable title of the suggestion.
     */
    val title: String,
    /**
     * The kind of the suggestion.
     */
    val type: SuggestionType,
    /**
     * The place this suggestion resolves to, if already known.
     */
    val place: Place? = null,
    /**
     * The unique identifier of the suggestion, if any.
     */
    val id: String? = null,
    /**
     * A reference that can be used to resolve this suggestion into a place, if any.
     */
    val href: String? = null
) {




    /**
     * Returns the character ranges within the title that matched the search query.
     * @return
     */

    external fun getHighlights() : Map<String, List<Int>>


}

