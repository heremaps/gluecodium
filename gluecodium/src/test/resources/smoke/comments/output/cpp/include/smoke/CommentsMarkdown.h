// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium\ExportGluecodiumCpp.h"
namespace smoke {
/**
 * First line.
 * Second line.
 *
 * Another paragraph. **bold** and *italic* and `code`.
 *
 * > blockquote
 *
 * # Heading one
 *
 * ## Heading two
 *
 * ### Heading three
 *
 * Unordered list:
 * - A
 * - B
 *
 * Ordered list:
 * 1. foo
 * 2. bar
 *
 * ---
 *
 * [title](https://www.markdownguide.org/cheat-sheet/)
 */
class _GLUECODIUM_CPP_EXPORT CommentsMarkdown {
public:
    CommentsMarkdown();
    virtual ~CommentsMarkdown() = 0;
};
}
