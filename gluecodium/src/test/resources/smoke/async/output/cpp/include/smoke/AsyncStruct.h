// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/Return.h"
#include <cstdint>
#include <functional>
#include <string>

namespace smoke {
struct _GLUECODIUM_CPP_EXPORT AsyncStruct {
    ::std::string string_field;

    AsyncStruct( );
    explicit AsyncStruct( ::std::string string_field );

    void async_void( std::function<void()> _result_callback, const bool input ) const;

    void async_void_throws( std::function<void()> _result_callback, std::function<void(::std::string)> _error_callback, const bool input ) const;

    void async_int( std::function<void(int32_t)> _result_callback, const bool input ) const;

    void async_int_throws( std::function<void(int32_t)> _result_callback, std::function<void(::std::string)> _error_callback, const bool input ) const;

    static void async_static( std::function<void()> _result_callback, const bool input );


};


}
