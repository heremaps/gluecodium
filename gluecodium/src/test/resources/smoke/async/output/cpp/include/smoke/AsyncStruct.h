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
    void async_void( std::function<void()> _completer_callback, const bool input ) const;
    void async_void( const bool input ) const;
    void async_void_throws( std::function<void(bool, ::std::string)> _completer_callback, const bool input ) const;
    ::gluecodium::Return< void, ::std::string > async_void_throws( const bool input ) const;
    void async_int( std::function<void(int32_t)> _completer_callback, const bool input ) const;
    int32_t async_int( const bool input ) const;
    void async_int_throws( std::function<void(bool, int32_t, ::std::string)> _completer_callback, const bool input ) const;
    ::gluecodium::Return< int32_t, ::std::string > async_int_throws( const bool input ) const;
    static void async_static( std::function<void()> _completer_callback, const bool input );
    static void async_static( const bool input );
};
}
