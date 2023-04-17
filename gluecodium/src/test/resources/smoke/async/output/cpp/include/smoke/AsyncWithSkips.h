// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <functional>
#include <string>
namespace smoke {
class _GLUECODIUM_CPP_EXPORT AsyncWithSkips {
public:
    AsyncWithSkips();
    virtual ~AsyncWithSkips() = 0;
public:
    static void make_shared_instance( const ::std::string& android_context );
    static void make_shared_instance( std::function<void()> _result_callback );
    static void make_shared_instance(  );
};
}
