// -------------------------------------------------------------------------------------------------
//
//
// -------------------------------------------------------------------------------------------------
#pragma once
#include "gluecodium/ExportGluecodiumCpp.h"
#include <functional>
namespace smoke {
class _GLUECODIUM_CPP_EXPORT AsyncRenamed {
public:
    AsyncRenamed();
    virtual ~AsyncRenamed() = 0;
public:
    virtual void callDispose( std::function<void()> _completer_callback ) = 0;
    virtual void callDispose(  ) = 0;
};
}
