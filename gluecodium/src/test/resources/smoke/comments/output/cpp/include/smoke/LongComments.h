// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include <string>

namespace smoke {
/**
 * This is some very useful interface. There is a lot to say about this interface. at least it has a long comment.
 * This is a placeholder, which has multiple lines. Here we have continuation of the first line.
 * But this should be rendered in line below.
 * This too!

 */
class _GLUECODIUM_CPP_EXPORT LongComments {
public:
    LongComments();
    virtual ~LongComments();


public:
    /**
     * This is very important method. It has very important parameters. It has side effects.
     * \param[in] input Very useful input parameter. You must not confuse it with the second parameter. But they are similar.
     * \param[in] ratio Not as useful as the first parameter. But still useful. use a positive value for more happiness.
     * \return If you provide a useful input and a useful ratio you can expect a useful output. Just kidding do not expect anything from a method until you see its body.
     */
    virtual float some_method_with_long_comment( const ::std::string& input, const double ratio ) = 0;
};


}
