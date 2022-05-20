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
class _GLUECODIUM_CPP_EXPORT AsyncClass {
public:
    AsyncClass();
    virtual ~AsyncClass() = 0;
public:
    virtual void async_void( std::function<void()> _completer_callback, const bool input ) = 0;
    virtual void async_void( const bool input ) = 0;
    virtual void async_void_throws( std::function<void(bool, ::std::string)> _completer_callback, const bool input ) = 0;
    virtual ::gluecodium::Return< void, ::std::string > async_void_throws( const bool input ) = 0;
    virtual void async_int( std::function<void(int32_t)> _completer_callback, const bool input ) = 0;
    virtual int32_t async_int( const bool input ) = 0;
    virtual void async_int_throws( std::function<void(bool, int32_t, ::std::string)> _completer_callback, const bool input ) = 0;
    virtual ::gluecodium::Return< int32_t, ::std::string > async_int_throws( const bool input ) = 0;
    static void async_static( std::function<void()> _completer_callback, const bool input );
    static void async_static( const bool input );
};
}
