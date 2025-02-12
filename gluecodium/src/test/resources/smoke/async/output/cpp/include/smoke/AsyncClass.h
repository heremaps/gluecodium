// -------------------------------------------------------------------------------------------------
//

//
// -------------------------------------------------------------------------------------------------

#pragma once

#include "gluecodium/ExportGluecodiumCpp.h"
#include "gluecodium/Return.h"
#include "smoke/AsyncErrorCode.h"
#include <cstdint>
#include <functional>
#include <system_error>

namespace smoke {
class _GLUECODIUM_CPP_EXPORT AsyncClass {
public:
    AsyncClass();
    virtual ~AsyncClass();


public:
    virtual void async_void( std::function<void()> _result_callback, const bool input ) = 0;

    virtual void async_void_throws( std::function<void()> _result_callback, std::function<void(::smoke::AsyncErrorCode)> _error_callback, const bool input ) = 0;

    virtual void async_int( std::function<void(int32_t)> _result_callback, const bool input ) = 0;

    virtual void async_int_throws( std::function<void(int32_t)> _result_callback, std::function<void(::smoke::AsyncErrorCode)> _error_callback, const bool input ) = 0;

    static void async_static( std::function<void()> _result_callback, const bool input );

};


}
