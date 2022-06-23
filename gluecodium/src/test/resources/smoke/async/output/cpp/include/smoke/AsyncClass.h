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
    virtual ~AsyncClass() = 0;
public:
    virtual void async_void( std::function<void()> _result_callback, const bool input ) = 0;
    virtual void async_void( const bool input ) = 0;
    virtual void async_void_throws( std::function<void()> _result_callback, std::function<void(::smoke::AsyncErrorCode)> _error_callback, const bool input ) = 0;
    virtual ::std::error_code async_void_throws( const bool input ) = 0;
    virtual void async_int( std::function<void(int32_t)> _result_callback, const bool input ) = 0;
    virtual int32_t async_int( const bool input ) = 0;
    virtual void async_int_throws( std::function<void(int32_t)> _result_callback, std::function<void(::smoke::AsyncErrorCode)> _error_callback, const bool input ) = 0;
    virtual ::gluecodium::Return< int32_t, ::std::error_code > async_int_throws( const bool input ) = 0;
    static void async_static( std::function<void()> _result_callback, const bool input );
    static void async_static( const bool input );
};
}
