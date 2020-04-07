// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/Export.h"
#include <string>
namespace smoke {
class _GLUECODIUM_CPP_EXPORT StringsWithCstring {
public:
    StringsWithCstring();
    virtual ~StringsWithCstring() = 0;
public:
    _GLUECODIUM_CPP_EXPORT static const char* CSTRING_CONSTANT;
public:
    /**
     * Method that takes a C string as input and returns an std::string it as output.
     * \param[in] input_string
     * \return
     */
    static ::std::string return_input_string( const char* input_string );
    /**
     * Method that always returns "hello" as a C string.
     * \return
     */
    static const char* return_hello_string(  );
};
}
